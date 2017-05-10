<?php

namespace app\index\controller;

use think\Controller;
use app\model\tNode;

class NodeController extends Controller
{
    public function index()
    {
        $t_node = new tNode;
        //$lists = $t_node->page(1, 5)->select();
        $lists = $t_node->paginate(5);
        $page = $lists->render();

        $this->assign('lists', $lists);
        $this->assign('page', $page);
        
        return $this->fetch();
    }

    public function test()
    {

    }
}
