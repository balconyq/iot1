<?php
namespace app\index\controller;

use think\Controller;
use think\Request;
use think\Validate;
use app\model\aUser;

class LoginController extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function login()
    {
        $user = new aUser;
        $data = input('post.');

        $rule = [
            'username'  => 'require',
            'password'  => 'require',
        ];

        $validate = new Validate($rule);
        $result   = $validate->check($data);
        if(!$result){
            return $validate->getError();
        }

        $preview = $user->where(['username'=>$data['username'],])->find();
        if(!$preview){
            $this->error('用户不存在');
        }

        $where_query = array(
                'username' => $data['username'],
                'password' => md5($data['password'].$preview['salt']),
        );

        if ($user = $user->where($where_query)->find()) 
        {
            session('username',$data['username'],'think');
            session('password',$data['password'],'think');

            $this->redirect('index/Index/index');
        }
        else
        {
            $this->error('登录失败:账号或密码错误');
        }
    }

    public function logout()
    {
        $request = request();
        session(null, 'think');
        $this->redirect('index/Login/index');
    }

    public function add($data)
    {
        $user = new aUser;

        $rule = [
            'username'      => 'require',
            'password'      => 'require',
            'salt'          => 'length:3|number',
            'email'         => 'require|email',
        ];

        // 输入规则校验
        $validate = new Validate($rule);
        $result   = $validate->check($data);
        if(!$result){
            return  $validate->getError();
        }

        // 用户名是否已注册
        $preview = $user->where(['username'=>$data['username'],])->find();
        if($preview){
            return $this->error('用户名已注册！');
        }

        // 密码加密
        $data['password'] = md5($data['password'].$data['salt']);

        if ($id = $user->insertGetId($data)) 
        {
            $this->redirect('index/Login/index');
        } 
        else 
        {
            $this->error('failed!');
        }
    }

    public function test()
    {
        //return $this->fetch();

        $t = array();

        $t['username']  = 'qixx';
        $t['password']  = '1';
        $t['salt']      = rand(100,999);
        $t['email']     = 'qixx@fiberhome.com';

        var_dump($this->add($t));
    }
}
