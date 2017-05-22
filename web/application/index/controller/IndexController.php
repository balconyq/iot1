<?php
namespace app\index\controller;

use think\Controller;
use app\index\controller\LoginAuth;

class IndexController extends Controller
{
    public function _initialize()
    {
        if (!session('username'))
        {
            $this->redirect('index/Login/index');
        }
    }

    public function index()
    {
        return $this->fetch();
    }

    public function test()
    {
        return $this->fetch();
    }
}
