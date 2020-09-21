<!DOCTYPE html>
<html>
<head>
    <title>提示</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
    <link rel="stylesheet" type="text/css" href="https://res.wx.qq.com/open/libs/weui/0.4.1/weui.css">
</head>
<body>

<?php if (isset($message)) { ?>
<?php $msg = $message; ?>
<?php } else { ?>
<?php $msg = empty($error['message']) ? $error : $error['message']; ?>
<?php } ?>

<div class="weui_msg">
    <div class="weui_icon_area"><i class="weui_icon_info weui_icon_msg"></i></div>
    <div class="weui_text_area"><h4 class="weui_msg_title"><?php echo $msg;?></h4></div>
</div>

</body>
</html>
