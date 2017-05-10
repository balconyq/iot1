<?php


$test = function()
{
    global $var_a;

    print_r($var_a);
};

call_user_func($test);

