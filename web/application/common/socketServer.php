<?php  
namespace app\common;

class socketClient
{
    protected function _initialize()
    {
        //设置IP和端口号  
        $address = "127.0.0.1";  
        $port = 1234;

        //创建一个SOCKET  
        if(($sock = socket_create(AF_INET,SOCK_STREAM,SOL_TCP)) < 0) 
        {
            echo "socket_create() 失败的原因是:".socket_strerror($sock)."\n";
        }

        echo "试图连接 '$ip' 端口 '$port'...\n";
        $result = socket_connect($socket, $ip, $port);
        if ($result < 0) {
             echo "socket_connect() failed.\nReason: ($result) " . socket_strerror($result) . "\n";
        } else {
            echo "连接OK\n";
        }


        $in = "Ho\r\n";
        $in .= "first blood\r\n";
        $out = '';
        
        if(!socket_write($socket, $in, strlen($in))) 
        {
            echo "socket_write() failed: reason: " . socket_strerror($socket) . "\n";
        } 
        else 
        {
           echo "发送的内容为:<font color='red'>$in</font> <br>";
        }
        
        while($out = socket_read($socket, 8192)) 
        {
           echo "接受的内容为:",$out;
        }

        socket_close($socket);
    }

}

