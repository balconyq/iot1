<?php
namespace app\index\controller;

use app\index\controller\LoginAuth;

class IndexController extends LoginAuth
{
    public function index()
    {
        return $this->fetch();
    }

    public function test()
    {
        return $this->fetch();
    }
}
