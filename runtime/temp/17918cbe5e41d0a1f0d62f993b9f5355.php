<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:73:"D:\phpstudy_pro\WWW\video1/application/admin\view\public\select_hits.html";i:1568100986;}*/ ?>
<form class="layui-form m10" method="post" action="<?php echo $url; ?>">
    <input type="hidden" name="col" value="<?php echo $col; ?>">
    <input type="hidden" name="ids" value="<?php echo $ids; ?>">

    <div class="layui-form-item">
        <label class="layui-form-label w50">起始：</label>
        <div class="layui-input-inline w70">
            <input type="text" class="layui-input" value="" placeholder="" name="start">
        </div>
        <label class="layui-form-label w50">截止：</label>
        <div class="layui-input-inline w70">
            <input type="text" class="layui-input" value="" placeholder="" name="end">
        </div>
        <div class="layui-input-inline w70">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="formSubmit">保 存</button>
        </div>
    </div>

</form>
