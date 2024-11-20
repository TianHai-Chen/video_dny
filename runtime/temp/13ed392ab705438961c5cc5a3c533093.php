<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:65:"D:\phpstudy_pro\WWW\video1/application/admin\view\images\opt.html";i:1568100986;s:66:"D:\phpstudy_pro\WWW\video1\application\admin\view\public\head.html";i:1731557514;s:66:"D:\phpstudy_pro\WWW\video1\application\admin\view\public\foot.html";i:1568100986;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title><?php echo $title; ?> - <?php echo lang('admin/public/head/title'); ?></title>
    <link rel="stylesheet" href="/static/layui/css/layui.css?v=1024">
    <link rel="stylesheet" href="/static/css/admin_style.css?v=1024">
    <script type="text/javascript" src="/static/js/jquery.js?v=1024"></script>
    <script type="text/javascript" src="/static/layui/layui.js?v=1024"></script>
    <script>
        var ROOT_PATH="",ADMIN_PATH="<?php echo $_SERVER['SCRIPT_NAME']; ?>", MAC_VERSION="v10";
    </script>
</head>
<body>
<div class="page-container p10">

    <form class="layui-form " method="post" action="<?php echo url('sync'); ?>">
        <input type="hidden" name="tab" value="<?php echo $tab; ?>">
        <fieldset class="layui-elem-field">
            <legend>同步范围</legend>
            <div class="layui-field-box">
                <div class="layui-form-item">
                        <div class="layui-input-inline" style="width: 110px;">
                            <input type="radio" checked value="1" name="range" title="全部数据">
                        </div>
                        <div class="layui-input-inline" style="width: 110px;">
                            <input type="radio" value="2" name="range" title="数据日期">
                        </div>
                        <div class="layui-input-inline" style="width: 100px;">
                            <input type="text" name="date" required  placeholder="" autocomplete="off" class="layui-input" value="<?php echo date('Y-m-d'); ?>">
                        </div>
                </div>
            </div>
        </fieldset>

        <fieldset class="layui-elem-field">
            <legend>同步选项</legend>
            <div class="layui-field-box">
                <div class="layui-form-item">
                    <div class="layui-input-inline" style="width: 110px;">
                        <input type="radio"  value="0" name="opt" title="全部">
                    </div>
                    <div class="layui-input-inline" style="width: 110px;">
                        <input type="radio" value="1" name="opt" title="非出错图">
                    </div>
                    <div class="layui-input-inline" style="width: 120px;">
                        <input type="radio" checked value="2" name="opt" title="非当天错图">
                    </div>
                    <div class="layui-input-inline" style="width: 110px;">
                        <input type="radio" value="3" name="opt" title="出错图">
                    </div>
                </div>
            </div>
        </fieldset>

        <fieldset class="layui-elem-field">
            <legend>同步字段-同步详情图片时，同步选项参数不起作用!</legend>
            <div class="layui-field-box">
                <div class="layui-form-item">
                    <div class="layui-input-inline" style="width: 110px;">
                        <input type="radio" checked value="1" name="col" title="主图">
                    </div>
                    <div class="layui-input-inline" style="width: 110px;">
                        <input type="radio" value="2" name="col" title="详情图片">
                    </div>
                </div>
            </div>
        </fieldset>

        <div class="layui-form-item">
            <button type="submit" class="layui-btn btn_submit">开始执行</button>
        </div>

    </form>
</div>
<script type="text/javascript" src="/static/js/admin_common.js"></script>
<script type="text/javascript">
    layui.use(['element', 'layer'], function() {

    });

    $('.btn_submit').click(function(){
        $('form').submit();
    })

</script>
</body>
</html>