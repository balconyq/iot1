<?php

require_once __DIR__.'/common.php';
require_once __DIR__.'/P1Command.php';


// 定义数组，存储各个命令组包回调
$p1_pack_handler = array();

// 查找节点数据处理函数
function p1Pack($command, $data, & $ret_data)
{
    global $p1_pack_handler;

    // 命令是否有效
    if (!array_key_exists($command, $p1_pack_handler))
    {
        errPrint("invalid command:".$command);
        return false;
    }

    return $p1_pack_handler[$command]($data, $ret_data);
}

// LED
$p1_pack_handler[CMD_LED] = function($data, & $ret_data)
{
    if ('on' == $data)
    {
        $led_state = 0x01;
    }
    else if ('off' == $data)
    {
        $led_state = 0x00;
    }

    $ret_data = pack('C', $led_state);

    return true;
};

