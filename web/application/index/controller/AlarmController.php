<?php

namespace app\index\controller;

use think\Controller;
use app\model\tAlarm;
use app\model\tAlarmType;
use app\model\tAlarmLevel;
use app\model\tAlarmState;

class AlarmController extends Controller
{
    // relationship
    private $_rel_type = array();
    private $_rel_level = array();
    private $_rel_state = array(); 

    public function _initialize()
    {
        if (!session('username'))
        {
            $this->redirect('index/Login/index');
        }
        
        $t_type = new tAlarmType;
        $lists = $t_type->select();
        foreach ($lists as $key => $value)
        {
            $this->_rel_type[$key]['value'] = $value->getData('value');
            $this->_rel_type[$key]['content'] = $value->getData('content');
        }

        $t_level = new tAlarmLevel;
        $lists = $t_level->select();
        foreach ($lists as $key => $value)
        {
            $this->_rel_level[$key]['value'] = $value->getData('value');
            $this->_rel_level[$key]['content'] = $value->getData('content');
        }

        $t_state = new tAlarmState;
        $lists = $t_state->select();
        foreach ($lists as $key => $value)
        {
            $this->_rel_state[$key]['value'] = $value->getData('value');
            $this->_rel_state[$key]['content'] = $value->getData('content');
        }
    }

    private function getListByObj($obj)
    {
        $arr = array();

        $arr['uid']         = $obj->getData('uid');

        foreach ($this->_rel_type as $key => $value)
        {
            if ($value['value'] == $obj->getData('type'))
            {
                $arr['type'] = $value['content'];
            }
        }

        $arr['count']       = $obj->getData('count');

        foreach ($this->_rel_level as $key => $value)
        {
            if ($value['value'] == $obj->getData('level'))
            {
                $arr['level'] = $value['content'];
            }
        }

        foreach ($this->_rel_state as $key => $value)
        {
            if ($value['value'] == $obj->getData('state'))
            {
                $arr['state'] = $value['content'];
            }
        }

        $arr['create_time'] = $obj->getData('create_time');
        $arr['cancel_time'] = $obj->getData('cancel_time');

        return $arr;
    }

    public function index()
    {
        $t_alarm = new tAlarm;
        //$lists = $t_alarm->page(1, 5)->select();
        $lists = $t_alarm->paginate(5);
        $page = $lists->render();

        $alarm_lists = array();
        foreach ($lists as $key => $value) 
        {
            array_push($alarm_lists, $this->getListByObj($value));
        }

        $this->assign('lists', $alarm_lists);
        $this->assign('page', $page);

        return $this->fetch();
    }

    public function test()
    {

    }
}
