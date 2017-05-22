<?php

namespace app\index\controller;

use think\Controller;

class SystemController extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function sys_lang_select()
    {
        switch ($_GET['lang']) {
            case 'cn':
                cookie('think_var', 'zh-cn');
            break;
            case 'en':
                cookie('think_var', 'en-us');
            break;
            default:
                cookie('think_var', 'zh-cn');
            break;
        }
    }

    public function test()
    {

    }
}
