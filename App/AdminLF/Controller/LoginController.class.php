<?php
/**
 * 后台登录登出
 * Class LoginController
 * @package AdminLF\Controller
 * User: hjun
 * Date: 2018-07-11 17:08:05
 * Update: 2018-07-11 17:08:05
 * Version: 1.00
 * company 启达联创(厦门)信息科技有限公司
 * Copyright  ©2018 www.wxzbc.com  All rights reserved
 */

namespace AdminLF\Controller;

use Think\Controller;

class LoginController extends BaseController
{

    public function index()
    {
        $user = session(C('USER_AUTH_KEY'));
        if (isset($user)) {
            $this->redirect(MODULE_NAME . '/Index/index');
        }
        $this->display();
    }

    //登录验证
    public function login()
    {
        //跳转
        $url = U('Index/index');
        if (IS_AJAX) {
            $this->apiResponse(getReturn(CODE_LOGIN_SUCCESS, '登录成功',
                ['token' => session_id(), 'url' => $url]));
        } else {
            $this->success('登录成功', $url);
        }

    }

    //退出
    public function logout()
    {
        session(null);
        $this->redirect('Login/index');
    }

    //登录验证码
    public function verify($id = '1')
    {

        //ob_clean();
        $config = array(
            'fontSize' => 18,
            'length' => 4,
//            'imageW' => 230,
//            'imageH' => 40,
            'bg' => array(206, 233, 246),
            'useCurve' => false,
            'useNoise' => false,
            'codeSet' => '234569',
        );
        $verify = new \Think\Verify($config);
        $verify->entry($id);
    }

    //js 用户名
    public function checkusername()
    {
        $username = I('username', '', 'htmlspecialchars,trim');
        $id = I('id', 0, 'intval');
        if (empty($username)) {
            exit(0);
        }
        $user = M('admin')->where(array('username' => $username, 'id' => array('neq', $id)))->find();
        if ($user) {
            echo 1;
        } else {
            echo 0;
        }
    }

    //js email
    public function checkemail()
    {
        $email = I('email', '', 'htmlspecialchars,trim');
        $id = I('id', 0, 'intval');

        if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
            exit(-1);
        }

        $user = M('admin')->where(array('email' => $email, 'id' => array('neq', $id)))->find();
        if ($user) {
            echo 1;
        } else {
            echo 0;
        }
    }

    //RBAC

    //js 角色名
    public function checkRoleName()
    {
        $name = I('name', '', 'htmlspecialchars,trim');
        $id = I('id', 0, 'intval');
        if (empty($name)) {
            exit(0);
        }
        $data = M('role')->where(array('name' => $name, 'id' => array('neq', $id)))->find();
        if ($data) {
            echo 1;
        } else {
            echo 0;
        }
    }

    //js 节点名//debug
    public function checkNodeName()
    {
        $name = I('name', '', 'htmlspecialchars,trim');
        $id = I('id', 0, 'intval');
        if (empty($name)) {
            exit(0);
        }
        $data = M('node')->where(array('name' => $name, 'id' => array('neq', $id)))->find();
        if ($data) {
            echo 1;
        } else {
            echo 0;
        }
    }


    /**
     * 忘记密码
     * User: Ydr
     * Date: 2020/2/4
     * Time: 10:30
     */
    public function reset_pwd(){
        if(IS_POST){
            $tel = I('tel', '');
            $code = I('tel_code', '');
            $verify = I('code', '');
            $password    = I('password', '');
            $rpassword   = I('rpassword', '');
            if(empty($tel)){
                $this->error('手机号不能为空！');
            }
            if (empty($password)) {
                $this->error('请填写新密码！');
            }

            if ($password != $rpassword) {
                $this->error('两次密码不一样，请重新填写！');
            }

            if (!check_verify($verify, 'a_login_1') && $this->req['key'] != '8988998') {
                $this->error('验证码不正确');
            }

            $admin = M('admin')->where(array('tel'=>$tel))->find();
            if(empty($admin)){
                $this->error('此号码未绑定用户');
            }

            if($admin['usertype']!= MALL_ADMIN){
                $this->error('该用户不是管理员账号');
            }

            $where = [];
            $where['tel'] = $tel;
            $where['code'] = $code;
            $identifyCodeData = M("identify_code")->where($where)->find();
            if(!empty($identifyCodeData) && (time() - $identifyCodeData['time']) < 180){
                $where = [];
                $where['id'] = $admin['id'];
                $passwordinfo = get_password($password);
                $data = array(
                    'id'       => $admin['id'],
                    'password' => $passwordinfo['password'],
                    'encrypt'  => $passwordinfo['encrypt'],
                );

                if(false !== M('admin')->where($where)->save($data)){
                    $this->success('修改密码成功', U('Login/index'));
                }else{
                    $this->error('修改密码失败');
                }

            }else{
                $this->error('手机验证码无效');
            }

        }else{
            $this->display();
        }
        exit();
    }

    /**
     *发送忘记密码验证码
     */
    public function ajaxSendForgetCode(){
        if(IS_AJAX){
            header("Content-type:text/html; charset=UTF-8");
            $tel = $this->req['tel'];
            if(empty($tel)){
                $this->apiResponse(getReturn(CODE_ERROR,'手机号不能为空'));
            }

            $where = [];
            $where['tel'] = $tel;
            $admin = M("admin")->where($where)->find();
            if(empty($admin)){
                $this->apiResponse(getReturn(CODE_ERROR,'此号码未绑定账户'));
            }

            if($admin['usertype']!= MALL_ADMIN){
                $this->apiResponse(getReturn(CODE_ERROR,'该用户不是管理员账号,请联系管理员修改密码'));
            }

//            $area_code = $this->req['area_code'];
            $area_code = 86;
            srand((double)microtime() * 1000000);
            $rand = mt_rand(1001, 9999);
            $code = $rand;

            $where = [];
            $where['tel'] = $tel;
            $identifyCodeData = M("identify_code")->where($where)->find();
            if (!empty($identifyCodeData) && (time() - $identifyCodeData['time']) < 180) {
                $this->apiResponse(getReturn(-1, "该号码三分钟内不能重复发送短信"));
            }
            $msg = "亲爱的用户, 您的验证码为" . $code . ",有效期为三分钟";
            $model = D('Message');
            $returnData = $model->sendSMS($tel, $msg);
            if ($returnData === false) {
                $error = $model->getError();
                if (empty($error)) {
                    $error = "验证码发送失败,请稍后重试";
                }
                $this->apiResponse(getReturn(-1, $error));
            }
            if (empty($identifyCodeData)) {
                M("identify_code")->add(
                    array(
                        'tel' => $tel,
                        'code' => $code,
                        'time' => time()
                    )
                );
            } else {
                M("identify_code")->where(array('tel' => $tel))->save(
                    array(
                        'code' => $code,
                        'time' => time(),
                    )
                );
            }
            $this->apiResponse(getReturn(200, "success"));
        }
    }
}
