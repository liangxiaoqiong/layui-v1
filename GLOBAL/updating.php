<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/6/9
 * Time: 19:42
 */
date_default_timezone_set('Asia/Shanghai');
?>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>Sorry</title>
  <style type="text/css">
    body, html {
      margin: 0px auto;
      text-align: center;
    }

    .text_one {
      margin: 52px auto;
      font-size: 24px;
      font-family: 微软雅黑, Verdana, Geneva, sans-serif;
    }

    h1 {
      color: #F00;
      margin: 0 10px;
      font-weight: bold;
      font-size: 114px;
      font-family: 微软雅黑, 黑体;
    }

    .link_select {
      margin-top: 40px;
    }

    .link_select a:link, .link_select a:visited {
      color: #F00;
      font-weight: bold;
    }

    .link_select a:hover, .link_select a:active {
      color: #333;
      text-decoration: none;
    }
  </style>
</head>
<body>
<p class="text_one">
  很抱歉，网站正在升级中，预计完成时间
<h1><?php echo date('H:00', time() + 3600 * 2) ?></h1>
</p>
</body>
</html>
<?php exit(); ?>

