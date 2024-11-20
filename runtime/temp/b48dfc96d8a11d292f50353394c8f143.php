<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:64:"D:\phpstudy_pro\WWW\video1/application/admin\view\card\info.html";i:1731729505;s:66:"D:\phpstudy_pro\WWW\video1\application\admin\view\public\head.html";i:1731557514;s:66:"D:\phpstudy_pro\WWW\video1\application\admin\view\public\foot.html";i:1568100986;}*/ ?>
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
    <form class="layui-form layui-form-pane" method="post" action="">
        <input id="link_id" name="link_id" type="hidden" value="<?php echo $info['link_id']; ?>">
        <div class="layui-form-item">
            <label class="layui-form-label">生成数量：</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" value="10" lay-verify="num" placeholder="请输入生成数量" name="num">
            </div>
        </div>
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">面值：</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" value="0.1" lay-verify="money" placeholder="请输入面值" name="money" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">仙豆数：</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" value="" lay-verify="point" placeholder="请输入仙豆数" name="point">
            </div>
        </div>

        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">卡号规则：</label>
            <div class="layui-input-block">
                <input type="radio" name="role_no" value="" title="混合" checked>
                <input type="radio" name="role_no" value="letter" title="字母" >
                <input type="radio" name="role_no" value="num" title="数字" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码规则：</label>
            <div class="layui-input-block">
                <input type="radio" name="role_pwd" value="" title="混合" checked>
                <input type="radio" name="role_pwd" value="letter" title="字母" >
                <input type="radio" name="role_pwd" value="num" title="数字" >
            </div>
        </div>

        <div class="layui-form-item center">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="formSubmit" data-child="true">保 存</button>
                <button class="layui-btn layui-btn-warm" type="reset">还 原</button>
            </div>
        </div>
    </form>

</div>
<script type="text/javascript" src="/static/js/admin_common.js"></script>

<script type="text/javascript">
    layui.use(['form', 'layer'], function () {
        // 操作对象
        var form = layui.form
                , layer = layui.layer
                , $ = layui.jquery;

        // 验证
        form.verify({
            num: function (value) {
                if (value == "") {
                    return "请输入生成数量";
                }
            },
            money: function (value) {
                if (value == "") {
                    //return "请输入充值卡面值";
                }
            },
            point: function (value) {
                if (value == "") {
                    return "请输入充值卡点数";
                }
            }
        });


    });
</script>

</body>
</html>