<?php

require_once __DIR__.'/Workerman/Vendor/GlobalData/src/Client.php';
require_once __DIR__.'/Workerman/Protocols/Protocol1/P1CmdPack.php';
require_once __DIR__.'/Workerman/Protocols/Protocol1/P1Format.php';
require_once __DIR__.'/Workerman/Protocols/Protocol1/P1Db.php';

use Workerman\Worker;
use Workerman\Protocols\Protocol1;

$north_worker = new Worker("websocket://".LISTEN_APP1_IP.":".LISTEN_APP1_PORT);
$north_worker->name = 'North';

// 启动N个进程对外提供服务
$north_worker->count = 1;

$north_worker->map_db = null;

// 启动回调
$north_worker->onWorkerStart = function($north_worker)
{
    //global $north_global;
    //$north_global = new \GlobalData\Client('127.0.0.1:2207');

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
    global $north_worker;
    //global $north_global;

    $json_arr = json_decode($data, true);
    print_r($json_arr);

    // 生成命令帧
    $frame = transToFrame($json_arr);

    print_r(hex_dump($frame));

    print_r($GLOBALS);

    //$map = $north_worker->map_db->connect_get_by_uid($json_arr['uid']);
    //print_r($map);

    // 转发

    // 下包应该在节点返回后转回
    //$connection->send($frame);
};

$north_worker->onClose = function($connection)
{

    echo "\nconnection closed\n";
};

$north_worker->onError = function($connection, $code, $msg)
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

