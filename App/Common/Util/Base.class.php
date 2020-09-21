<?php

namespace Common\Util;

abstract class Base
{

    public function error($msg = '')
    {
        if (IS_AJAX || MODULE_NAME === 'App') {
            exit(jsonEncode(getReturn(CODE_ERROR, $msg)));
        } else {
            exit('<h4>' . $msg . '</h4>');
        }
    }
}