<?php
namespace app\index\controller;
use think\Controller;
use think\Request;

class LoginAuth extends Controller
{
    protected function _initialize()
    {
        if (!session('username'))
        {
            //$this->redirect('index/Login/index');
        }
    }
}
