<?php

require_once __DIR__.'/P1Command.php';


// 定义数组，存储各个命令回调
$p1_handler = array();

// 查找节点数据处理函数
function p1Parse($package, & $ret_data)
{
    global $p1_handler;
    $command = $package['command'];

    // 命令是否有效
    if (!array_key_exists($command, $p1_handler))
    {
        errPrint("invalid command:".$command);
        return false;
    }

    return $p1_handler[$command]($package, $ret_data);
}

// 心跳
$p1_handler[CMD_HEARTBEAT] = function($package, & $ret_data)
{
    echo 'command:'.$package['command'].' run';
    $ret_data = 'CMD_HEARTBEAT';

    return true;
};

// 登录
$p1_handler[CMD_LOGIN] = function($package, & $ret_data)
{
    global $g_P1Db;

    echo 'command:'.$package['command'].'run';

    $ret_data = 'CMD_LOGIN';

    $arr = array();

    $arr['uid']     = $package['uid'];
    $arr['state']   = 0x01;
    $arr['ip']      = ip2long('192.168.0.1');
    $arr['addr']    = "Wuhan Optical valley";
    $arr['gisx']    = 30.5984;
    $arr['gisy']    = 114.3118;
    $arr['group']   = 0x01;
    $arr['team']    = 0x01;
    $arr['operator']   = 0x02;
    $arr['remark']  = "Test Node";

    $g_P1Db->node_add($arr);

    return true;
};

// Alarm
$p1_handler[CMD_ALARM] = function($package, & $ret_data)
{
    global $g_P1Db;

    $ret_data = 'CMD_ALARM';

    print_r($package);

    // if exist, count++;

    $arr = array();

    $arr['uid']     = $package['uid'];
    $arr['type']    = 0x01;
    $arr['value']   = 0x1234;
    $arr['count']   = 0x01;
    $arr['level']   = 0x01;
    $arr['state']   = 0x01;

    // store to DB;
    //$g_P1Db->alarm_add($arr);

    return true;
};


// Report
$p1_handler[CMD_REPORT] = function($package, & $ret_data)
{
    global $g_P1Db;

    $ret_data = 'CMD_REPORT';

    $f = unpack('Nvalue', $package['data']);
    $index = $f['value'] * 1.0 / 10000;

    $arr = array();

    $arr['uid']     = $package['uid'];
    $arr['time']    = date("Y-m-d H:i:s");
    $arr['value']   = $index;

    // store to DB;
    $g_P1Db->report_add($arr);

    return true;
};
