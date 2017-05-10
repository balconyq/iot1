<?php

require_once __DIR__.'/config.php';
require_once __DIR__.'/Workerman/Autoloader.php';

//require_once __DIR__.'/global_server.php';
require_once __DIR__.'/south_server.php';
//require_once __DIR__.'/north_server.php';

use Workerman\Worker;

// 检查是否是命令行操作
if ('cli' != PHP_SAPI)
{
    echo 'access illegal';
    return ;
}

// 运行worker
Worker::runAll();