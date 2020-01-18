<?php
/**
 * 安装向导
 */
header('Content-type:text/html;charset=utf-8');
// 检测是否安装过
if (file_exists('./install.lock')) {
    echo '你已经安装过该系统，请删除./install/文件';
    die;
}
// 同意协议页面
if(@!isset($_GET['c']) || @$_GET['c']=='agreement'){
    require './agreement.html';
}
// 检测环境页面
if(@$_GET['c']=='test'){
    require './test.html';
}
// 创建数据库页面
if(@$_GET['c']=='create'){
    $url    = preg_replace('|[0-9]+|', '', 'h0t1t2p0:3/4/5w6w7w.g8u9o0j4i3z.c2o1m');
    require './create.html';
}
// 安装成功页面
if(@$_GET['c']=='success'){
    // 判断是否为post
    if($_SERVER['REQUEST_METHOD']=='POST'){
        $data=$_POST;
        // 连接数据库
        $link=@new mysqli("{$data['DB_HOST']}:{$data['DB_PORT']}",$data['DB_USER'],$data['DB_PWD']);
        // 获取错误信息
        $error=$link->connect_error;
        if (!is_null($error)) {
            // 转义防止和alert中的引号冲突
            $error=addslashes($error);
            die("<script>alert('数据库链接失败:$error');history.go(-1)</script>");
        }
        // 设置字符集
        $link->query("SET NAMES 'utf8'");
        $link->server_info>5.0 or die("<script>alert('请将您的mysql升级到5.0以上');history.go(-1)</script>");
        // 创建数据库并选中
        if(!$link->select_db($data['DB_NAME'])){
            $create_sql='CREATE DATABASE IF NOT EXISTS '.$data['DB_NAME'].' DEFAULT CHARACTER SET utf8;';
            $link->query($create_sql) or die('创建数据库失败');
            $link->select_db($data['DB_NAME']);
        }
        // 导入sql数据并创建表
        $shujuku_str=file_get_contents('./shujuku.sql');
        $sql_array=preg_split("/;[\r\n]+/", str_replace('tpt_',$data['DB_PREFIX'],$shujuku_str));
        foreach ($sql_array as $k => $v) {
            if (!empty($v)) {
                $link->query($v);
            }
        }
        $link->close();
        $db_str=<<<php
<?php
return [
    'type'            => 'mysql',
    'hostname'        => '{$data['DB_HOST']}',
    'database'        => '{$data['DB_NAME']}',
    'username'        => '{$data['DB_USER']}',
    'password'        => '{$data['DB_PWD']}',
    'hostport'        => '3306',
    'dsn'             => '',
    'params'          => [],
    'charset'         => 'utf8',
    'prefix'          => '{$data['DB_PREFIX']}', 
    'debug'           => true,
    'deploy'          => 0,
    'rw_separate'     => false,
    'master_num'      => 1,
    'slave_no'        => '',
    'fields_strict'   => true,
    'resultset_type'  => 'array',
    'auto_timestamp'  => false,
    'datetime_format' => 'Y-m-d H:i:s',
    'sql_explain'     => false,
    'builder'         => '',
    'query'           => '\\think\\db\\Query',
];
php;
        // 创建数据库链接配置文件
        file_put_contents('../application/database.php', $db_str);
        @touch('./install.lock');
        require './success.html';
    }

}

