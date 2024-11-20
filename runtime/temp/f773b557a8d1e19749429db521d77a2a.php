<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:66:"D:\phpstudy_pro\WWW\video1/application/admin\view\user\reward.html";i:1731987595;s:66:"D:\phpstudy_pro\WWW\video1\application\admin\view\public\head.html";i:1731557514;s:66:"D:\phpstudy_pro\WWW\video1\application\admin\view\public\foot.html";i:1568100986;}*/ ?>
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

        <div class="center mb10">
            <form class="layui-form " method="post">
                <div class="layui-input-inline w150">
                    <select name="level">
                        <option value="">选择级别</option>
                        <option value="1" <?php if($param['level'] == '1'): ?>selected <?php endif; ?>>一级分销</option>
                        <option value="2" <?php if($param['level'] == '2'): ?>selected <?php endif; ?>>二级分销</option>
                        <option value="3" <?php if($param['level'] == '3'): ?>selected <?php endif; ?>>三级分销</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <input type="text" autocomplete="off" placeholder="请输入搜索条件" class="layui-input" name="wd" value="<?php echo $param['wd']; ?>">
                </div>
                <input type="hidden" name="uid" value="<?php echo $param['uid']; ?>">
                <button class="layui-btn mgl-20 j-search" >查询</button>
            </form>
        </div>

        <div class="layui-btn-group">
            <!-- 总提成仙豆【<?php echo $data['points_cc_1']; ?>】 -->
            <a class="layui-btn ">一级分销总人数【<?php echo $data['level_cc_1']; ?>】</a>
            <!-- 总提成仙豆【<?php echo $data['points_cc_2']; ?>】 -->
            <a class="layui-btn layui-btn-normal">二级分销总人数【<?php echo $data['level_cc_2']; ?>】</a>
            <!-- 总提成仙豆【<?php echo $data['points_cc_3']; ?>】 -->
            <a class="layui-btn layui-btn-warm">三级分销总人数【<?php echo $data['level_cc_3']; ?>】</a>
            <a class="layui-btn layui-btn-primary">
                累计推广总人数【<?php echo $data['level_cc_1']+$data['level_cc_2']+$data['level_cc_3']; ?>】
                总提成仙豆【<?php echo $data['points_sum']; ?>】
            </a>
        </div>

    </div>

    <form class="layui-form " method="post" id="pageListForm">
        <table class="layui-table" lay-size="sm">
            <thead>
            <tr>
                <th width="25"><input type="checkbox" lay-skin="primary" lay-filter="allChoose"></th>
                <th width="100">编号</th>
                <th>名称</th>
                <th width="120">会员组</th>
                <th width="120">状态</th>
                <th width="120">分销级别</th>
                <th width="130">注册时间</th>
            </tr>
            </thead>
            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <tr>
                <td><input type="checkbox" name="ids[]" value="<?php echo $vo['user_id']; ?>" class="layui-checkbox checkbox-ids" lay-skin="primary"></td>
                <td><?php echo $vo['user_id']; ?></td>
                <td><?php echo $vo['user_name']; ?></td>
                <td><?php echo $vo['group_name']; ?></td>
                <td><?php if($vo['user_status'] == 1): ?><span class="layui-badge layui-bg-green">正常</span><?php else: ?><span class="layui-badge">关闭</span><?php endif; ?></td>
                <td><?php if($vo['user_pid'] == $param['uid']): ?>一级分销<?php elseif($vo['user_pid_2'] == $param['uid']): ?>二级分销<?php else: ?>三级分销<?php endif; ?></td>
                <td><?php echo mac_day($vo['user_reg_time'],color); ?></td>
            </tr>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
        <div id="pages" class="center"></div>
    </form>
</div>

<script type="text/javascript" src="/static/js/admin_common.js"></script>

<script type="text/javascript">
    var curUrl="<?php echo url('user/reward',$param); ?>";
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