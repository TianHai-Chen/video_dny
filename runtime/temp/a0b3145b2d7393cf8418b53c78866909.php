<?php if (!defined('THINK_PATH')) exit(); /*a:11:{s:41:"template/mxone/html_tplmx/user\cards.html";i:1731572996;s:72:"D:\phpstudy_pro\WWW\video1\template\mxone\html_tplmx\public\include.html";i:1629606714;s:66:"D:\phpstudy_pro\WWW\video1\template\mxone\html_tplmx\ads\adqj.html";i:1629606708;s:70:"D:\phpstudy_pro\WWW\video1\template\mxone\html_tplmx\user\include.html";i:1629606720;s:69:"D:\phpstudy_pro\WWW\video1\template\mxone\html_tplmx\public\head.html";i:1731557950;s:67:"D:\phpstudy_pro\WWW\video1\template\mxone\html_tplmx\user\head.html";i:1731572890;s:71:"D:\phpstudy_pro\WWW\video1\template\mxone\html_tplmx\public\paging.html";i:1629606714;s:69:"D:\phpstudy_pro\WWW\video1\template\mxone\html_tplmx\public\foot.html";i:1629606736;s:73:"D:\phpstudy_pro\WWW\video1\template\mxone\html_tplmx\public\tcnotice.html";i:1629606714;s:72:"D:\phpstudy_pro\WWW\video1\template\mxone\html_tplmx\public\website.html";i:1650943918;s:66:"D:\phpstudy_pro\WWW\video1\template\mxone\html_tplmx\ads\addb.html";i:1629606708;}*/ ?>
<!DOCTYPE html>
<html lang="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>订单记录 - 会员中心 -<?php echo $maccms['site_name']; ?></title>
	<meta name="keywords" content="<?php echo $maccms['site_keywords']; ?>"/>
	<meta name="description" content="<?php echo $maccms['site_description']; ?>"/>
	<?php $file = 'template/mxone/asset/admin/Mxone.php'; $newfile = 'application/admin/controller/Mxone.php'; if (file_exists($newfile)) {} else { copy($file,$newfile); } $file = 'template/mxone/asset/admin/mxonest.php'; $newfile = 'application/extra/mxonest.php'; if (file_exists($newfile)) {} else { copy($file,$newfile); } $file = 'template/mxone/asset/admin/mxcms.html'; $newfile = 'application/admin/view/system/mxcms.html'; if (file_exists($newfile)) {} else { copy($file,$newfile); } $mxonest = file_exists('application/extra/mxonest.php') ? require('application/extra/mxonest.php') : require(substr($maccms['path_tpl'], strlen($maccms['path'])).'asset/admin/mxonest.php'); if($mxonest['mxcms']['s4']['tbdm'] == 1): ?>
<?php echo $mxonest['mxcms']['s4']['tbdmtips']; endif; ?>
<script>var maccms={"path":"","mid":"<?php echo $maccms['mid']; ?>","url":"<?php echo $maccms['site_url']; ?>","wapurl":"<?php echo $maccms['site_wapurl']; ?>","mob_status":"<?php echo $maccms['mob_status']; ?>"};</script>
<link rel="icon" href="<?php echo mac_url_img($mxonest['mxcms']['s1']['logo2']); ?>" type="image/png" />
<link href="<?php echo $maccms['path']; ?>mxstatic/css/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo $maccms['path']; ?>mxstatic/css/aliicon.css" rel="stylesheet" type="text/css">
<?php if($mxonest['mxcms']['s2']['mryj'] == 0): ?><link disabled="" class="theme_black" type="text/css" rel="stylesheet" href="<?php echo $maccms['path']; ?>mxstatic/css/mxhtmlblack.css"><?php endif; if($mxonest['mxcms']['s2']['mryj'] == 1): ?><link type="text/css" rel="stylesheet" href="<?php echo $maccms['path']; ?>mxstatic/css/mxhtmlblack.css"><?php endif; if($mxonest['mxcms']['s2']['mryj'] == 1): ?><link disabled="" class="theme_white"  type="text/css" rel="stylesheet" href="<?php echo $maccms['path']; ?>mxstatic/css/white.css"><?php endif; ?>
<script src="<?php echo $maccms['path']; ?>mxstatic/js/jquery.js"></script>
<script type="text/javascript"  src="<?php echo $maccms['path']; ?>mxstatic/js/jquery.lazyload.js"></script>
<script src="<?php echo $maccms['path']; ?>mxstatic/js/jquery.autocomplete.js"></script>
<script src="<?php echo $maccms['path']; ?>mxstatic/js/jquery.cookie.js"></script>
<script src="<?php echo $maccms['path']; ?>mxstatic/js/home.js"></script>
<script type="text/javascript"  src="<?php echo $maccms['path']; ?>mxstatic/js/jquery.clipboard.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/layer/3.1.1/layer.js"></script>
<?php if($maccms['aid'] == 15): ?>
<script type="text/javascript">var vod_name='<?php echo $obj['vod_name']; ?>',vod_url=window.location.href,vod_part='<?php echo $obj['vod_play_list'][$param['sid']]['urls'][$param['nid']]['name']; ?>';</script>
<script type="text/javascript"  src="<?php echo $maccms['path']; ?>mxstatic/js/history.js"></script>
 <script type="text/javascript"  src="<?php echo $maccms['path']; ?>mxstatic/js/jquery.qrcode.min.js"></script>
 <script type="text/javascript"  src="<?php echo $maccms['path']; ?>mxstatic/js/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="<?php echo $maccms['path']; ?>mxstatic/css/swiper-bundle.min.css" type="text/css">
<?php endif; if($mxonest['mxcms']['s2']['gddhbg'] == 1): ?><style>.homepage .header-bg{background:<?php echo $mxonest['mxcms']['s2']['gddhbgdm']; ?>;}.homepage .header-bg::after{background:<?php echo $mxonest['mxcms']['s2']['gddhbgdm']; ?>;}.border-bottom::after, .header-content::after, .play .app-text::after{background-color: <?php echo $mxonest['mxcms']['s2']['gddhbgdm']; ?>;} .header-content{background:<?php echo $mxonest['mxcms']['s2']['gddhbgdm']; ?>!important;}</style><?php endif; ?>
<script src="<?php echo $maccms['path']; ?>mxstatic/js/script.js"></script>
<?php if($mxonest['mxcms']['s2']['mryj'] == 0): ?>
<script>
	var clothes = $.cookie('clothes');
	if (clothes) {
		if (clothes == 'white') {
			$('.theme_black').removeAttr('disabled');
		} else {
			$('.theme_black').attr('disabled', '');
		}
	} else {
		$.cookie('clothes', 'black', { expires: 365, path: '/' })
	}
</script>
<script>

	function clothesChange(){
		var clothes = $.cookie('clothes');
		if (clothes == 'black') {
			$.cookie('clothes','white', {expires: 365, path: '/'});  
			$('.theme_black').each(function(){
			    $(this).removeAttr('disabled');
			});
			
		} else {
			$.cookie('clothes','black', {expires: 365, path: '/'});  
			$('.theme_black').each(function(){
			    $(this).attr('disabled', '');
			});
		}
		clothes = $.cookie('clothes');
	}
</script>
<?php endif; if($mxonest['mxcms']['s2']['mryj'] == 1): ?>
<script>
	var clothes = $.cookie('clothes');
if (clothes) {
		if (clothes == 'black') {
			$('.theme_white').removeAttr('disabled');
		} else {
			$('.theme_white').attr('disabled', '');
		}
	} else {
		$.cookie('clothes', 'white', { expires: 365, path: '/' })
	}
</script>
<script>
	function clothesChange(){
		var clothes = $.cookie('clothes');
		if (clothes == 'white') {
			$.cookie('clothes','black', {expires: 365, path: '/'});  
			$('.theme_white').each(function(){
			    $(this).removeAttr('disabled');
			});
		} else {
			$.cookie('clothes','white', {expires: 365, path: '/'});  
			$('.theme_white').each(function(){
			    $(this).attr('disabled', '');
			});
		}
		clothes = $.cookie('clothes');
	}
