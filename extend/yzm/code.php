<?php
session_start();
//设置COOKIE或Session
function esetcookie($name,$str,$life=0){
//本函数将字符串 str 全部变小写字符串使验证码输入不区分大小写----在提交表单进行session比较同样需要次函数转化
  $_SESSION[$name]=strtolower($str);
}
 
//获取随机字符 此函数区分字符大小写 如果不区分大小写可加入函数strtolower
function domake_password($len) 
{ 
    $chars = array( 
        /*"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",  
        "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",  
        "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",  
        "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",  
        "S", "T", "U", "V", "W", "X", "Y", "Z",*/ "0", "1", "2",  
        "3", "4", "5", "6", "7", "8", "9" 
    ); 
    $charsLen = count($chars) - 1; 
    shuffle($chars);// 将数组打乱
    $output = ""; 
    for ($i=0; $i<$len; $i++) 
    { 
        $output .= $chars[mt_rand(0, $charsLen)]; //获得一个数组元素
    }  
    return $output;
} 
 
//显示验证码
function ShowKey(){
  $key=domake_password(4);//获取随机值
  $set=esetcookie("checkkey",$key);//将随机值写入cookie或session
  //是否支持gd库
  if(function_exists("imagejpeg")) 
  {
    header ("Content-type: image/jpeg");
    $img=imagecreate(60,36);
    $blue=imagecolorallocate($img,102,102,102);
    $white=ImageColorAllocate($img,255,255,255);
    $black=ImageColorAllocate($img,71,71,71);
    imagefill($img,0,0,$blue);
    imagestring($img,5,10,10,$key,$white);
    for($i=0;$i<90;$i++) //加入干扰象素
    {
      imagesetpixel($img,rand()%70,rand()%30,$black);
    }
    imagejpeg($img);
    imagedestroy($img);
  }
  elseif (function_exists("imagepng"))
  {
    header ("Content-type: image/png");
    $img=imagecreate(60,36);
    $blue=imagecolorallocate($img,102,102,102);
    $white=ImageColorAllocate($img,255,255,255);
    $black=ImageColorAllocate($img,71,71,71);
    imagefill($img,0,0,$blue);
    imagestring($img,5,10,10,$key,$white);
    for($i=0;$i<90;$i++) //加入干扰象素
    {
      imagesetpixel($img,rand()%70,rand()%30,$black);
    }
    imagepng($img);
    imagedestroy($img);
  }
  elseif (function_exists("imagegif")) 
  {
    header("Content-type: image/gif");
    $img=imagecreate(60,36);
    $blue=imagecolorallocate($img,102,102,102);
    $white=ImageColorAllocate($img,255,255,255);
    $black=ImageColorAllocate($img,71,71,71);
    imagefill($img,0,0,$blue);
    imagestring($img,5,10,10,$key,$white);
    for($i=0;$i<90;$i++) //加入干扰象素
    {
      imagesetpixel($img,rand()%70,rand()%30,$black);
    }
    imagegif($img);
    imagedestroy($img);
  }
  elseif (function_exists("imagewbmp")) 
  {
    header ("Content-type: image/vnd.wap.wbmp");
    $img=imagecreate(60,36);
    $blue=imagecolorallocate($img,102,102,102);
    $white=ImageColorAllocate($img,255,255,255);
    $black=ImageColorAllocate($img,71,71,71);
    imagefill($img,0,0,$blue);
    imagestring($img,5,10,10,$key,$white);
    for($i=0;$i<90;$i++) //加入干扰象素
    {
      imagesetpixel($img,rand()%70,rand()%30,$black);
    }
    imagewbmp($img);
    imagedestroy($img);
  }
  else
  {
    //不支持验证码
    header("content-type:image/jpeg\r\n");
    header("Pragma:no-cache\r\n");
    header("Cache-Control:no-cache\r\n");
    header("Expires:0\r\n");
    $fp = fopen("data/vdcode.jpg","r");  
  }
}
ShowKey();
?> 