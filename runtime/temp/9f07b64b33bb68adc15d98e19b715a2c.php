<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:46:"template/mxone/html_tplmx/user/ajax_login.html";i:1629606718;}*/ ?>
<!--登录弹窗开始-->
<div class="mxone-modal fade" id="modal-login" data-toggle="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="mxone-modal__dialog">
        <div class="mxone-modal__content">
				<div class="mxone-pannel-box clearfix">
					<div class="mxone-pannel_hd">
						<div class="mxone-pannel__head active bottom-line clearfix">
							<a href="javascript:;" class="close pull-right" data-dismiss="modal" aria-hidden="true"><i class="icon-close-o"></i></a>
							<h3 class="user-title">
								登录账号
							</h3>
						</div>																		
					</div>
						<div class="mxone_login__form margin-0 clearfix" style="width: 100%;margin: 0;">
							<ul class="input-list">				
								 <form class="mac_login_form">	
									<li>
										<input type="text" class="form-control" name="user_name" placeholder="手机/用户名">
									</li>
									<li>
										<input class="form-control" type="password" class="mac_u_pwd" name="user_pwd" placeholder="登录密码">
									</li>
									<?php if($GLOBALS['config']['user']['login_verify'] == 1): ?>
									<li>
										<img class="pull-right" id="verify_img" src="<?php echo url('verify/index'); ?>" onClick="this.src=this.src+'?'"  alt="单击刷新" />
										<input type="text" class="form-control" id="verify" name="verify" placeholder="请输入验证码" style="width: 120px;">					
									</li>
									<?php endif; ?>					
									<li>
										<button type="button" id="login_form_submit" class="popup-btn login_form_submit btn4">立即登录</button>
									</li>
									<li class="text-center">
										<a href="<?php echo url('user/reg'); ?>">注册账号</a><span class="split-line"></span><a href="<?php echo url('user/findpass'); ?>">找回密码</a>
									</li>
								</form>
							</ul>
								<?php if($GLOBALS['config']['connect']['weixin']['status'] == 1): ?>
							<div class="another top-line">
								<p class="text-muted">第三方快捷登录</p>
								<?php if($GLOBALS['config']['connect']['qq']['status'] == 1): ?>
								<a href="<?php echo url('user/oauth'); ?>?type=qq"><img src="<?php echo $maccms['path']; ?>mxstatic/image/qq.png" width="24" alt="QQ登录"/></a>
								<?php endif; if($GLOBALS['config']['connect']['weixin']['status'] == 1): ?>
								<a href="<?php echo url('user/oauth'); ?>?type=weixin"><img src="<?php echo $maccms['path']; ?>mxstatic/image/weixin.png" width="24" alt="微信登录"/></a>
								<?php endif; ?>
							</div>
								<?php endif; ?>
							
						</div>
				</div>
        </div>
    </div>
</div>

<!--登录弹窗结束-->
