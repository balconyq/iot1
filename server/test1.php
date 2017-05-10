<?php

//$var_a = null;

$func_cb = function()
{
    global $var_a;

    $var_a = "testabc\n";
};
call_user_func($func_cb);
