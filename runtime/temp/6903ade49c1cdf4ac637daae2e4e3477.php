<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:45:"template/mxone/html_tplmx/vod\member_tip.html";i:1732008557;}*/ ?>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>系统提示【<?php echo $obj['vod_name']; ?>】因为版权问题，本站不提供在线播放</title>
    <link rel="stylesheet" href="<?php echo $maccms['path']; ?>mxstatic/css/style.css">
   <style>
        body{background:#fff;}
    </style>
</head>
<body >
    <div class="weui_msg_jump">
    <div class="weui_icon"><i class="icon-warn"></i></div>
    <div class="weui_text">
        <h4 class="weui_msg_title">系统提示...</h4>
        <p class="weui_xtts">亲爱的用户：</p>
          <p class="text">【<?php echo $obj['vod_name']; ?>】<?php echo $GLOBALS['config']['app']['copyright_notice']; ?></p>
        <p class="weui_tzt">
             <?php if($obj['vod_jumpurl'] != ''): ?>
            页面自动 <a id="href" href="<?php echo($obj['vod_jumpurl']);?>">跳转</a> 等待时间：<b id="wait">3</b>
                    <?php endif; ?>
            </p>
            <a href="<?php echo $maccms['path']; ?>"><b>返回首页</b></a>
    </div>
</div>

<script type="text/javascript">

    (function(){
        var wait = document.getElementById('wait'),
            href = document.getElementById('href').href;
        var interval = setInterval(function(){
            var time = --wait.innerHTML;
            if(time <= 0) {
                top.location.href = href;
                clearInterval(interval);
            };
        }, 1000);
    })();

</script>
</body>
</html>