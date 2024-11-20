<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:65:"D:\phpstudy_pro\WWW\video1/application/admin\view\cash\index.html";i:1731986118;s:66:"D:\phpstudy_pro\WWW\video1\application\admin\view\public\head.html";i:1731557514;s:66:"D:\phpstudy_pro\WWW\video1\application\admin\view\public\foot.html";i:1568100986;}*/ ?>
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

    <div class="my-toolbar-box" >
        <div class="center mb10">
            <form class="layui-form " method="post">
                <div class="layui-input-inline w150">
                    <select name="status">
                        <option value="">选择状态</option>
                        <option value="0" <?php if($param['status'] == '0'): ?>selected <?php endif; ?>>待审核</option>
                        <option value="1" <?php if($param['status'] == '1'): ?>selected <?php endif; ?>>提现成功</option>
                        <option value="2" <?php if($param['status'] == '1'): ?>selected <?php endif; ?>>提现失败</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <input type="text" autocomplete="off" placeholder="请输入搜索条件" class="layui-input" name="wd" value="<?php echo $param['wd']; ?>">
                </div>
                <button class="layui-btn mgl-20 j-search" >查询</button>
            </form>
        </div>

        <div class="layui-btn-group">
            <a data-href="<?php echo url('del'); ?>" class="layui-btn layui-btn-primary j-page-btns confirm"><i class="layui-icon">&#xe640;</i>删除</a>
            <!--<a data-href="<?php echo url('del'); ?>?ids=1&all=1" class="layui-btn layui-btn-primary j-ajax" confirm="确认清空数据吗？操作不可恢复"><i class="layui-icon">&#xe640;</i>清空</a>-->
            <!--<a data-href="<?php echo url('audit'); ?>" class="layui-btn layui-btn-primary j-page-btns confirm" confirm="确认审核数据吗？操作不可恢复"><i class="layui-icon">&#xe640;</i>审核</a>-->
        </div>
    </div>

     <form class="layui-form " method="post" id="pageListForm">
         <table class="layui-table" lay-size="sm">
            <thead>
            <tr>
                <th width="25"><input type="checkbox" lay-skin="primary" lay-filter="allChoose"></th>
                <th width="50">编号</th>
                <th width="50">用户</th>
                <th width="50">状态</th>
                <!-- <th width="50">提现方式</th> -->

                <!-- <th width="50">金豆</th> -->
                <th width="50">仙豆</th>

                <th width="50">金额</th>
                <!--<th width="50">银行</th>-->
                <th width="50">账号</th>
                <th width="50">姓名</th>
                <th width="100">备注</th>
                <th width="100">时间</th>
                <th width="100">审核时间</th>
                <th width="50">操作</th>
            </tr>
            </thead>

            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <tr>
                <td><input type="checkbox" name="ids[]" value="<?php echo $vo['id']; ?>" class="layui-checkbox checkbox-ids" lay-skin="primary"></td>
                <td><?php echo $vo['id']; ?></td>
                <td>[<?php echo $vo['user_id']; ?>]<?php echo $vo['user_name']; ?></td>
                <td><?php if($vo['status'] == 1): ?><span class="layui-badge layui-bg-green">提现成功</span><?php elseif($vo['status'] == 2): ?><span class="layui-badge layui-bg-gray">未通过</span><?php else: ?><span class="layui-badge">未审核</span><?php endif; ?></td>
                <!-- <td><?php echo mac_get_glog_withdraw_apply_ttype_text($vo['type']); ?></td> -->
                <td><?php echo $vo['num']; ?></td>
                <td><?php echo $vo['points_num']; ?></td>
                <!-- <td><?php echo $vo['gold_num']; ?></td> -->
                <td><?php echo $vo['account']; ?></td>
                <!--<td><?php echo $vo['cash_bank_no']; ?></td>-->
                <td><?php echo $vo['realname']; ?></td>
                <td><?php echo $vo['cash_remark']; ?></td>
                <td><?php echo mac_day($vo['created_time'],color); ?></td>
                <td><?php if($vo['status'] == 1): ?><?php echo mac_day($vo['success_time'],color); elseif($vo['status'] == 2): ?><?php echo mac_day($vo['fail_time'],color); else: ?>待审核<?php endif; ?></td>
                <td>
                    <a class="layui-badge-rim j-tr-del" data-href="<?php echo url('del?ids='.$vo['id']); ?>" href="javascript:;" title="删除">删除</a>
                    <?php if($vo['status'] == '0'): ?>
                    <a class="layui-badge-rim j-ajax" confirm="确定通过审核嘛？" data-href="<?php echo url('successApply?ids='.$vo['id']); ?>" href="javascript:;" title="审核">审核通过</a>
                    <?php endif; if($vo['status'] == '0'): ?>
                    <a class="layui-badge-rim j-ajax" confirm="确定驳回提现申请嘛，提现仙豆将返回原账户啊？" data-href="<?php echo url('failApply?ids='.$vo['id']); ?>" href="javascript:;" title="审核">审核不通过</a>
                    <?php endif; ?>
                </td>
            </tr>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>

        <div id="pages" class="center"></div>

    </form>
</div>

<script type="text/javascript" src="/static/js/admin_common.js"></script>


<script type="text/javascript">
    var curUrl="<?php echo url('cash/index',$param); ?>";
    layui.use(['laypage', 'layer'], function() {
        var laypage = layui.laypage
                , layer = layui.layer;

        laypage.render({
            elem: 'pages'
            ,count: <?php echo $total; ?>
            ,limit: <?php echo $limit; ?>
            ,curr: <?php echo $page; ?>
            ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
            ,jump: function(obj,first){
                if(!first){
                    location.href = curUrl.replace('%7Bpage%7D',obj.curr).replace('%7Blimit%7D',obj.limit);
                }
            }
        });
    });
</script>
</body>
</html>