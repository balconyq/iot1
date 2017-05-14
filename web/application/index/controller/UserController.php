<?php

namespace app\index\controller;

use app\index\controller\LoginAuth;
use app\model\tUser;
use app\model\tUserLevel;
use app\model\tUserState;

class UserController extends LoginAuth
{
    // relationship
    private $_rel_level = array();
    private $_rel_state = array(); 

    public function _initialize()
    {
        if (!session('username'))
        {
            $this->redirect('index/Login/index');
        }
        
        $t_level = new tUserLevel;
        $lists = $t_level->select();
        foreach ($lists as $key => $value)
        {
            $this->_rel_level[$key]['value'] = $value->getData('value');
            $this->_rel_level[$key]['content'] = $value->getData('content');
        }

        $t_state = new tUserState;
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

        $arr['name']        = $obj->getData('name');

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

        return $arr;
    }

    public function index()
    {
        $t_user = new tUser;

        $lists = $t_user->paginate(5);
        $page = $lists->render();

        $user_lists = array();
        foreach ($lists as $key => $value) 
        {
            array_push($user_lists, $this->getListByObj($value));
        }

        $this->assign('lists', $user_lists);
        $this->assign('page', $page);

        return $this->fetch();
    }

    public function test()
    {

    }
}
