<?php

function errPrint($fmt)
{
    echo '<ERROR>: '.$fmt.',<method>: '.__METHOD__.',<line>: '.__LINE__.'\r\n';
}

function putDump($buffer, $length)
{
    for ($i = 0; $i < $length; $i++)
    {
        if ((0 != $i) && ($i % 16 == 0))
        {
            echo "\t";
            for ($j = 16; $j > 0; $j--)
            {
                echo (($buffer[$i - $j] >= ' ' && $buffer[$i - $j] <= '~') ? $buffer[$i - $j] : '.');
            }
            echo "\r\n";
        }
        printf(" %02X", $buffer[$i]);
    }

    echo "\r\n";
}

/* 
php 打印出字符串的16进制数据 
*/
function hex_dump($data, $newline="n") 
{ 
  static $from = ''; 
  static $to = ''; 
  
  static $width = 16; # number of bytes per line 
  
  static $pad = '.'; # padding for non-visible characters 
  
  if ($from==='') 
  { 
    for ($i=0; $i<=0xFF; $i++) 
    { 
      $from .= chr($i); 
      $to .= ($i >= 0x20 && $i <= 0x7E) ? chr($i) : $pad; 
    } 
  } 
  
  $hex = str_split(bin2hex($data), $width*2); 
  $chars = str_split(strtr($data, $from, $to), $width); 
  
  $offset = 0; 
  foreach ($hex as $i => $line) 
  { 
    echo sprintf('%6X',$offset).' : '.implode(' ', str_split($line,2)) . ' [' . $chars[$i] . ']' . $newline; 
    $offset += $width; 
  } 
}
