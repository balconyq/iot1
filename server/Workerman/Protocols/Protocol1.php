<?php

namespace Workerman\Protocols;

require_once __DIR__.'/Protocol1/P1Format.php';

$packageHead = array(); // 记录当前收包信息

class Protocol1
{
    public static function input($recv_buffer)
    {
        global $packageHead;

        $package_head = pkgHead($recv_buffer);

        $packageHead = $package_head;
        
        // 返回包长
        return $package_head['length'];
    }

    public static function decode($recv_buffer)
    {
        return pkgDecode($recv_buffer);
    }

    public static function encode($data)
    {
        global $packageHead;

        return pkgEncode($data, $packageHead);
    }
}