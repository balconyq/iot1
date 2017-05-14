<?php

namespace app\index\controller;

use app\index\controller\LoginAuth;

class StatisController extends LoginAuth
{
    public function index()
    {
        return $this->fetch();
    }

    public function test()
    {

    }
}
