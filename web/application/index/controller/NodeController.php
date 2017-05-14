<?php

namespace app\index\controller;

use app\index\controller\LoginAuth;
use app\model\tNode;
use app\model\tNodeState;

class NodeController extends LoginAuth
{
    private $node_rel = array();    // relationship in table node;

    public function _initialize()
    {
        if (!session('username'))
        {
            $this->redirect('index/Login/index');
        }
        
        $t_node_state = new tNodeState;
        $lists = $t_node_state->select();

        foreach ($lists as $key => $value)
        {
            $this->node_rel[$key]['value'] = $value->getData('value');
            $this->node_rel[$key]['content'] = $value->getData('content');
        }
    }

    private function getListByObj($obj)
    {
        $arr = array();

        $arr['uid']         = $obj->getData('uid');

        foreach ($this->node_rel as $key => $value)
        {
            if ($value['value'] == $obj->getData('state'))
            {
                $arr['state'] = $value['content'];
            }
        }

        $arr['ip']          = $obj->getData('ip');
        $arr['addr']        = $obj->getData('addr');
        $arr['gisx']        = $obj->getData('gisx');
        $arr['gisy']        = $obj->getData('gisy');
        $arr['group']       = $obj->getData('group');
        $arr['team']        = $obj->getData('team');
        $arr['operator']    = $obj->getData('operator');
        $arr['remark']      = $obj->getData('remark');
        $arr['create_time'] = $obj->getData('create_time');
        $arr['update_time'] = $obj->getData('update_time');

        return $arr;
    }

    public function index()
    {
        $t_node = new tNode;
        //$lists = $t_node->page(1, 5)->select();
        $lists = $t_node->paginate(5);
        $page = $lists->render();

        $node_lists = array();
        foreach ($lists as $key => $value) 
        {
            array_push($node_lists, $this->getListByObj($value));
        }

        $this->assign('lists', $node_lists);
        $this->assign('page', $page);

        return $this->fetch();
    }

    public function detail()
    {
        return $this->fetch();
    }

    public function node_get_to_map()
    {
        $postData = input('post.');

        $t_node = new tNode;

        //return $postData;

        $lists = $t_node
            ->where('gisx', '>', $postData['psw_x'])
            ->where('gisx', '<', $postData['pne_x'])
            ->where('gisy', '>', $postData['psw_y'])
            ->where('gisy', '<', $postData['pne_y'])
            //->limit(1000)
            ->select();
        //$lists = $t_node->select();

        $node_lists = array();
        foreach ($lists as $key => $value) 
        {
            array_push($node_lists, $this->getListByObj($value));
        }

        return json_encode($node_lists);
    }

    public function node_get_by_uid()
    {
        $postData = input('post.');

        $t_node = new tNode;

        $list = $t_node->where('uid', $postData['uid'])->select();

        if (empty($list))
        {
            return null;
        }

        $node_list = $this->getListByObj($list[0]);

        return json_encode($node_list);
    }

    public function node_add_random()
    {
        $max = 1000;
        $scale = array('x_max'=>129.9,'x_min'=>77.5,'y_max'=>43.5,'y_min'=>21.2);

        for ($i = 0; $i < $max; $i++)
        {
            $t_node = new tNode;

            $t_node->uid = $i;
            $t_node->state = 0x01;
            $t_node->ip = -1062731775;
            $t_node->addr = "rand in China";
            $t_node->gisx = rand($scale['x_min'], $scale['x_max']);
            $t_node->gisy = rand($scale['y_min'], $scale['y_max']);
            $t_node->group = 0x01;
            $t_node->team = 0x01;
            $t_node->operator = 0x01;
            $t_node->remark = "big data test";

            $t_node->save($t_node->getData());
        }
    }

    public function test()
    {
        $test = array();
        //var_dump($test);
        $arr1 = array();
        $arr1['t'] = '123';

        array_push($test, $arr1);

        var_dump($test);
    }
}
