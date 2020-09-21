<?php

namespace Mobile\Controller;

use Think\Controller;

class EmptyController extends BaseController
{

    public function _empty()
    {
        header("HTTP/1.1 404 Not Found");
        header("Status: 404 Not Found");
        $this->display(get_mtpl('404'));

    }

    public function index()
    {
        header("HTTP/1.1 404 Not Found");
        header("Status: 404 Not Found");
        $this->display(get_mtpl('404'));

    }

}
