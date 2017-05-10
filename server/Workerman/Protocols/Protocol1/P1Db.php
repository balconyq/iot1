<?php

namespace Workerman\Protocols\Protocol1;

require_once __DIR__.'/../../Vendor/Mysql/Connection.php';

// 单节点设备最大存储条数
define('DOWN_FRAME_RECORD_MAX',     100);
define('UP_FRAME_RECORD_MAX',       100);

define('DB_USERNAME',               'root');
define('DB_PASSWORD',               'root');
define('DB_NAME',                   'iot1');

// 节点与进程ID关系表存储使能
define('DB_TMAP_USE_EN',            true);

define('P1DB_DBG_EN',               true);

class P1Db
{
    private $db;
    private $map_arr;

    public function __construct()
    {
        if (DB_TMAP_USE_EN)
        {
            $this->db = new \Workerman\MySQL\Connection('localhost', '3306', DB_USERNAME, DB_PASSWORD, DB_NAME);
        }

        $this->map_arr = array(array());
    }

    public function __destruct()
    {
        if (DB_TMAP_USE_EN)
        {
            $this->db->closeConnection();
        }
    }

    public function connection_add($map)
    {
        if (DB_TMAP_USE_EN)
        {
            // $ret = $this->db->query(
            //     "INSERT INTO t_map ".
            //     "(worker_id,connect_id,ip) ".
            //     "VALUES ".
            //     "(".$map['worker_id'].",".$map['connection_id'].",INET_ATON(".$map['ip']."))"
            //     );

            // query if the connection has been added

            // if not, add it
            $ret = $this->db->insert('t_map')->cols(array(
                'uid'=>0x0,
                'worker_id'=>$map['worker_id'],
                'connect_id'=>$map['connection_id'],
                'ip'=>ip2long($map['ip'])
                ))->query();
        }

        $id = $map['worker_id'].$map['connection_id'];
        $key = array($id);
        $this->map_arr = array_fill_keys($key, $map);
        if (P1DB_DBG_EN)
        {
            print_r($this->map_arr);
        }

        echo "add success.\r\n";
    }

    public function connection_delete($map)
    {
        if (DB_TMAP_USE_EN)
        {
            // $ret = $this->db->query(
            //     "DELETE FROM t_map ".
            //     "WHERE ".
            //     "worker_id=".$map['worker_id']." AND connect_id=".$map['connection_id']
            //     );
            $ret = $this->db->delete('t_map')->where(
                "worker_id=".$map['worker_id']." AND connect_id=".$map['connection_id']
                )->query();
        }

        $id = $map['worker_id'].$map['connection_id'];
        unset($this->map_arr[$id]);
        if (P1DB_DBG_EN)
        {
            print_r($this->map_arr);
        }

        echo "delete success.\r\n";
    }

    public function connect_update($map)
    {
        if (DB_TMAP_USE_EN)
        {
            // $ret = $this->db->query(
            //     "UPDATE t_map ".
            //     "SET uid=".$map['uid']." ".
            //     "WHERE worker_id=".$map['worker_id']." AND connect_id=".$map['connection_id']
            //     );
            $ret = $this->db->update('t_map')->cols(array(
                'uid'=>$map['uid']
                ))->where(
                "worker_id=".$map['worker_id']." AND connect_id=".$map['connection_id']
                )->query();
        }

        $id = $map['worker_id'].$map['connection_id'];
        $this->map_arr[$id]['uid'] = $map['uid'];
        if (P1DB_DBG_EN)
        {
            print_r($this->map_arr);
        }

        echo "update success.\r\n";
    }

    public function connect_get_by_uid($uid)
    {
        foreach ($this->map_arr as $key => $value)
        {
            if ($uid == $value['uid'])
            {
                return $this->map_arr[$key];
            }
        }

        return null;
    }

    public function alarm_add($arr)
    {
        $ret = $this->db->insert('t_alarm')->cols(array(
            'uid'=>$arr['uid'],
            'type'=>$arr['type'],
            'value'=>$arr['value'],
            'count'=>$arr['count'],
            'level'=>$arr['level'],
            'state'=>$arr['state']
            ))->query();
    }

    public function node_add($arr)
    {
        $ret = $this->db->insert('t_node')->cols(array(
            'uid'=>$arr['uid'],
            'state'=>$arr['state'],
            'ip'=>$arr['ip'],
            'addr'=>$arr['addr'],
            'gisx'=>$arr['gisx'],
            'gisy'=>$arr['gisy'],
            'group'=>$arr['group'],
            'team'=>$arr['team'],
            'operator'=>$arr['operator'],
            'remark'=>$arr['remark']
            ))->query();
    }
}