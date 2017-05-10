<?php

Class GlobalReg
{
    private $_global = array();

    function global_set($key, & $obj)
    {
        $this->_global[$key] = $obj;
    }

    function & global_get($key)
    {
        return $this->_global[$key];
    }

    static function & global_instance()
    {
        static $me;
        if (is_object($me) == true)
        {
            return $me;
        }

        $me = new GlobalReg;

        return $me;
    }
}

