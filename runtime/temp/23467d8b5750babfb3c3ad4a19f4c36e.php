<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:66:"D:\phpstudy_pro\WWW\video1/application/admin\view\group\index.html";i:1731729505;s:66:"D:\phpstudy_pro\WWW\video1\application\admin\view\public\head.html";i:1731557514;s:66:"D:\phpstudy_pro\WWW\video1\application\admin\view\public\foot.html";i:1568100986;}*/ ?>
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

    <div class="my-toolbar-box">

        <div class="layui-btn-group">
            <a data-href="<?php echo url('info'); ?>" class="layui-btn layui-btn-primary j-iframe"><i class="layui-icon">&#xe654;</i>添加</a>
            <a data-href="<?php echo url('del'); ?>" class="layui-btn layui-btn-primary j-page-btns confirm"><i class="layui-icon">&#xe640;</i>删除</a>
        </div>

    </div>

    <form class="layui-form " method="post" id="pageListForm">
        <table class="layui-table" lay-size="sm">
            <thead>
            <tr>
                <th width="25"><input type="checkbox" lay-skin="primary" lay-filter="allChoose"></th>
                <th width="100">编号</th>
                <th >名称</th>
                <th width="100">状态</th>
                <th width="100">永久</th>
                <!-- <th width="100">包天</th>
                <th width="100">包周</th>
                <th width="100">包月</th>
                <th width="100">包年</th> -->
                <th width="200">操作</th>
            </tr>
            </thead>

            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <tr>
                <td>
                    <?php if($vo['group_id'] > 2): ?>
                    <input type="checkbox" name="ids[]" value="<?php echo $vo['group_id']; ?>" class="layui-checkbox checkbox-ids" lay-skin="primary">
                    <?php endif; ?>
                </td>
                <td><?php echo $vo['group_id']; ?></td>
                <td><?php echo $vo['group_name']; ?></td>
                <td>
                    <?php if($vo['group_id'] > 2): ?>
                    <input type="checkbox" name="status" <?php if($vo['group_status'] == 1): ?>checked<?php endif; ?> value="<?php echo $vo['group_status']; ?>" lay-skin="switch" lay-filter="switchStatus" lay-text="正常|关闭" data-href="<?php echo url('field?col=group_status&ids='.$vo['group_id']); ?>">
                    <?php endif; ?>
                </td>
                <td><?php echo $vo['group_points_permanent']; ?></td>
                <!-- <td><?php echo $vo['group_points_day']; ?></td>
                <td><?php echo $vo['group_points_week']; ?></td>
                <td><?php echo $vo['group_points_month']; ?></td>
                <td><?php echo $vo['group_points_year']; ?></td> -->
                <td>
                    <a class="layui-badge-rim j-iframe" data-href="<?php echo url('info?id='.$vo['group_id']); ?>" href="javascript:;" title="编辑">编辑</a>
                    <?php if($vo['group_id'] > 2): ?>
                    <a class="layui-badge-rim j-tr-del" data-href="<?php echo url('del?ids='.$vo['group_id']); ?>" href="javascript:;" title="删除">删除</a>
                    <?php endif; ?>
                </td>
            </tr>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>

    </form>

    <blockquote class="layui-elem-quote layui-quote-nm">
        提示信息：<br>
        1.游客、普通会员属于系统内置会员组,无法删除和禁用; <br>2.请单独设置每个会员组的权限,不会向下继承权限;
    </blockquote>
    
    <form class="layui-form" id="userAgentsScore">
        <div class="layui-form-item layui-col-md4">
            <label class="layui-form-label">代理仙豆：</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" value="<?php echo $userAgentsScore; ?>" placeholder="请输入代理商仙豆"  name="user_agents_score">
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="" style="margin-left: 20px;">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="formSubmit" data-child="true">保 存</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="/static/js/admin_common.js"></script>

<script type="text/javascript">

    layui.use(['laypage', 'layer','form'], function() {
        var laypage = layui.laypage
                , layer = layui.layer
                , form = layui.form;

        form.on('submit(formSubmit)', function (data) {
            console.log(data.field);
            $.ajax({
                url: "<?php echo url('group/agentsScore'); ?>",
                type: "post",
                dataType: "json",
                data: data.field,
                beforeSend: function () {
                },
                success: function (r) {
                    if(r.code ==1){
                        layer.msg('保存成功');
                    }
                },
                complete: function () {

                }
            });
            return false;
        })
    });
</script>
</body>
</html>