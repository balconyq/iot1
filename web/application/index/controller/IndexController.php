<?php
namespace app\index\controller;

use think\Controller;

class IndexController extends Controller
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
