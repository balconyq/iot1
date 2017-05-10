<?php

require_once __DIR__.'/Workerman/Protocols/Protocol1/P1Handler.php';
require_once __DIR__.'/Workerman/Protocols/Protocol1/P1CmdPack.php';
require_once __DIR__.'/Workerman/Protocols/Protocol1/P1Format.php';
require_once __DIR__.'/Workerman/Protocols/Protocol1/P1Db.php';

use Workerman\Worker;
use Workerman\Lib\Timer;
use Workerman\Protocols\Protocol1;

$south_worker = new Worker("Protocol1://".LISTEN_NODE_IP.":".LISTEN_NODE_PORT);
$south_worker->name = 'South';
$south_worker->count = 1;
// 新增加一个属性，用来保存uid到connection的映射(uid是用户id或者客户端唯一标识)
$south_worker->uidConnections = array();

$g_P1Db = null;


// 定时器回调，实现心跳，用于识别节点异常关闭连接
function timer_handler($worker)
{
    $time_now = time();
    foreach ($worker->connections as $connection) 
    {
        // 有可能该connection还没收到过消息，则lastMessageTime设置为当前时间
        if (empty($connection->lastMessageTime)) {
            $connection->lastMessageTime = $time_now;
            continue;
        }
        // 上次通讯时间间隔大于心跳间隔，则认为客户端已经下线，关闭连接
        if ($time_now - $connection->lastMessageTime > HEARTBEAT_TIME) {
            $connection->close();
            // 通知APP节点连接已关闭
        }
    }
}

// 启动回调
$south_worker->onWorkerStart = function($south_worker)
{
    global $north_worker;
    global $g_P1Db;

    echo "south_worker starting...\n";

    // 建立、连接数据库
    $g_P1Db = new \Workerman\Protocols\Protocol1\P1Db();

    // 建立定时器
    //Timer::add(HEARTBEAT_LISTEN_TIME, 'timer_handler', array($south_worker), true);

    $north_worker = new Worker("websocket://".LISTEN_APP1_IP.":".LISTEN_APP1_PORT);
    $north_worker->name = 'North';
    $north_worker->count = 1;

    // 启动回调
    $north_worker->onWorkerStart = function($north_worker)
    {
        echo "north_worker starting...\n";
    };

    // 重启
    $north_worker->onWorkerReload = function($north_worker)
    {
        echo 'Worker Reload';
    };

    // 停止
    $north_worker->onWorkerStop = function($north_worker)
    {
        echo 'Worker Stop';
    };

    $north_worker->onConnect = function($connection)
    {
        global $north_worker;
        echo "[".$north_worker->name."]"." New connection from ip ".$connection->getRemoteIp().":".$connection->getRemotePort()."\n";
    };

    // 当客户端发来数据时
    $north_worker->onMessage = function($connection, $data)
    {
        global $south_worker;
        global $g_P1Db;

        $json_arr = json_decode($data, true);
        //print_r($json_arr);

        // trans command from web to data
        $ret_data = '';
        $command = intval($json_arr['command']);
        $ret = p1Pack($command, $json_arr['data'], $ret_data);

        $map = $g_P1Db->connect_get_by_uid($json_arr['uid']);
        //print_r($map);

        // 转发
        $id = $map['worker_id'].$map['connection_id'];
        $south_connection = $south_worker->uidConnections[$id];

        // 下包应该在节点返回后转回
        $south_connection->send($ret_data);
    };

    $north_worker->onClose = function($connection)
    {
        echo "\nconnection closed\n";
    };

    $north_worker->onError = function($connection, $code, $msg)
    {
        echo "error $code $msg\n";
    };

    $north_worker->listen();
};

// 重启
$south_worker->onWorkerReload = function($south_worker)
{
    echo 'Worker Reload';
};

// 停止
$south_worker->onWorkerStop = function($south_worker)
{
    echo 'Worker Stop';
};

$south_worker->onConnect = function($connection)
{
    global $south_worker;
    global $g_P1Db;
    
    $id = $south_worker->id.$connection->id;

    if (!empty($south_worker->uidConnections[$id]))
    {
        echo "Reconnect...";
    }

    $remote_ip = $connection->getRemoteIp();
    $remote_port = $connection->getRemotePort();

    echo "[".$south_worker->name."]"." New connection from ip ".$remote_ip.":".$remote_port."\n";

    // 更新关系表
    $south_worker->uidConnections[$id] = $connection;

    // 新关系存储到表中
    $map = array();
    $map['worker_id']      = $south_worker->id;
    $map['connection_id']  = $connection->id;
    $map['ip']             = $remote_ip;
    $g_P1Db->connection_add($map);
};

// 当客户端发来数据时
$south_worker->onMessage = function($connection, $data)
{
    global $south_worker;
    global $g_P1Db;

    // 给connection临时设置一个lastMessageTime属性，用来记录上次收到消息的时间
    $connection->lastMessageTime = time();

    $ret_data = '';

    // 根据command选择对应的handler
    if (null != $data['command'])
    {
        // 处理收包
        $ret = p1Parse($data, $ret_data);

        // 若为节点登录命令，则存储/更新map表内的uid
        if (CMD_LOGIN == $data['command'])
        {
            $map = array();
            $map['worker_id']       = $south_worker->id;
            $map['connection_id']   = $connection->id;
            $map['uid']             = $data['uid'];
            $g_P1Db->connect_update($map);
        }
    }

    // 发送回包
    $connection->send($ret_data);
};

$south_worker->onClose = function($connection)
{
    global $south_worker;
    global $g_P1Db;
    
    $id = $south_worker->id.$connection->id;

    // 删除表中记录的连接
    if (isset($south_worker->uidConnections[$id]))
    {
        unset($south_worker->uidConnections[$id]);
    }

    // 删除表中连接关系
    $map = array();
    $map['worker_id']      = $south_worker->id;
    $map['connection_id']  = $connection->id;
    $g_P1Db->connection_delete($map);

    echo "connection closed\n";
};

$south_worker->onError = function($connection, $code, $msg)
{
    echo "error $code $msg\n";
};


function transToFrame($json_arr)
{
    $ret_data = '';
    $package_head = array();

    $command = intval($json_arr['command']);

    $package_head['uid']    = intval($json_arr['uid']);
    $package_head['command']= $command;
    $package_head['state']  = 0x00;

    $ret = p1Pack($command, $json_arr['data'], $ret_data);

    return pkgEncode($ret_data, $package_head);
}