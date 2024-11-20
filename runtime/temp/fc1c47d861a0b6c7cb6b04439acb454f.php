<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:72:"D:\phpstudy_pro\WWW\video1/application/admin\view\extend\pay\qqepay.html";i:1663254656;}*/ ?>
<div class="layui-tab-item">

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>明帝QQ钱包
            <a target="_blank" href="http://pay.md214.cn" class="layui-btn layui-btn-primary">点击进入注册</a>
        </legend>
    </fieldset>

    <div class="layui-form-item">
        <label class="layui-form-label">支付商家编号：</label>
        <div class="layui-input-inline w400">
            <input type="text" name="pay[qqepay][appid]" placeholder="" value="<?php echo $config['pay']['qqepay']['appid']; ?>" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">支付商家密钥：</label>
        <div class="layui-input-inline w400">
            <input type="text" name="pay[qqepay][appkey]" placeholder="" value="<?php echo $config['pay']['qqepay']['appkey']; ?>" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">接口地址：</label>
        <div class="layui-input-inline w400">
            <input type="text" name="pay[qqepay][apiurl]" placeholder="默认填写: http://pay.zmyzf.cn/" value="<?php echo $config['pay']['qqepay']['apiurl']; ?>" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商家收款平台：</label>
        <div class="layui-input-inline w400">
            <input type="text" name="pay[qqepay][type]" placeholder="" value="<?php echo $config['pay']['qqepay']['type']; ?>" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">1：微信；2：支付宝；3：QQ财付通（多个用逗号分隔）</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">支付方式名称：</label>
        <div class="layui-input-inline w400">
            <input type="text" name="pay[qqepay][name]" placeholder="" value="<?php echo $config['pay']['qqepay']['name']; ?>" class="layui-input">
        </div>
    </div>
    <!--<div class="layui-form-item">-->
        <!--<label class="layui-form-label">收款通知类型：</label>-->
        <!--<div class="layui-input-inline w400">-->
            <!--<input type="text" name="pay[zhapay][act]" placeholder="" value="<?php echo $config['pay']['zhapay']['act']; ?>" class="layui-input">-->
        <!--</div>-->
        <!--<div class="layui-form-mid layui-word-aux">2表示及时到账 1则为商家代收款</div>-->
    <!--</div>-->
</div>