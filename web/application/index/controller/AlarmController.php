<?php

namespace app\index\controller;

use think\Controller;
use app\model\tAlarm;

class AlarmController extends Controller
{
    public function index()
    {
        $t_alarm = new tAlarm;
        //$lists = $t_alarm->page(1, 5)->select();
        $lists = $t_alarm->paginate(5);
        $page = $lists->render();

        $this->assign('lists', $lists);
        $this->assign('page', $page);

        return $this->fetch();
    }

    public function test()
    {

    }
}