</script>
<?php endif; if($mxonest['mxcms']['s4']['stylediy'] == 1): ?>
<style>
  <?php echo $mxonest['mxcms']['s4']['stylecss']; ?>  
</style>
<?php endif; if($mxonest['mxcms']['s3']['adqj'] == 1): ?>
<?php echo $mxonest['mxcms']['s3']['aadqj']; endif; ?>	 <!-- 全局广告位 -->
	 <link href="<?php echo $maccms['path']; ?>mxstatic/css/mxone.css" rel="stylesheet" type="text/css">
 <script src="<?php echo $maccms['path']; ?>static/js/jquery.imageupload.js"></script>
<style>
    .checkboxinput{-webkit-appearance: checkbox;}
    .nonemore{background: none;}
    [class^=icon-], [class*=" icon-"]{line-height: inherit!important;}
   button.btn-face {
    border-radius: 50%;
    width: 60px;
    height: 60px;
    font-size: 12px;
    background: #a9a9a936;
}
</style>
</head>
<body class="page">
 <?php if($maccms['aid'] == 1): ?>
<header id="header" class="wrapper" <?php if($mxonest['mxcms']['s2']['pcgddh'] == 0): ?>style="padding-top: 0!important;"<?php endif; ?>>
	<div class="header-content <?php if($mxonest['mxcms']['s2']['pcgddh'] == 0): ?>qxgddh<?php endif; ?>" >
		<div class="dianying-im">
			<div class="header-logo">
				<h1 class="slogan"><?php echo $mxonest['mxcms']['s1']['gg']; ?></h1>
				<div class="fixed-logo">
					<a href="<?php echo $maccms['path']; ?>" class="logo" title="<?php echo $maccms['site_name']; ?>"><img src="<?php echo mac_url_img($mxonest['mxcms']['s1']['logo1']); ?>" alt="<?php echo $maccms['site_name']; ?>"></a>
				</div>
			</div>
		</div>
		<div class="nav-search">
		   <form action="<?php echo mac_url('vod/search'); ?>" class="search-dh"></form>
		</div>
    
		<div class="nav">
			<ul class="nav-menu-items">
				<li class="nav-menu-item <?php if($maccms['aid'] == 1): ?>selected<?php endif; ?>">
					<a href="<?php echo $maccms['path']; ?>" title="<?php echo $maccms['site_name']; ?>首页"><?php if($mxonest['mxcms']['s2']['pcdhicon'] == 1): ?><i class="icon-home"></i><?php endif; ?> <span>首页</span></a>
				</li>
				<?php $__TAG__ = '{"order":"asc","by":"sort","ids":"'.$mxonest['mxcms']['s2']['daohangid'].'","id":"vo","key":"key"}';$__LIST__ = model("Type")->listCacheData($__TAG__); if(is_array($__LIST__['list']) || $__LIST__['list'] instanceof \think\Collection || $__LIST__['list'] instanceof \think\Paginator): $key = 0; $__LIST__ = $__LIST__['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key % 2 );++$key;?>
				<li class="nav-menu-item  <?php if(($vo['type_id'] == $GLOBALS[ 'type_id'] || $vo['type_id'] == $GLOBALS[ 'type_pid'])): ?>selected<?php endif; ?>">
					<a href="<?php echo mac_url_type($vo); ?>" title="<?php echo $vo['type_name']; ?>">
					     <?php if($mxonest['mxcms']['s2']['pcdhicon'] == 1): if($vo['type_id_1'] == $mxonest['mxcms']['s2']['num1']||$vo['type_id'] == $mxonest['mxcms']['s2']['num1']): ?>
                                  <i class="<?php echo $mxonest['mxcms']['s2']['icon1']; ?>"></i>
                                <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num2']||$vo['type_id'] == $mxonest['mxcms']['s2']['num2']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon2']; ?>"></i>
                                <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num3']||$vo['type_id'] == $mxonest['mxcms']['s2']['num3']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon3']; ?>"></i>
                                <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num4']||$vo['type_id'] == $mxonest['mxcms']['s2']['num4']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon4']; ?>"></i>
                                 <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num5']||$vo['type_id'] == $mxonest['mxcms']['s2']['num5']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon5']; ?>"></i>
                                 <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num6']||$vo['type_id'] == $mxonest['mxcms']['s2']['num6']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon6']; ?>"></i>
                                 <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num7']||$vo['type_id'] == $mxonest['mxcms']['s2']['num7']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon7']; ?>"></i>
                                <?php else: ?>
                                  <i class="<?php echo $mxonest['mxcms']['s2']['iconmr']; ?>"></i>
                                <?php endif; endif; ?>
                                <span><?php echo $vo['type_name']; ?></span>
					 </a>
				</li>
				<?php endforeach; endif; else: echo "" ;endif; if($mxonest['mxcms']['s2']['diy1'] == 1): ?>
					<li class="nav-menu-item">
					<a href="<?php echo $mxonest['mxcms']['s2']['diy1url']; ?>" target="_blank" title="<?php echo $mxonest['mxcms']['s2']['diy1name']; ?>">
					  <i class="<?php echo $mxonest['mxcms']['s2']['diy1icon']; ?>"></i> <span><?php echo $mxonest['mxcms']['s2']['diy1name']; ?></span>
					 </a>
				</li>
				<?php endif; if($mxonest['mxcms']['s2']['diy2'] == 1): ?>
					<li class="nav-menu-item">
					<a href="<?php echo $mxonest['mxcms']['s2']['diy2url']; ?>" target="_blank" title="<?php echo $mxonest['mxcms']['s2']['diy2name']; ?>" > 
					<i class="<?php echo $mxonest['mxcms']['s2']['diy2icon']; ?>"></i> <span><?php echo $mxonest['mxcms']['s2']['diy2name']; ?></span>
					</a>
				</li>
				<?php endif; if($mxonest['mxcms']['s2']['diy3'] == 1): ?>
					<li class="nav-menu-item">
					<a href="<?php echo $mxonest['mxcms']['s2']['diy3url']; ?>" target="_blank" title="<?php echo $mxonest['mxcms']['s2']['diy3name']; ?>" >
					 <i class="<?php echo $mxonest['mxcms']['s2']['diy3icon']; ?>"></i> <span><?php echo $mxonest['mxcms']['s2']['diy3name']; ?></span>
					 </a>
				</li>
				<?php endif; if($mxonest['mxcms']['s2']['zhiboym'] == 1): ?>
				<li class="nav-menu-item <?php if($maccms['aid'] == 7): ?>selected<?php endif; ?>">
					<a href="<?php echo mac_url('label/live'); ?>" title="<?php echo $maccms['site_name']; ?>直播" >
					<?php if($mxonest['mxcms']['s2']['pcdhicon'] == 1): ?> <i class="<?php echo $mxonest['mxcms']['s2']['diyliveicon']; ?>"></i><?php endif; ?><span>直播</span>
					 </a>
				</li>
					<?php endif; if($mxonest['mxcms']['s2']['wz0'] == 1): ?>
				<li class="nav-menu-item  domain plus">
					<a href="javascript:;" title="<?php echo $maccms['site_name']; ?>最新域名">
					   <?php if($mxonest['mxcms']['s2']['pcdhicon'] == 1): ?><i class="icon-domain"></i><?php endif; ?>  
					    <span>网址</span><em>+</em></a>
				</li>
					<?php endif; if($mxonest['mxcms']['s2']['app'] == 1): ?>	
				<li class="nav-menu-item">
					<a href="<?php echo mac_url('label/app'); ?>" title="下载<?php echo $maccms['site_name']; ?>APP"><i class="icon-app pc"></i><span>APP</span></a>
				</li>
			    <?php endif; ?>
			</ul>
		</div>
		 <?php if($mxonest['mxcms']['s2']['sydh'] == 1): ?>
			<div class="pc">
			<ul class="nav-menu-items">
			    	<li class="space-line-bold"></li>
					<li class="nav-menu-item drop ">
					<span class="nav-menu-icon">
                        <i class="<?php echo $mxonest['mxcms']['s2']['sydhicon']; ?>"></i>
                    </span>
					<div class="drop-content sub-block subw500">
						<div class="drop-content-box grid-box">
							<ul class="drop-content-items grid-items">
							 <?php $__TAG__ = '{"order":"asc","by":"sort","ids":"'.$mxonest['mxcms']['s2']['sydhall'].'","id":"vo","key":"key"}';$__LIST__ = model("Type")->listCacheData($__TAG__); if(is_array($__LIST__['list']) || $__LIST__['list'] instanceof \think\Collection || $__LIST__['list'] instanceof \think\Paginator): $key = 0; $__LIST__ = $__LIST__['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key % 2 );++$key;?>			
								<li class="grid-item">
									<a href="<?php echo mac_url_type($vo); ?>" title="<?php echo $vo['type_name']; ?>">
										<div class="grid-item-name"><?php echo $vo['type_name']; ?></div>
									</a>
								</li>
								<?php endforeach; endif; else: echo "" ;endif; ?>	
							</ul>
						</div>
					</div>
					<div class="shortcuts-mobile-overlay"></div>
				</li>
			</ul>
		</div>
		<?php endif; ?>
		<div class="header-module">
			<ul class="nav-menu-items">
			    <?php if($mxonest['mxcms']['s2']['wapsydh'] == 1): ?>
				<li class="nav-menu-item drop"><span class="nav-menu-icon"><i class="icon-all"></i></span>
					<div class="drop-content sub-block">
						<div class="drop-content-box grid-box">
							<ul class="drop-content-items grid-items">
								<li class="grid-item">
									<a href="<?php echo $maccms['path']; ?>"><i class="icon-home"></i>
										<div class="grid-item-name" title="<?php echo $maccms['site_name']; ?>首页">首页</div>
									</a>
								</li>
								<?php $__TAG__ = '{"order":"asc","by":"sort","ids":"'.$mxonest['mxcms']['s5']['wapdaohangid'].'","id":"vo","key":"key"}';$__LIST__ = model("Type")->listCacheData($__TAG__); if(is_array($__LIST__['list']) || $__LIST__['list'] instanceof \think\Collection || $__LIST__['list'] instanceof \think\Paginator): $key = 0; $__LIST__ = $__LIST__['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key % 2 );++$key;?>
								<li class="grid-item">
									<a href="<?php echo mac_url_type($vo); ?>" title="<?php echo $vo['type_name']; ?>">
										<?php if($vo['type_id_1'] == $mxonest['mxcms']['s5']['num1']||$vo['type_id'] == $mxonest['mxcms']['s5']['num1']): ?>
										<i class="<?php echo $mxonest['mxcms']['s5']['icon1']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num2']||$vo['type_id'] == $mxonest['mxcms']['s5']['num2']): ?>
										<i class="<?php echo $mxonest['mxcms']['s5']['icon2']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num3']||$vo['type_id'] == $mxonest['mxcms']['s5']['num3']): ?>
										<i class="<?php echo $mxonest['mxcms']['s5']['icon3']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num4']||$vo['type_id'] == $mxonest['mxcms']['s5']['num4']): ?>
										<i class="<?php echo $mxonest['mxcms']['s5']['icon4']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num5']||$vo['type_id'] == $mxonest['mxcms']['s5']['num5']): ?>
										<i class="<?php echo $mxonest['mxcms']['s5']['icon5']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num6']||$vo['type_id'] == $mxonest['mxcms']['s5']['num6']): ?>
										<i class="<?php echo $mxonest['mxcms']['s5']['icon6']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num7']||$vo['type_id'] == $mxonest['mxcms']['s5']['num7']): ?>
										<i class="<?php echo $mxonest['mxcms']['s5']['icon7']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num8']||$vo['type_id'] == $mxonest['mxcms']['s5']['num8']): ?>
										<i class="<?php echo $mxonest['mxcms']['s5']['icon8']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num9']||$vo['type_id'] == $mxonest['mxcms']['s5']['num9']): ?>
										<i class="<?php echo $mxonest['mxcms']['s5']['icon9']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num10']||$vo['type_id'] == $mxonest['mxcms']['s5']['num10']): ?>
										<i class="<?php echo $mxonest['mxcms']['s5']['icon10']; ?>"></i> 
										<?php else: ?>
										<i class="<?php echo $mxonest['mxcms']['s5']['iconmr']; ?>"></i>
										<?php endif; ?>
										<div class="grid-item-name"><?php echo $vo['type_name']; ?></div>
									</a>
								</li>
								<?php endforeach; endif; else: echo "" ;endif; if($mxonest['mxcms']['s5']['diy1'] == 1): ?>
								<li class="grid-item">
									<a target="_blank" href="<?php echo $mxonest['mxcms']['s5']['diy1url']; ?>" title="<?php echo $mxonest['mxcms']['s5']['diy1name']; ?>">
										<i class="<?php echo $mxonest['mxcms']['s5']['diy1icon']; ?>"></i>
										<div class="grid-item-name"><?php echo $mxonest['mxcms']['s5']['diy1name']; ?></div>
									</a>
								</li>
								<?php endif; if($mxonest['mxcms']['s5']['diy2'] == 1): ?>
								<li class="grid-item">
									<a  target="_blank" href="<?php echo $mxonest['mxcms']['s5']['diy2url']; ?>" title="<?php echo $mxonest['mxcms']['s5']['diy2name']; ?>">
										<i class="<?php echo $mxonest['mxcms']['s5']['diy2icon']; ?>"></i>
										<div class="grid-item-name"><?php echo $mxonest['mxcms']['s5']['diy2name']; ?></div>
									</a>
								</li>
								<?php endif; if($mxonest['mxcms']['s2']['wz0'] == 1): ?>
								<li class="grid-item">
									<a href="<?php echo mac_url('label/web'); ?>"><i class="icon-domain"></i>
										<div class="grid-item-name" title="网址">网址</div>
									</a>
								</li>
								<?php endif; ?>
								<li class="grid-item grid-more">
									<a class="grid-more-link" href="<?php echo mac_url_type($obj,['id'=>1],'show'); ?>" title="查看全部影片">
										<div class="grid-item-name">全部影片</div>
									</a>
								</li>
								<?php if($mxonest['mxcms']['s2']['app'] == 1): ?>
								<li class="grid-item grid-more android">
									<a href="<?php echo mac_url('label/app'); ?>" class="grid-more-link" title="下载<?php echo $maccms['site_name']; ?>APP">
										<div class="grid-item-name">下载客户端</div>
									</a>
								</li>
								<?php endif; ?>
							</ul>
						</div>
					</div>
					<div class="shortcuts-mobile-overlay"></div>
				</li>
					<?php endif; ?>
				<li class="nav-menu-item nav-menu-search"><i class="icon-search"></i></li>
				<li class="space-line-bold"></li>
				<li class="nav-menu-item drop"><span class="nav-menu-icon"><i class="icon-watch-history"></i></span>
					<div class="drop-content drop-history">
						<div class="drop-content-box">
							<ul class="drop-content-items" id="history">
								<li class="list-item list-item-title">
									<a href="" class="playlist historyclean"><i class="icon-clear"></i></a>
									<strong>我的观影记录</strong></li>
							</ul>
						</div>
					</div>
					<div class="shortcuts-mobile-overlay"></div>
				</li>
				<?php if($mxonest['mxcms']['s2']['user'] == 1): if($maccms['user_status'] == 1): ?>
				<li class="space-line-bold"></li>
				<li class="nav-menu-item drop wapblock">
					<a class="mac_user" href="javascript:;" title="会员中心"><i class="iconfont icon-yonghu-fuben"></i></a>
				</li>
				<?php endif; endif; ?>
			</ul>
		</div>
	</div>
	<div id="search-content">
		<div class="index-logo"><span class="logo-s"><img src="<?php echo mac_url_img($mxonest['mxcms']['s1']['logo1']); ?>" title="<?php echo $maccms['site_name']; ?>"></span></div>
		<form action="<?php echo mac_url('vod/search'); ?>">
			<div class="search-main">
				<div class="search-box">
					<input class="search-input ac_wd" id="txtKeywords" type="text" name="wd" autocomplete="off" placeholder="<?php echo $mxonest['mxcms']['s1']['searchwd']; ?>">
					<div class="search-drop">
						<div class="drop-content-items ac_hot none">
							<div class="list-item list-item-title"><strong>大家都在搜这些影片</strong></div>
							<div class="search-tag">
								<?php $_6735b507a3912=explode(',',$maccms['search_hot']); if(is_array($_6735b507a3912) || $_6735b507a3912 instanceof \think\Collection || $_6735b507a3912 instanceof \think\Paginator): if( count($_6735b507a3912)==0 ) : echo "" ;else: foreach($_6735b507a3912 as $key2=>$vo2): ?>
								<a href="<?php echo mac_url('vod/search',['wd'=>$vo2]); ?>" class="<?php if($key2 < 4): ?>hot <?php else: endif; ?>"><i class="icon-hot"></i><?php echo $vo2; ?></a>
								<?php endforeach; endif; else: echo "" ;endif; ?>
							</div>
						</div>
					</div>
					 <?php if($mxonest['mxcms']['s2']['searchhoticon'] == 1): ?><a href="<?php echo mac_url('label/top'); ?>" class="search-btn search-cupfox" id="search-cupfox" title="<?php echo $maccms['site_name']; ?>排行榜" ><i class="iconfont icon-paihangbang1 phb"></i></a><?php endif; ?>
					<button class="search-btn search-go" type="submit"><i class="icon-search"></i></button>
					<button class="cancel-btn" type="button">取消</button>
				</div>
			</div>
		</form>
	</div>
</header>
<?php else: ?>
<header id="header" class="wrapper" <?php if($mxonest['mxcms']['s2']['pcgddh'] == 0): ?>style="padding-top: 0!important;"<?php endif; ?>>
	<div class="header-content  <?php if($mxonest['mxcms']['s2']['pcgddh'] == 0): ?>qxgddh<?php endif; ?>">
		<div class="content">
			<div class="brand">
				<a href="<?php echo $maccms['path']; ?>" class="logo" title="<?php echo $maccms['site_name']; ?>"><img src="<?php echo mac_url_img($mxonest['mxcms']['s1']['logo2']); ?>" alt="<?php echo $maccms['site_name']; ?>"></a>
			</div>

			<div class="nav-search">
				<form action="<?php echo mac_url('vod/search'); ?>" class="search-dh">
				    <?php if($maccms['aid'] != 13): ?>
					<div class="search-box"><input class="search-input ac_wd txtKeywords" type="text" name="wd" autocomplete="off" placeholder="<?php echo $mxonest['mxcms']['s1']['searchwd']; ?>">
						<div class="search-drop">
							<div class="drop-content-items ac_hot none">
								<div class="list-item list-item-title"><strong>大家都在搜这些影片</strong></div>
								<div class="search-tag">
									<?php $_6735b507a37f7=explode(',',$maccms['search_hot']); if(is_array($_6735b507a37f7) || $_6735b507a37f7 instanceof \think\Collection || $_6735b507a37f7 instanceof \think\Paginator): if( count($_6735b507a37f7)==0 ) : echo "" ;else: foreach($_6735b507a37f7 as $key2=>$vo2): ?>
									<a href="<?php echo mac_url('vod/search',['wd'=>$vo2]); ?>" class="<?php if($key2 < 4): ?>hot <?php else: endif; ?>"><i class="icon-hot"></i><?php echo $vo2; ?></a>
									<?php endforeach; endif; else: echo "" ;endif; ?>
								</div>
							</div>
						</div>
					     <?php if($mxonest['mxcms']['s2']['searchhoticon'] == 1): ?><a href="<?php echo mac_url('label/top'); ?>" class="search-btn search-cupfox" id="search-cupfox" title="<?php echo $maccms['site_name']; ?>排行榜" ><i class="iconfont icon-paihangbang1 phb"></i></a><?php endif; ?>
						<button class="search-btn search-go" type="submit"><i class="icon-search"></i></button>
						<button class="cancel-btn" type="button">取消</button>
					</div>
					<?php endif; ?>
				</form>
			</div>

			<div class="nav">
				<ul class="nav-menu-items">
					<li class="nav-menu-item <?php if($maccms['aid'] == 1): ?>selected<?php endif; ?>">
						<a href="<?php echo $maccms['path']; ?>" title="<?php echo $maccms['site_name']; ?>首页">
						<?php if($mxonest['mxcms']['s2']['pcdhicon'] == 1): ?><i class="icon-home nav-menu-item-name-white"></i><?php endif; ?> <span class="nav-menu-item-name">首页</span></a>
					</li>
					<?php $__TAG__ = '{"order":"asc","by":"sort","ids":"'.$mxonest['mxcms']['s2']['daohangid'].'","id":"vo","key":"key"}';$__LIST__ = model("Type")->listCacheData($__TAG__); if(is_array($__LIST__['list']) || $__LIST__['list'] instanceof \think\Collection || $__LIST__['list'] instanceof \think\Paginator): $key = 0; $__LIST__ = $__LIST__['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key % 2 );++$key;?>
					<li class="nav-menu-item  <?php if(($vo['type_id'] == $GLOBALS[ 'type_id'] || $vo['type_id'] == $GLOBALS[ 'type_pid'])): ?>selected<?php endif; ?>">
						<a href="<?php echo mac_url_type($vo); ?>" title="<?php echo $vo['type_name']; ?>">
						    <?php if($mxonest['mxcms']['s2']['pcdhicon'] == 1): if($vo['type_id_1'] == $mxonest['mxcms']['s2']['num1']||$vo['type_id'] == $mxonest['mxcms']['s2']['num1']): ?>
                                  <i class="<?php echo $mxonest['mxcms']['s2']['icon1']; ?> nav-menu-item-name-white"></i>
                                <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num2']||$vo['type_id'] == $mxonest['mxcms']['s2']['num2']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon2']; ?> nav-menu-item-name-white"></i>
                                <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num3']||$vo['type_id'] == $mxonest['mxcms']['s2']['num3']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon3']; ?> nav-menu-item-name-white"></i>
                                <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num4']||$vo['type_id'] == $mxonest['mxcms']['s2']['num4']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon4']; ?> nav-menu-item-name-white"></i>
                                 <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num5']||$vo['type_id'] == $mxonest['mxcms']['s2']['num5']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon5']; ?> nav-menu-item-name-white"></i>
                                 <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num6']||$vo['type_id'] == $mxonest['mxcms']['s2']['num6']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon6']; ?> nav-menu-item-name-white"></i>
                                 <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s2']['num7']||$vo['type_id'] == $mxonest['mxcms']['s2']['num7']): ?>
                                <i class="<?php echo $mxonest['mxcms']['s2']['icon7']; ?> nav-menu-item-name-white"></i>
                                <?php else: ?>
                                  <i class="<?php echo $mxonest['mxcms']['s2']['iconmr']; ?> nav-menu-item-name-white"></i>
                                <?php endif; endif; ?> 
						    <span class="nav-menu-item-name"><?php echo $vo['type_name']; ?></span></a>
					</li>
					<?php endforeach; endif; else: echo "" ;endif; if($mxonest['mxcms']['s2']['diy1'] == 1): ?>
					<li class="nav-menu-item">
					<a target="_blank" href="<?php echo $mxonest['mxcms']['s2']['diy1url']; ?>" class="nav-link" >
					  <i class="<?php echo $mxonest['mxcms']['s2']['diy1icon']; ?> nav-menu-item-name-white"></i> 
					   <span class="nav-menu-item-name"> <?php echo $mxonest['mxcms']['s2']['diy1name']; ?></span>
					 </a>
				</li>
				<?php endif; if($mxonest['mxcms']['s2']['diy2'] == 1): ?>
					<li class="nav-menu-item">
					<a target="_blank" href="<?php echo $mxonest['mxcms']['s2']['diy2url']; ?>" class="nav-link" > 
					<i class="<?php echo $mxonest['mxcms']['s2']['diy2icon']; ?> nav-menu-item-name-white"></i> 
					 <span class="nav-menu-item-name"> <?php echo $mxonest['mxcms']['s2']['diy2name']; ?></span>
					</a>
				</li>
				<?php endif; if($mxonest['mxcms']['s2']['diy3'] == 1): ?>
					<li class="nav-menu-item">
					<a target="_blank" href="<?php echo $mxonest['mxcms']['s2']['diy3url']; ?>" class="nav-link" >
					 <i class="<?php echo $mxonest['mxcms']['s2']['diy3icon']; ?> nav-menu-item-name-white"></i> 
					  <span class="nav-menu-item-name"> <?php echo $mxonest['mxcms']['s2']['diy3name']; ?></span>
					 </a>
				</li>
				<?php endif; if($mxonest['mxcms']['s2']['zhiboym'] == 1): ?>
				<li class="nav-menu-item <?php if($maccms['aid'] == 7): ?>selected<?php endif; ?>">
					<a href="<?php echo mac_url('label/live'); ?>" title="<?php echo $maccms['site_name']; ?>直播" >
					<?php if($mxonest['mxcms']['s2']['pcdhicon'] == 1): ?> <i class="<?php echo $mxonest['mxcms']['s2']['diyliveicon']; ?>"></i><?php endif; ?><span class="nav-menu-item-name">直播</span>
					 </a>
				</li>
					<?php endif; if($mxonest['mxcms']['s2']['wz0'] == 1): ?>	
					<li class="nav-menu-item  domain plus">
						<a href="javascript:;" title="<?php echo $maccms['site_name']; ?>最新域名">
						 <?php if($mxonest['mxcms']['s2']['pcdhicon'] == 1): ?><i class="icon-domain nav-menu-item-name-white"></i><?php endif; ?>  
						    <span class="nav-menu-item-name">网址</span><em>+</em></a>
					</li>
					 <?php endif; if($mxonest['mxcms']['s2']['app'] == 1): ?> 
					<li class="nav-menu-item">
					<a href="<?php echo mac_url('label/app'); ?>" title="下载<?php echo $maccms['site_name']; ?>APP"><i class="icon-app pc"></i><span class="nav-menu-item-name">APP</span></a>
					</li>
					 <?php endif; ?>
					 
				</ul>
			</div>
				 <?php if($mxonest['mxcms']['s2']['sydh'] == 1): ?>
			<div class="pc">
			<ul class="nav-menu-items">
			    	<li class="space-line-bold"></li>
					<li class="nav-menu-item drop ">
					<span class="nav-menu-icon">
                        <i class="<?php echo $mxonest['mxcms']['s2']['sydhicon']; ?>"></i>
                    </span>
					<div class="drop-content sub-block subw500">
						<div class="drop-content-box grid-box">
							<ul class="drop-content-items grid-items">
							 <?php $__TAG__ = '{"order":"asc","by":"sort","ids":"'.$mxonest['mxcms']['s2']['sydhall'].'","id":"vo","key":"key"}';$__LIST__ = model("Type")->listCacheData($__TAG__); if(is_array($__LIST__['list']) || $__LIST__['list'] instanceof \think\Collection || $__LIST__['list'] instanceof \think\Paginator): $key = 0; $__LIST__ = $__LIST__['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key % 2 );++$key;?>			
								<li class="grid-item">
									<a href="<?php echo mac_url_type($vo); ?>" title="<?php echo $vo['type_name']; ?>">
										<div class="grid-item-name"><?php echo $vo['type_name']; ?></div>
									</a>
								</li>
								<?php endforeach; endif; else: echo "" ;endif; ?>	
							</ul>
						</div>
					</div>
					<div class="shortcuts-mobile-overlay"></div>
				</li>
			</ul>
		</div>
		<?php endif; ?>
			<div class="header-module">
				<ul class="nav-menu-items">
				     <?php if($mxonest['mxcms']['s2']['wapsydh'] == 1): ?>
					<li class="nav-menu-item drop"><span class="nav-menu-icon"><i class="icon-all"></i></span>
						<div class="drop-content sub-block">
							<div class="drop-content-box grid-box">
								<ul class="drop-content-items grid-items">
									<li class="grid-item">
										<a href="<?php echo $maccms['path']; ?>"><i class="icon-home"></i>
											<div class="grid-item-name" title="<?php echo $maccms['site_name']; ?>首页">首页</div>
										</a>
									</li>
									<?php $__TAG__ = '{"order":"asc","by":"sort","ids":"'.$mxonest['mxcms']['s5']['wapdaohangid'].'","id":"vo","key":"key"}';$__LIST__ = model("Type")->listCacheData($__TAG__); if(is_array($__LIST__['list']) || $__LIST__['list'] instanceof \think\Collection || $__LIST__['list'] instanceof \think\Paginator): $key = 0; $__LIST__ = $__LIST__['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key % 2 );++$key;?>
									<li class="grid-item">
										<a href="<?php echo mac_url_type($vo); ?>" title="<?php echo $vo['type_name']; ?>">
											<?php if($vo['type_id_1'] == $mxonest['mxcms']['s5']['num1']||$vo['type_id'] == $mxonest['mxcms']['s5']['num1']): ?>
											<i class="<?php echo $mxonest['mxcms']['s5']['icon1']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num2']||$vo['type_id'] == $mxonest['mxcms']['s5']['num2']): ?>
											<i class="<?php echo $mxonest['mxcms']['s5']['icon2']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num3']||$vo['type_id'] == $mxonest['mxcms']['s5']['num3']): ?>
											<i class="<?php echo $mxonest['mxcms']['s5']['icon3']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num4']||$vo['type_id'] == $mxonest['mxcms']['s5']['num4']): ?>
											<i class="<?php echo $mxonest['mxcms']['s5']['icon4']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num5']||$vo['type_id'] == $mxonest['mxcms']['s5']['num5']): ?>
											<i class="<?php echo $mxonest['mxcms']['s5']['icon5']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num6']||$vo['type_id'] == $mxonest['mxcms']['s5']['num6']): ?>
											<i class="<?php echo $mxonest['mxcms']['s5']['icon6']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num7']||$vo['type_id'] == $mxonest['mxcms']['s5']['num7']): ?>
											<i class="<?php echo $mxonest['mxcms']['s5']['icon7']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num8']||$vo['type_id'] == $mxonest['mxcms']['s5']['num8']): ?>
											<i class="<?php echo $mxonest['mxcms']['s5']['icon8']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num9']||$vo['type_id'] == $mxonest['mxcms']['s5']['num9']): ?>
											<i class="<?php echo $mxonest['mxcms']['s5']['icon9']; ?>"></i> <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s5']['num10']||$vo['type_id'] == $mxonest['mxcms']['s5']['num10']): ?>
											<i class="<?php echo $mxonest['mxcms']['s5']['icon10']; ?>"></i> <?php else: ?>
											<i class="<?php echo $mxonest['mxcms']['s5']['iconmr']; ?>"></i> <?php endif; ?>
											<div class="grid-item-name"><?php echo $vo['type_name']; ?></div>
										</a>
									</li>
									<?php endforeach; endif; else: echo "" ;endif; if($mxonest['mxcms']['s5']['diy1'] == 1): ?>
									<li class="grid-item">
										<a target="_blank" href="<?php echo $mxonest['mxcms']['s5']['diy1url']; ?>" title="<?php echo $mxonest['mxcms']['s5']['diy1name']; ?>">
											<i class="<?php echo $mxonest['mxcms']['s5']['diy1icon']; ?>"></i>
											<div class="grid-item-name"><?php echo $mxonest['mxcms']['s5']['diy1name']; ?></div>
										</a>
									</li>
									<?php endif; if($mxonest['mxcms']['s5']['diy2'] == 1): ?>
									<li class="grid-item">
										<a target="_blank" href="<?php echo $mxonest['mxcms']['s5']['diy2url']; ?>" title="<?php echo $mxonest['mxcms']['s5']['diy2name']; ?>">
											<i class="<?php echo $mxonest['mxcms']['s5']['diy2icon']; ?>"></i>
											<div class="grid-item-name"><?php echo $mxonest['mxcms']['s5']['diy2name']; ?></div>
										</a>
									</li>
									<?php endif; if($mxonest['mxcms']['s2']['wz0'] == 1): ?>
									<li class="grid-item">
										<a href="<?php echo mac_url('label/web'); ?>"><i class="icon-domain"></i>
											<div class="grid-item-name" title="网址">网址</div>
										</a>
									</li>
									<?php endif; ?>
									<li class="grid-item grid-more">
										<a class="grid-more-link" href="<?php echo mac_url_type($obj,['id'=>1],'show'); ?>" title="查看全部影片">
											<div class="grid-item-name">全部影片</div>
										</a>
									</li>
									<?php if($mxonest['mxcms']['s2']['app'] == 1): ?>
									<li class="grid-item grid-more android">
										<a href="<?php echo mac_url('label/app'); ?>" class="grid-more-link" title="下载<?php echo $maccms['site_name']; ?>APP">
											<div class="grid-item-name">下载客户端</div>
										</a>
									</li>
									<?php endif; ?>
								</ul>
							</div>
						</div>
						<div class="shortcuts-mobile-overlay"></div>
					</li>
					<?php endif; ?>
					
					<li class="nav-menu-item nav-menu-search"><i class="icon-search"></i></li>
					<li class="space-line-bold"></li>
					<li class="nav-menu-item drop"><span class="nav-menu-icon"><i class="icon-watch-history"></i></span>
						<div class="drop-content drop-history">
							<div class="drop-content-box">
								<ul class="drop-content-items" id="history">
									<li class="list-item list-item-title">
										<a href="" class="playlist historyclean"><i class="icon-clear"></i></a>
										<strong>我的观影记录</strong></li>
								</ul>
							</div>
						</div>
						<div class="shortcuts-mobile-overlay"></div>
					</li>
					<?php if($mxonest['mxcms']['s2']['user'] == 1): if($maccms['user_status'] == 1): ?>
					<li class="space-line-bold"></li>
					<li class="nav-menu-item drop wapblock">
						<a class="mac_user" href="javascript:;" title="会员中心"><i class="iconfont icon-yonghu-fuben"></i><span></span></a>
					</li>
					<?php endif; endif; ?>
				</ul>
			</div>
		</div>
	</div>
</header>

<?php endif; if($mxonest['mxcms']['s2']['pcgddh'] == 1): ?>
<script>
		 $(".nav-menu-search").click(function () {
             $(".nav-search").addClass("block");
         });
	$(document).scroll(function() {
		var H = $(document).scrollTop();
		if(H > 20) {
		  $(".header-content").addClass("header-bg");
		} else {
		  $(".header-content").removeClass("header-bg");
		}
		if(H > 140) {
          $(".header-content").addClass("header-bg");
         $(".search-dh").append($(".search-box"));
           $(".nav-menu-search").click(function () {
             $(".nav-search").addClass("block");
         });
		} else {
         $(".header-content").removeClass("header-bg");
          $(".search-main").append($(".search-box"));
         
		}
	});
</script>
<?php endif; ?> 
  
<div class="container">
    <div class="row"> 
    	<div class="col-md-wide-25 col-sm-wide-1 col-xs-1 padding-0 hidden-sm hidden-xs">
    		<div class="mxone-pannel mxone-pannel-bg clearfix">
	<div class="mxone-pannel-box clearfix">
		<div class="mxone-pannel_bd clearfix">
			<div class="mxone-user__name bottom-line clearfix">
				<a class="more pull-right nonemore" href="<?php echo url('user/info'); ?>"><i class="icon-arrow-right-o"></i></a>
				<img class="face" width="60" height="60" src="<?php echo mac_url_img(mac_default($obj['user_portrait'],'static/images/touxiang.png')); ?>">
				<h3><a href="<?php echo url('user/info'); ?>"><?php echo $obj['user_name']; ?></a></h3>				
				<p class="margin-0 text-red">账户仙豆：<?php echo $obj['user_points']; ?></p>
			</div>
			<ul class="mxone-user__head">
				<li><a class="bottom-line" href="<?php echo url('user/upgrade'); ?>">会员分组：<span class="pull-right"><?php echo $obj['group']['group_name']; ?></span></a></li>
				<li><a class="bottom-line" href="<?php echo url('user/upgrade'); ?>">会员期限：<span class="pull-right"><?php if($obj['group_id'] > 2): ?>永久<?php else: endif; ?></span></a></li>
				<!-- <li><a class="bottom-line" href="<?php echo url('user/upgrade'); ?>">会员期限：<span class="pull-right"><?php if($obj['group_id'] < 3): ?>无限期<?php else: ?><?php echo mac_day($obj['user_end_time']); endif; ?></span></a></li> -->
				<li class="hidden-xs"><a class="bottom-line" href="<?php echo url('user/index'); ?>"><i class="icon-arrow-right-o pull-right"></i>我的资料</a></li>
				<li class="visible-xs"><a class="bottom-line" href="<?php echo url('user/info'); ?>"><i class="icon-arrow-right-o pull-right"></i>修改资料</a></li>
				<li><a class="bottom-line" href="<?php echo url('user/favs'); ?>"><i class="icon-arrow-right-o pull-right"></i>我的收藏</a></li>
				<li><a class="bottom-line" href="<?php echo url('user/plays'); ?>"><i class="icon-arrow-right-o pull-right"></i>播放记录</a></li>
				<li><a class="bottom-line" href="<?php echo url('user/downs'); ?>"><i class="icon-arrow-right-o pull-right"></i>下载记录</a></li>
				<li><a class="bottom-line" href="<?php echo url('user/buy'); ?>"><i class="icon-arrow-right-o pull-right"></i>在线充值</a></li>
				<li><a class="bottom-line" href="<?php echo url('user/upgrade'); ?>"><i class="icon-arrow-right-o pull-right"></i>升级会员</a></li>
				<li><a class="bottom-line" href="<?php echo url('user/orders'); ?>"><i class="icon-arrow-right-o pull-right"></i>充值记录</a></li>
				<li><a class="bottom-line urlcopy" href="javascript:;" data-clipboard-text="http://<?php echo $maccms['site_url']; ?><?php echo mac_url('user/reg'); ?>?uid=<?php echo $obj['user_id']; ?>"><i class="icon-arrow-right-o pull-right"></i>推广链接</a></li>
			</ul>
			<p class="text-center" style="margin-top: 12px;"><a class="btn btn-default" href="<?php echo url('user/logout'); ?>">退出登录</a></p>
		</div>
	</div>
</div>
  <div class="shortcuts-box"><div id="shortcuts-info"></div></div>
<script>
	$(".face").imageUpload({
		formAction: "<?php echo url('user/portrait'); ?>",
		inputFileName:'file',
		browseButtonValue: '<i class="iconfont icon-shangchuan" style="color: #fff;"></i>',
		browseButtonClass:'btn-face',
		automaticUpload: true,
		hideDeleteButton: true,
		hover:true
	})
	$(".face").on("imageUpload.uploadFailed", function (ev, err) {
		layer.msg(err);
	});
</script>					
    	</div>
    	<div class="col-md-wide-75 col-sm-wide-1 col-xs-1 mxone-pannel-side">
    		<div class="mxone-pannel mxone-pannel-bg clearfix">
				<div class="mxone-pannel-box clearfix">
					<div class="mxone-pannel_bd clearfix">
						<div class="mxone-pannel_hd">
							<div class="mxone-pannel__head active bottom-line clearfix">
								<h3 class="title">
									充值记录
								</h3>
								<ul class="navuser nav-tabs pull-right">
									<li><a href="<?php echo url('user/orders'); ?>">在线充值记录</a></li>
									<li class="active"><a href="<?php echo url('user/cards'); ?>">充值卡记录</a></li>
								</ul>
							</div>																		
						</div>
						<div class="mxone-pannel_bd clearfix">
							<form id="form1" name="form1" method="post">
								<ul class="mxone-vodlist__text striped to-color col-pd clearfix">
									<li class="striped-head clearfix">
										<span class="col-md-wide-10 col-sm-wide-10 hidden-xs">编号</span>
										<span class="col-md-wide-4 col-sm-wide-4 col-xs-wide-7">卡号</span>
										<span class="col-md-wide-15 col-sm-wide-15 hidden-xs">面值</span>
										<span class="col-md-wide-15 col-sm-wide-15 hidden-xs">仙豆</span>
										<span class="col-md-wide-2 col-sm-wide-2 col-xs-wide-3 text-right">使用时间</span>
									</li>
									<?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
									<li class="clearfix">										
										<span class="col-md-wide-10 col-sm-wide-10 hidden-xs text-muted"><?php echo $vo['card_id']; ?></span>
										<span class="col-md-wide-4 col-sm-wide-4 col-xs-wide-7"><?php echo $vo['card_no']; ?></span>
										<span class="col-md-wide-15 col-sm-wide-15 hidden-xs">-<?php echo $vo['card_money']; ?></span>
										<span class="col-md-wide-15 col-sm-wide-15 hidden-xs">+<?php echo $vo['card_points']; ?></span>
										<span class="col-md-wide-2 col-sm-wide-2 col-xs-wide-3 text-right"><?php echo date('Y-m-d',$vo['card_use_time']); ?></span>																			
									</li>
				  					<?php endforeach; endif; else: echo "" ;endif; ?>
								</ul>
							</form>
						</div>		
					</div>
				</div>
			</div>	
			<?php if($__PAGING__['page_total'] > 1): ?>
<div class="module-footer">
      <div id="page">
        <a href="<?php echo mac_url_page($__PAGING__['page_url'],1); ?>" class="page-number page-previous" title="首页">首页</a>
        <a href="<?php echo mac_url_page($__PAGING__['page_url'],$__PAGING__['page_prev']); ?>" class="page-number page-previous" title="上一页">上一页</a>
        <?php if(is_array($__PAGING__['page_num']) || $__PAGING__['page_num'] instanceof \think\Collection || $__PAGING__['page_num'] instanceof \think\Paginator): if( count($__PAGING__['page_num'])==0 ) : echo "" ;else: foreach($__PAGING__['page_num'] as $key=>$num): if($__PAGING__['page_current'] == $num): ?>
        <span class="page-number page-current display"><?php echo $num; ?></span>
        <?php else: ?>
          <a href="<?php echo mac_url_page($__PAGING__['page_url'],$num); ?>" class="page-number display" title="第<?php echo $num; ?>页"><?php echo $num; ?></a>
            <?php endif; endforeach; endif; else: echo "" ;endif; ?>
           <a href="<?php echo mac_url_page($__PAGING__['page_url'],$__PAGING__['page_next']); ?>" class="page-number page-next" title="下一页">下一页</a>
        <a href="<?php echo mac_url_page($__PAGING__['page_url'],$__PAGING__['page_total']); ?>" class="page-number page-next" title="尾页">尾页</a>
      </div>
    </div>
<?php endif; ?><!-- 翻页-->		
    	</div>
    </div>
</div>
<footer id="footer" class="wrapper <?php if($mxonest['mxcms']['s2']['dbdh'] == 1): ?>pd60<?php endif; ?>">
	<p class="sitemap"><img src="<?php echo $maccms['path']; ?>mxstatic/picture/logo.png" height="10">
		 <?php if($mxonest['mxcms']['s2']['about'] == 1): ?>
		<a target="_blank" href="<?php echo mac_url('label/about'); ?>">关于</a><span class="space-line-bold"></span>
		<?php endif; if($mxonest['mxcms']['s2']['dbtop'] == 1): ?>
		<a target="_blank" href="<?php echo mac_url('label/top'); ?>">排行榜</a><span class="space-line-bold"></span>
		<?php endif; ?>
		<a target="_blank" href="<?php echo mac_url('map/index'); ?>">MAP</a><span class="space-line-bold"></span>
		<a target="_blank" href="<?php echo mac_url('rss/index'); ?>">RSS</a><span class="space-line-bold"></span>
		<a target="_blank" href="<?php echo mac_url('rss/baidu'); ?>">Baidu</a><span class="space-line-bold"></span>
		<a target="_blank" href="<?php echo mac_url('rss/baidu'); ?>">Google</a><span class="space-line-bold"></span>
		<a target="_blank" href="<?php echo mac_url('rss/bing'); ?>">Bing</a><span class="space-line-bold"></span>
		<a target="_blank" href="<?php echo mac_url('rss/so'); ?>">so</a><span class="space-line-bold"></span>
		<a target="_blank" href="<?php echo mac_url('rss/sogou'); ?>">Sogou</a><span class="space-line-bold"></span>
		<a target="_blank" href="<?php echo mac_url('rss/sm'); ?>">SM</a>
	</p>
	<p><?php echo $mxonest['mxcms']['s1']['sm']; ?></p>
	<?php if($mxonest['mxcms']['s4']['dbdm'] == 1): ?>
    <?php echo $mxonest['mxcms']['s4']['dbdmtips']; endif; ?>
</footer>


<?php if($mxonest['mxcms']['s2']['yxjcd'] == 1): ?>
<div class="fixed_right_bar">
  <div class="mx-lrmenu">  
 <div class="ant-back-top dbicon" style="display:none;">
	 <i class="iconfont icon-a-zhiding5"></i>	
</div>   
  <?php if($mxonest['mxcms']['s2']['yjqh'] == 1): ?>
<div class="dbicon"  id="clothes" onclick="clothesChange();">
<?php if($mxonest['mxcms']['s2']['mryj'] == 1): ?>  
<i class="iconfont icon-rijianmoshi"></i>
<?php else: ?> 
<i class="iconfont icon-a-yejian2"></i>
<?php endif; ?>
</div>
<?php endif; if($mxonest['mxcms']['s2']['liuyan'] == 1): ?>
<div class="dbicon ly">
<a   href="<?php echo mac_url('gbook/index'); ?>" ><i class="iconfont icon-a-pinglun" ></i></a>
</div>
<?php endif; if($mxonest['mxcms']['s2']['topic'] == 1): ?>
<div class="dbicon">
<a  href="<?php echo mac_url('topic/index'); ?>" ><i class="iconfont icon-zhuanti-2" ></i></a>
</div>
<?php endif; ?>
</div>
<div class="moremeum">
	    <i class="iconfont icon-a-gengduo1"></i>
	</div>
</div>
<?php endif; if($mxonest['mxcms']['s2']['dbdh'] == 1): ?>
<div class="mxonefoot">
		<a class="item" href="<?php echo $maccms['path']; ?>">
    	<i class="icon-home size20"></i>
		<div class="grid-item-name" title="<?php echo $maccms['site_name']; ?>首页">首页</div>
		</a>
		 <?php $__TAG__ = '{"order":"asc","by":"sort","ids":"'.$mxonest['mxcms']['s6']['wapdaohangid'].'","id":"vo","key":"key"}';$__LIST__ = model("Type")->listCacheData($__TAG__); if(is_array($__LIST__['list']) || $__LIST__['list'] instanceof \think\Collection || $__LIST__['list'] instanceof \think\Paginator): $key = 0; $__LIST__ = $__LIST__['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key % 2 );++$key;?>	
		<a class="item" href="<?php echo mac_url_type($vo); ?>">
			<?php if($vo['type_id_1'] == $mxonest['mxcms']['s6']['num1']||$vo['type_id'] == $mxonest['mxcms']['s6']['num1']): ?>
              <i class="size20 <?php echo $mxonest['mxcms']['s6']['icon1']; ?>"></i>
               <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s6']['num2']||$vo['type_id'] == $mxonest['mxcms']['s6']['num2']): ?>
               <i class="size20 <?php echo $mxonest['mxcms']['s6']['icon2']; ?>"></i>
               <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s6']['num3']||$vo['type_id'] == $mxonest['mxcms']['s6']['num3']): ?>
                <i class="size20 <?php echo $mxonest['mxcms']['s6']['icon3']; ?>"></i>
                 <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s6']['num4']||$vo['type_id'] == $mxonest['mxcms']['s6']['num4']): ?>
                 <i class="size20 <?php echo $mxonest['mxcms']['s6']['icon4']; ?>"></i>
                 <?php elseif($vo['type_id_1'] == $mxonest['mxcms']['s6']['num5']||$vo['type_id'] == $mxonest['mxcms']['s6']['num5']): ?>
               <i class="size20 <?php echo $mxonest['mxcms']['s6']['icon5']; ?>"></i> 
                <?php else: ?>
                 <i class="size20  <?php echo $mxonest['mxcms']['s6']['iconmr']; ?>"></i>
               <?php endif; ?>
		<div class="grid-item-name"><?php echo $vo['type_name']; ?></div>
		</a>
		<?php endforeach; endif; else: echo "" ;endif; if($mxonest['mxcms']['s6']['diy1'] == 1): ?>
		<a class="item" href="<?php echo $mxonest['mxcms']['s6']['diy1url']; ?>" target="_blank">
        <i class="size20  <?php echo $mxonest['mxcms']['s6']['diy1icon']; ?>"></i>
		<div class="grid-item-name"><?php echo $mxonest['mxcms']['s6']['diy1name']; ?></div>
		</a>
		<?php endif; if($mxonest['mxcms']['s6']['diy2'] == 1): ?>
		<a class="item" href="<?php echo $mxonest['mxcms']['s6']['diy2url']; ?>" target="_blank">
        <i class="size20  <?php echo $mxonest['mxcms']['s6']['diy2icon']; ?>"></i>
		<div class="grid-item-name"><?php echo $mxonest['mxcms']['s6']['diy2name']; ?></div>
		</a>
		<?php endif; ?>
</div>
<?php endif; ?>

<script type="text/javascript">
<?php if($mxonest['mxcms']['s2']['mryj'] == 1): ?> 
 $("#clothes").on('click',function () {
        $(this).children(".iconfont").toggleClass("icon-a-yejian2");
        $(this).children(".iconfont").toggleClass("icon-rijianmoshi")
    });
  <?php else: ?>
    $("#clothes").on('click',function () {
        $(this).children(".iconfont").toggleClass("icon-rijianmoshi");
        $(this).children(".iconfont").toggleClass("icon-a-yejian2")
    });
 <?php endif; ?>
</script>

<?php if($mxonest['mxcms']['s2']['tc'] == 1): ?>
<div class="popup" id="note" style="display:none;">
	<div class="popup-icon"><img src="<?php echo $maccms['path']; ?>mxstatic/picture/backhome.svg"></div>
	<div class="popup-header">
		<h3 class="popup-title">公告内容</h3>
	</div>
	<div class="popup-main">
		<?php echo $mxonest['mxcms']['s2']['tc_noti']; ?>
	</div>
	<div class="popup-footer"><span class="popup-btn" onclick="closeclick()">我记住啦</span></div>
</div>
 <!-- 弹窗公告-->
<?php endif; if($mxonest['mxcms']['s2']['wz0'] == 1): ?>  
<div class="popup popup-notice none">
	<div class="popup-icon"><img src="<?php echo $maccms['path']; ?>mxstatic/picture/backhome.svg"></div>
	<div class="popup-header">
		<h3 class="popup-title">域名列表</h3></div>
	<div class="popup-main">
		<p>
			<a><strong><?php echo $maccms['site_url']; ?></strong></a><br>
			<!-- 2022-04-23 修复问题所注释
		   	<?php if($mxonest['mxcms']['s2']['wz01'] == 1): ?>
			<a><strong><?php echo $mxonest['mxcms']['s2']['web1']; ?></strong></a><br>
			<?php endif; if($mxonest['mxcms']['s2']['wz2'] == 1): ?>
			<a><strong><?php echo $mxonest['mxcms']['s2']['web2']; ?></strong></a><br>
			<?php endif; if($mxonest['mxcms']['s2']['wz3'] == 1): ?>
			<a><strong><?php echo $mxonest['mxcms']['s2']['web3']; ?></strong></a><br>
			<?php endif; if($mxonest['mxcms']['s2']['wz4'] == 1): ?>
			<a><strong><?php echo $mxonest['mxcms']['s2']['web4']; ?></strong></a><br>
			<?php endif; if($mxonest['mxcms']['s2']['wz5'] == 1): ?>
			<a><strong><?php echo $mxonest['mxcms']['s2']['web5']; ?></strong></a><br>
			<?php endif; ?>
			-->
		</p>
	</div>
	<div class="popup-footer">
		<a href="<?php echo mac_url('label/web'); ?>" class="popup-btn-o">查看全部域名</a>
	</div>
	<div class="close-popup" id="close-popup"><i class="icon-close-o"></i></div>
</div> <!-- 网址-->
<?php endif; ?>


<script type="text/javascript">   
	document.onkeydown=function(){
	    
		var e = window.event||arguments[0];
		
	     <?php if($mxonest['mxcms']['s4']['shier'] == 1): ?> 
			if(e.keyCode==123){
				alert('<?php echo $mxonest['mxcms']['s4']['pbtips']; ?>');
				return false;
			}
        <?php endif; if($mxonest['mxcms']['s4']['ctrl'] == 1): ?> 
		if((e.ctrlKey)&&(e.shiftKey)&&(e.keyCode==73)){
			alert('<?php echo $mxonest['mxcms']['s4']['pbtips']; ?>');
			return false;
		}
		if((e.ctrlKey)&&(e.keyCode==85)){
			alert('<?php echo $mxonest['mxcms']['s4']['pbtips']; ?>');
			return false;
		}
		if((e.ctrlKey)&&(e.keyCode==83)){
		   alert('<?php echo $mxonest['mxcms']['s4']['pbtips']; ?>');
		   return false;
		}
        <?php endif; ?>
	}
  <?php if($mxonest['mxcms']['s4']['right'] == 1): ?> 
	document.oncontextmenu=function(){
		alert('<?php echo $mxonest['mxcms']['s4']['pbtips']; ?>');
		return false;
	}
 <?php endif; if($mxonest['mxcms']['s4']['mode'] == 1): ?> 
	var threshold = 160;
	window.setInterval(function() {  
	    if (window.outerWidth - window.innerWidth > threshold ||   
	    window.outerHeight - window.innerHeight > threshold) {  
			function disableDebugger() {
				debugger;
			}
			$(document).ready(function () {
				disableDebugger();
			});
	    }  
	}, 1e3);
 <?php endif; ?>
</script>
<div class="shortcuts-mobile-overlay"></div>
<?php if($mxonest['mxcms']['s2']['yxjdiy'] == 1): ?>
<style>
.fixed_right_bar i{color:<?php echo $mxonest['mxcms']['s2']['iconztys']; ?>}.fixed_right_bar .moremeum{background:<?php echo $mxonest['mxcms']['s2']['cdbjys']; ?>}.fixed_right_bar .dbicon{background:<?php echo $mxonest['mxcms']['s2']['iconbjys']; ?>.fixed_right_bar .dbicon:hover {
	background: <?php echo $mxonest['mxcms']['s2']['iconbjglys']; ?>;}}.fixed_right_bar .dbicon:hover {	background: <?php echo $mxonest['mxcms']['s2']['iconbjglys']; ?>;}}background: <?php echo $mxonest['mxcms']['s2']['iconbjglys']; ?>;color:<?php echo $mxonest['mxcms']['s2']['iconztys']; ?>}}}
</style>
 <?php endif; if($mxonest['mxcms']['s2']['tc'] == 1): ?>
<script src="<?php echo $maccms['path']; ?>mxstatic/js/mxhtml.js"></script>
 <?php endif; ?>
<script src="<?php echo $maccms['path']; ?>mxstatic/js/mxui.js"></script>
<?php if($mxonest['mxcms']['s3']['addb'] == 1): ?>
<?php echo $mxonest['mxcms']['s3']['aaddb']; endif; ?>	 <!-- 底部广告位 -->
</body>
</html>