<?php

/*
Big-endian

struct down{
    
    uint8_t     head;
    uint16_t    version;
    uint32_t    length;
    uint32_t    uid;
    uint32_t    command;
    uint8_t     state;
    char*       data;
    uint16_t    crc;
};

version:    100
serial:     package serial number
length:     total.len
state:      down->0x00, up->0xff(success), 0xfe...(fail), 0x01(alarm), 0x02(report)
command:    0x01, 0x02, ..., 0xfe
crc:        x^16 + x^12 + x^5 + 1
*/
define('HEAD',          0x7E);
define('VERSION',       100);
define('STATE_DOWN',    0x00);
define('PROTOCOL_HEAD_LENGTH',    16);


function pkgHead($recv_buffer)
{
    // 如果不够一个协议头的长度，则继续等待
    if(strlen($recv_buffer) < PROTOCOL_HEAD_LENGTH)
    {
        return 0;
    }

    // 解包
    $package_head = unpack('Chead/nversion/Nlength/Nuid/Ncommand/Cstate', $recv_buffer);

    return $package_head;
}

function pkgDecode($recv_buffer)
{
    // 解包
    $package_head = unpack('Chead/nversion/Nlength/Nuid/Ncommand/Cstate', $recv_buffer);

    print_r($package_head);

    // 校验
    if ((HEAD != $package_head['head']) ||
        (VERSION != $package_head['version'])
       )
    {
        errPrint('head');
        return false;
    }

    $package_data_length = $package_head['length'] - PROTOCOL_HEAD_LENGTH - 2;

    // 从数据流中取出净荷数据
    if (0 != $package_data_length)
    {
        $package_data = substr($recv_buffer, PROTOCOL_HEAD_LENGTH, $package_data_length);
    }
   
    // 从数据流中截取出CRC
    $package_crc = substr($recv_buffer, $package_head['length'] - 2, 2);

    // CRC校验

    return array(
         'uid' => $package_head['uid'],
         'command' => $package_head['command'],
         'state' => $package_head['state'],
         'data_length' => $package_data_length,
         'data' => $package_data,
    );
}

function pkgEncode($data, $package_head)
{
    $length = PROTOCOL_HEAD_LENGTH + strlen($data) + 2;
    $state = $package_head['state'];

    $package_head = pack('CnNNNC', HEAD, VERSION, $length, $package_head['uid'], $package_head['command'], $state);

    $crc = 0xffff;
    $package_crc = pack('n', $crc);

    return $package_head.$data.$package_crc;
}
