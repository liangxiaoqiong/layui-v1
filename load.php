<?php

class Load
{
    private $action;
    private $token;

    public function __construct()
    {
        error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);
        date_default_timezone_set('Asia/Shanghai');
        $this->action = strtolower($_REQUEST['action']);
        $this->token = $_REQUEST['token'];
    }

    public function response($code, $msg, $data)
    {
        $result['code'] = $code;
        $result['msg'] = $msg;
        $result['data'] = $data;
        exit(json_encode($result));
    }

    public function index()
    {
        $action = $this->action;
        $content = file_get_contents("App/Runtime/Data/{$action}_{$this->token}.php");
        $content = unserialize($content);
        $this->response(200, 'success', $content);
    }
}

$load = new Load();
$load->index();
