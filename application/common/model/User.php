<?php
namespace app\common\model;
use think\Db;
use think\Exception;
use think\Log;

class User extends Base
{
    // 设置数据表（不含前缀）
    protected $name = 'user';

    // 定义时间戳字段名
    protected $createTime = '';
    protected $updateTime = '';

    // 自动完成
    protected $auto = [];
    protected $insert = [];
    protected $update = [];

    public $_guest_group = 1;
    public $_def_group = 2;

    public function countData($where)
    {
        $total = $this->where($where)->count();
        return $total;
    }

    public function listData($where, $order, $page, $limit = 20,$field="*")
    {
        $total = $this->where($where)->count();
        $list = Db::name('User')->where($where)->order($order)->field($field)->page($page)->limit($limit)->select();
        return ['code' => 1, 'msg' => '数据列表', 'page' => $page, 'pagecount' => ceil($total / $limit), 'limit' => $limit, 'total' => $total, 'list' => $list];
    }

    public function infoData($where, $field = '*')
    {
        if (empty($where) || !is_array($where)) {
            return ['code' => 1001, 'msg' => '参数错误'];
        }
        $info = $this->field($field)->where($where)->find();
        if (empty($info)) {
            return ['code' => 1002, 'msg' => '获取数据失败'];
        }
        $info = $info->toArray();

        //用户组
        $group_list = model('Group')->getCache('group_list');
        $info['group'] = $group_list[$info['group_id']];


        $info['user_pwd'] = '';
        return ['code' => 1, 'msg' => '获取成功', 'info' => $info];
    }

    public function fieldData($where,$col,$val)
    {

        $data = [];
        if ($col && is_array($col)){

            foreach ($col as $key => $value){
                if (!is_null($value)){
                    $data[$key] = $value;
                }
            }

        }else{
            if(!isset($col) || !isset($val)){
                return ['code'=>1001,'msg'=>'参数错误'];
            }
            $data[$col] = $val;
        }

        $res = $this->allowField(true)->where($where)->update($data);

        if($res===false){
            return ['code'=>1001,'msg'=>'设置失败：'.$this->getError() ];
        }
        return ['code'=>1,'msg'=>'设置成功'];
    }

    public function saveData($data)
    {
        $validate = \think\Loader::validate('User');

        if (isset($data['user_start_time']) && !is_numeric($data['user_start_time'])) {
            $data['user_start_time'] = strtotime($data['user_start_time']);
        }
        if (isset($data['user_start_time']) && !is_numeric($data['user_end_time'])) {
            $data['user_end_time'] = strtotime($data['user_end_time']);
        }

        if (!empty($data['user_id'])) {
            if (!$validate->scene('edit')->check($data)) {
                return ['code' => 1001, 'msg' => '参数错误：' . $validate->getError()];
            }

            if (empty($data['user_pwd'])) {
                unset($data['user_pwd']);
            } else {
                $data['user_pwd'] = md5($data['user_pwd']);
            }
            $where = [];
            $where['user_id'] = ['eq', $data['user_id']];
            $res = $this->where($where)->update($data);
        } else {
            if (!$validate->scene('edit')->check($data)) {
                return ['code' => 1002, 'msg' => '参数错误：' . $validate->getError()];
            }

            $data['user_pwd'] = md5($data['user_pwd']);
            $res = $this->insert($data);
        }
        if (false === $res) {
            return ['code' => 1003, 'msg' => '' . $this->getError()];
        }
        return ['code' => 1, 'msg' => '保存成功'];
    }

    public function delData($where)
    {
        $res = $this->where($where)->delete();
        if ($res === false) {
            return ['code' => 1001, 'msg' => '删除失败' . $this->getError()];
        }
        return ['code' => 1, 'msg' => '删除成功'];
    }

    private function getRandomUsername(){
        static $times = 0;
        if ($times >= 1000){
            throw new \Exception('出错了！');
        }
        $times++;
        $prefix = $GLOBALS['config']['user']['reg_autoname_prefix'];
        // $name = uniqid($prefix);
        // $name = substr($name,0,strlen($prefix)+5);
        $name = $prefix.mac_get_rndstr($times+4);
        $user = $this->find(['user_nick_name'=> $name]);
        if ($user){
            return $this->getRandomUsername();
        }
        return $name;
    }

    public function register($param)
    {
  //      $config = config('maccms');

  //      $data = [];
  //      $userName = htmlspecialchars(urldecode(trim($param['user_name'])));

  //      $userNickName = htmlspecialchars(urldecode(trim($param['user_nick_name'])));
  //      $data['user_nick_name'] = $userNickName ? : $this->getRandomUsername();
  //      $data['user_name'] = $userName;

  //      $data['user_pwd'] = htmlspecialchars(urldecode(trim($param['user_pwd'])));
  //      $data['user_pwd2'] = htmlspecialchars(urldecode(trim($param['user_pwd2'])));
  //      $data['verify'] = $param['verify'];
  //      // $uid = $param['uid'];
  //      $uid = self::getUserIdByInviteCode($param['uid']);
		// Log::mylog('分享用户ID：', $uid, 'test');

  //      if ($config['user']['status'] == 0 || $config['user']['reg_open'] == 0) {
  //          return ['code' => 1001, 'msg' => '未开放注册'];
  //      }
  //      if (empty($data['user_name']) || empty($data['user_pwd'])) {
  //          return ['code' => 1002, 'msg' => '请填写必填项'];
  //      }
  //      if (empty($param['user_openid_qq']) && empty($param['user_openid_weixin'])
  //          && !captcha_check($data['verify']) &&  $config['user']['reg_verify']==1) {
  //          return ['code' => 1003, 'msg' => '验证码错误'];
  //      }
  //      if ($data['user_pwd'] != $data['user_pwd2']) {
  //          return ['code' => 1004, 'msg' => '密码与确认密码不一致'];
  //      }
  //      $row = $this->where('user_name', $data['user_name'])->find();
  //      if (!empty($row)) {
  //          return ['code' => 1005, 'msg' => '用户名已被注册，请更换'];
  //      }
  //      if (!preg_match("/^[a-zA-Z\d]*$/i", $data['user_name'])) {
  //          return ['code' => 1006, 'msg' => '用户名只能包含字母和数字，请更换'];
  //      }

  //      $validate = \think\Loader::validate('User');
  //      if (!$validate->scene('add')->check($data)) {
  //          return ['code' => 1007, 'msg' => '参数错误：' . $validate->getError()];
  //      }

  //      $filter = $GLOBALS['config']['user']['filter_words'];
  //      if(!empty($filter)) {
  //          $filter_arr = explode(',', $filter);
  //          $f_name = str_replace($filter_arr, '', $data['user_name']);
  //          if ($f_name != $data['user_name']) {
  //              return ['code' => 1008, 'msg' => '用户名禁止包含：' . $filter . '等字符，请重试'];
  //          }
  //      }

  //      $ip = sprintf('%u',ip2long(request()->ip()));
  //      if($ip>2147483647){
  //          $ip=0;
  //      }



  //      if( $GLOBALS['config']['user']['reg_num'] > 0){
  //          $where2=[];
  //          $where2['user_reg_ip'] =['eq',$ip];
  //          $cc = $this->where($where2)->count();
  //          if($cc >= $GLOBALS['config']['user']['reg_num']){
  //              return ['code' => 1009, 'msg' => '每IP每日限制注册' . $GLOBALS['config']['user']['reg_num'] . '次'];
  //          }
  //      }

  //      $fields = [];
  //      $fields['user_name'] = $data['user_name'];
  //      $fields['user_nick_name'] = $data['user_nick_name'];
  //      $fields['user_pwd'] = md5($data['user_pwd']);
  //      $fields['group_id'] = $this->_def_group;
  //      $fields['user_points'] = intval($config['user']['reg_points']);
  //      $fields['user_status'] = intval($config['user']['reg_status']);
  //      $fields['user_reg_time'] = time();
  //      $fields['user_reg_ip'] = $ip;
  //      $fields['user_openid_qq'] = (string)$param['user_openid_qq'];
  //      $fields['user_openid_weixin'] = (string)$param['user_openid_weixin'];

  //      if($config['user']['reg_phone_sms'] == '1'){
  //          $param['type'] = 3;
  //          $res = $this->check_msg($param);
  //          if($res['code'] >1){
  //              return ['code'=>$res['code'],'msg'=>$res['msg']];
  //          }
  //          $fields['user_phone'] = $param['to'];

  //          $update=[];
  //          $update['user_phone'] = '';
  //          $where2=[];
  //          $where2['user_phone'] = $param['to'];
  //          $this->where($where2)->update($update);
  //      }
  //      elseif($config['user']['reg_email_sms'] == '1'){
  //          $param['type'] = 3;
  //          $res = $this->check_msg($param);
  //          if($res['code'] >1){
  //              return ['code'=>$res['code'],'msg'=>$res['msg']];
  //          }
  //          $fields['user_email'] = $param['to'];

  //          $update=[];
  //          $update['user_email'] = '';
  //          $where2=[];
  //          $where2['user_email'] = $param['to'];
  //          $this->where($where2)->update($update);
  //      }

  //      $res = $this->insert($fields);
  //      if ($res === false) {
  //          return ['code' => 1010, 'msg' => '注册失败'];
  //      }
  //      $nid = $this->getLastInsID();
  //      $uid = intval($uid);
  //      if($uid > 0) {
  //          $where2 = [];
  //          $where2['user_id'] = $uid;
  //          $invite = $this->where($where2)->find();
  //          if ($invite) {
  //              $where=[];
  //              $where['user_id'] = $nid;
  //              $update=[];
  //              $update['user_pid'] = $invite['user_id'];
  //              $update['user_pid_2'] = $invite['user_pid'];
  //              $update['user_pid_3'] = $invite['user_pid_2'];
  //              $r1 = $this->where($where)->update($update);
  //              $r2 = false;
  //              $config['user']['invite_reg_num'] = intval($config['user']['invite_reg_num']);

  //              if($config['user']['invite_reg_points']>0){
  //                  $r2 = $this->where($where2)->setInc('user_points', $config['user']['invite_reg_points']);
  //              }

  //              if($r2!==false) {
  //                  //仙豆日志
  //                  $data = [];
  //                  $data['user_id'] = $uid;
  //                  $data['plog_type'] = 2;
  //                  $data['plog_points'] = $config['user']['invite_reg_points'];
  //                  model('Plog')->saveData($data);
  //              }
  //          }
  //      }
  //      return ['code' => 1, 'msg' => '注册成功,请登录去会员中心完善个人信息'];
		 $config = config('maccms');

        $data = [];
        $userName = htmlspecialchars(urldecode(trim($param['user_name'])));

        $userNickName = htmlspecialchars(urldecode(trim($param['user_nick_name'])));
        $data['user_nick_name'] = $userNickName ? : $this->getRandomUsername();
        $data['user_name'] = $userName;


        $data['user_pwd'] = htmlspecialchars(urldecode(trim($param['user_pwd'])));
        $data['user_pwd2'] = htmlspecialchars(urldecode(trim($param['user_pwd2'])));
        $data['verify'] = $param['verify'];
        // $uid = self::getUserIdByInviteCode($param['uid']);
        $uid = is_numeric($param['uid']) ? $param['uid'] : 0;
        // print_r($uid);exit;


        if ($config['user']['status'] == 0 || $config['user']['reg_open'] == 0) {
            return ['code' => 1001, 'msg' => '未开放注册'];
        }

        if (empty($param['user_openid_qq']) && empty($param['user_openid_weixin'])
            && !captcha_check($data['verify']) &&  $config['user']['reg_verify']==1) {
            return ['code' => 1003, 'msg' => '验证码错误'];
        }
        if (empty($data['user_pwd'])) {
            return ['code' => 1002, 'msg' => '请填写必填项'];
        }

        if($config['user']['reg_phone_sms'] == '0'){
            if (empty($data['user_name']) || empty($data['user_pwd'])) {
                return ['code' => 1002, 'msg' => '请填写必填项'];
            }

            if ($data['user_pwd'] != $data['user_pwd2']) {
                return ['code' => 1004, 'msg' => '密码与确认密码不一致'];
            }
            $row = $this->where('user_name', $data['user_name'])->find();
            if (!empty($row)) {
                return ['code' => 1005, 'msg' => '用户名已被注册，请更换'];
            }
            if (!preg_match("/^[a-zA-Z\d]*$/i", $data['user_name'])) {
                return ['code' => 1006, 'msg' => '用户名只能包含字母和数字，请更换'];
            }

            $validate = \think\Loader::validate('User');
            if (!$validate->scene('add')->check($data)) {
                return ['code' => 1007, 'msg' => '参数错误：' . $validate->getError()];
            }
            $filter = $GLOBALS['config']['user']['filter_words'];
            if(!empty($filter)) {
                $filter_arr = explode(',', $filter);
                $f_name = str_replace($filter_arr, '', $data['user_name']);
                if ($f_name != $data['user_name']) {
                    return ['code' => 1008, 'msg' => '用户名禁止包含：' . $filter . '等字符，请重试'];
                }
            }
        }



        $ip = sprintf('%u',ip2long(request()->ip()));
        if($ip>2147483647){
            $ip=0;
        }



        if( $GLOBALS['config']['user']['reg_num'] > 0){
            $where2=[];
            $where2['user_reg_ip'] =['eq',$ip];
            $cc = $this->where($where2)->count();
            if($cc >= $GLOBALS['config']['user']['reg_num']){
                return ['code' => 1009, 'msg' => '每IP每日限制注册' . $GLOBALS['config']['user']['reg_num'] . '次'];
            }
        }

        $fields = [];
        if($config['user']['reg_phone_sms'] == '0'){
            $fields['user_name'] = $data['user_name'];
        }else{
            $fields['user_name'] = $param['to'];
        }
        $fields['user_pwd'] = md5($data['user_pwd']);
        $fields['user_nick_name'] = $data['user_nick_name'];
        $fields['group_id'] = $this->_def_group;
        $fields['user_points'] = intval($config['user']['reg_points']);
        $fields['user_status'] = intval($config['user']['reg_status']);
        $fields['user_reg_time'] = time();
        $fields['user_reg_ip'] = $ip;
        $fields['user_openid_qq'] = (string)$param['user_openid_qq'];
        $fields['user_openid_weixin'] = (string)$param['user_openid_weixin'];

        if($config['user']['reg_phone_sms'] == '1'){
            $param['type'] = 3;
            $res = $this->check_msg($param);
            if($res['code'] >1){
                return ['code'=>$res['code'],'msg'=>$res['msg']];
            }
            $fields['user_phone'] = $param['to'];



            // $update=[];
            // $update['user_phone'] = '';
            $where2=[];
            $where2['user_phone'] = $param['to'];
            $count = $this->where($where2)
                ->whereOr(['user_name'=>$param['to']])
                ->field('user_id')->count();
            if($count>0){
                return ['code'=>1011,'msg'=>'手机号码已注册'];
            }
        }
        elseif($config['user']['reg_email_sms'] == '1'){
            $param['type'] = 3;
            $res = $this->check_msg($param);
            if($res['code'] >1){
                return ['code'=>$res['code'],'msg'=>$res['msg']];
            }
            $fields['user_email'] = $param['to'];

            $update=[];
            $update['user_email'] = '';
            $where2=[];
            $where2['user_email'] = $param['to'];
            $this->where($where2)->update($update);
        }

        // $res = $this->insert($fields);
        // if ($res === false) {
        //     return ['code' => 1010, 'msg' => '注册失败'];
        // }
        // $nid = $this->getLastInsID();
        $nid = $this->insertGetId($fields);
        if (empty($nid)) {
            return ['code' => 1010, 'msg' => '注册失败'];
        }
        $uid = intval($uid);
        if($uid > 0) {
            $where2 = [];
            $where2['user_id'] = $uid;
            $invite = $this->where($where2)->find();
            if ($invite) {
                $where=[];
                $where['user_id'] = $nid;
                $update=[];
                $update['user_pid'] = $invite['user_id'];
                $update['user_pid_2'] = $invite['user_pid'];
                $update['user_pid_3'] = $invite['user_pid_2'];
                $r1 = $this->where($where)->update($update);
                $r2 = false;
                $config['user']['invite_reg_num'] = intval($config['user']['invite_reg_num']);

                if($config['user']['invite_reg_points']>0){
                    $r2 = $this->where($where2)->setInc('user_points', $config['user']['invite_reg_points']);
                }

                if($r2!==false) {
                    //仙豆日志
                    $data = [];
                    $data['user_id'] = $uid;
                    $data['plog_type'] = 2;
                    $data['plog_points'] = $config['user']['invite_reg_points'];
                    model('Plog')->saveData($data);
                }
            }
        }
        return ['code' => 1, 'msg' => '注册成功,请登录去会员中心完善个人信息'];
    }

    public function regcheck($t, $str)
    {
        $where = [];
        if ($t == 'user_name') {
            $where['user_name'] = $str;
            $row = $this->where($where)->find();
            if (!empty($row)) {
                return ['code' => 1001, 'msg' => '已注册'];
            }
        } elseif ($t == 'user_email') {
            $where['user_email'] = $str;
            $row = $this->where($where)->find();
            if (!empty($row)) {
                return ['code' => 1001, 'msg' => '已注册'];
            }
        } elseif ($t == 'verify') {
            if (!captcha_check($str)) {
                return ['code' => 1002, 'msg' => '验证码错误'];
            }
        }
        return ['code' => 1, 'msg' => '填写正确'];
    }

    public function info($param)
    {
        if (empty($param['user_pwd'])) {
            return ['code' => 1001, 'msg' => '请输入原密码'];
        }
        if (md5($param['user_pwd']) != $GLOBALS['user']['user_pwd']) {
            return ['code' => 1002, 'msg' => '原密码错误'];
        }
        if ($param['user_pwd1'] != $param['user_pwd2']) {
            return ['code' => 1003, 'msg' => '两次输入的新密码不一致'];
        }

        $data = [];
        $data['user_id'] = $GLOBALS['user']['user_id'];
        $data['user_name'] = $GLOBALS['user']['user_name'];
        $data['user_qq'] = htmlspecialchars(urldecode(trim($param['user_qq'])));
        $data['user_question'] = htmlspecialchars(urldecode(trim($param['user_question'])));
        $data['user_answer'] = htmlspecialchars(urldecode(trim($param['user_answer'])));
        if (!empty($param['user_pwd2'])) {
            $data['user_pwd'] = htmlspecialchars(urldecode(trim($param['user_pwd2'])));
        }
        return $this->saveData($data);
    }

    public function login($param, $return = false)
    {
        $data = [];
        $data['user_name'] = htmlspecialchars(urldecode(trim($param['user_name'])));
        $data['user_pwd'] = htmlspecialchars(urldecode(trim($param['user_pwd'])));
        $data['verify'] = $param['verify'];
        $data['openid'] = htmlspecialchars(urldecode(trim($param['openid'])));
        $data['col'] = htmlspecialchars(urldecode(trim($param['col'])));

        if (empty($data['openid'])) {
            if (empty($data['user_name']) || empty($data['user_pwd'])) {
                return ['code' => 1001, 'msg' => '请填写必填项'];
            }

            if ($GLOBALS['config']['user']['login_verify'] ==1 && !captcha_check($data['verify'])) {
                return ['code' => 1002, 'msg' => '验证码错误'];
            }

            $pwd = md5($data['user_pwd']);
            $where = [];

            $pattern = '/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/';
            if (!preg_match($pattern, $data['user_name'])) {
                $where['user_name'] = ['eq', $data['user_name']];
            } else {
                $where['user_email'] = ['eq', $data['user_name']];
            }

            $where['user_pwd'] = ['eq', $pwd];
            $where['user_status'] = ['eq', 1];
            $row = $this->where($where)->find();
        } else {
            if (empty($data['openid']) || empty($data['col'])) {
                return ['code' => 1001, 'msg' => '请填写必填项'];
            }
            
              $where[$data['col']] = $data['openid'];
            $where['user_status'] = ['eq', 1];
            $row =  $this->where($where)->find();
            if (empty($row)){
                $config = config('maccms');
                $ip = sprintf('%u',ip2long(request()->ip()));
                if($ip>2147483647) $ip=0;
                if( $config['user']['reg_num'] > 0){
                    $where2=[];
                    $where2['user_reg_ip'] =['eq',$ip];
                    $cc = model('user')->where($where2)->count();
                    if($cc >= $config['user']['reg_num'])
                        return ['code' => 1001, 'msg' => '每IP每日限制注册' . $config['user']['reg_num'] . '次'];
                }

                $fields = [];
                $fields['user_nick_name'] = $this->getRandomUsername();
                $fields['user_name'] = mt_rand(100000000000,999999999999);
                $fields['user_pwd'] = md5($fields['user_name']);
                $fields['group_id'] = 2;
                $fields['user_points'] = intval($config['user']['reg_points']);
                $fields['user_status'] = intval($config['user']['reg_status']);
                $fields['user_reg_time'] = time();
                $fields['user_reg_ip'] = $ip;
                $fields[$data['col']] = $data['openid'];

                $nid =  $this->insertGetId($fields);
                if (empty($nid))
                    return ['code' => 1001, 'msg' => '注册失败'];
                $row =  $this->where('user_id',$nid)->find();

            }

        }
    
        if(empty($row)) {
            return ['code' => 1003, 'msg' => '账号或密码错误，请重新输入'];
        }

        if($row['group_id'] > 2 &&  $row['user_end_time'] < time()) {
            $row['group_id'] = 2;
            $update['group_id'] = 2;
        }

        $random = md5(rand(10000000, 99999999));
        $ip = sprintf('%u',ip2long(request()->ip()));
        if($ip>2147483647){
            $ip=0;
        }
        $update['user_random'] = $random;
        $update['user_login_ip'] = $ip;
        $update['user_login_time'] = time();
        $update['user_login_num'] = $row['user_login_num'] + 1;
        $update['user_last_login_time'] = $row['user_login_time'];
        $update['user_last_login_ip'] = $row['user_login_ip'];

        $res = $this->where($where)->update($update);
        if ($res === false) {
            return ['code' => 1004, 'msg' => '更新登录信息失败'];
        }

        //用户组
        $group_list = model('Group')->getCache('group_list');
        $group = $group_list[$row['group_id']];

        if ($return){

        }else{
            cookie('user_id', $row['user_id'],['expire'=>2592000] );
            cookie('user_name', $row['user_name'],['expire'=>2592000] );
            cookie('user_nick_name', $row['user_nick_name'],['expire'=>2592000] );
            cookie('group_id', $group['group_id'],['expire'=>2592000] );
            cookie('group_name', $group['group_name'],['expire'=>2592000] );
            cookie('user_check', md5($random . '-' . $row['user_id'] ),['expire'=>2592000] );
            cookie('user_portrait', mac_get_user_portrait($row['user_id']),['expire'=>2592000] );
        }


        return ['code' => 1, 'msg' => '登录成功'];
    }

    public function logout()
    {
        cookie('user_id', null);
        cookie('user_name', null);
        cookie('group_id', null);
        cookie('group_name', null);
        cookie('user_check', null);
        cookie('user_portrait', null);
        return ['code' => 1, 'msg' => '退出成功'];
    }

    public function checkLogin()
    {
        $user_id = cookie('user_id');
        $user_name = cookie('user_name');
        $user_check = cookie('user_check');

        $user_id = htmlspecialchars(urldecode(trim($user_id)));
        $user_name = htmlspecialchars(urldecode(trim($user_name)));
        $user_check = htmlspecialchars(urldecode(trim($user_check)));

        if (empty($user_id) || empty($user_name) || empty($user_check)) {
            return ['code' => 1001, 'msg' => '未登录'];
        }

        $where = [];
        $where['user_id'] = $user_id;
        $where['user_name'] = $user_name;
        $where['user_status'] = 1;

        $info = $this->field('*')->where($where)->find();
        if(empty($info)) {
            return ['code' => 1002, 'msg' => '未登录'];
        }
        $info = $info->toArray();
        $login_check = md5($info['user_random'] . '-' . $info['user_id'] );
        if($login_check != $user_check) {
            return ['code' => 1003, 'msg' => '未登录'];
        }

        $group_list = model('Group')->getCache('group_list');
        $info['group'] = $group_list[$info['group_id']];

        //会员截止日期
        // if ($info['group_id'] > 2 && $info['user_end_time'] < time()) {
        //     //用户组
        //     $info['group'] = $group_list[2];

        //     $update = [];
        //     $update['group_id'] = 2;

        //     $res = $this->where($where)->update($update);
        //     if($res === false){
        //         return ['code' => 1004, 'msg' => '更新会员截止日期失败'];
        //     }

        //     cookie('group_id', $info['group']['group_id'], ['expire'=>2592000] );
        //     cookie('group_name', $info['group']['group_name'],['expire'=>2592000] );
        // }


        return ['code' => 1, 'msg' => '已登录', 'info' => $info];
    }

    public function resetPwd()
    {

    }

    public function findpass($param)
    {
        $data = [];
        $data['user_name'] = htmlspecialchars(urldecode(trim($param['user_name'])));
        $data['user_question'] = htmlspecialchars(urldecode(trim($param['user_question'])));
        $data['user_answer'] = htmlspecialchars(urldecode(trim($param['user_answer'])));
        $data['user_pwd'] = htmlspecialchars(urldecode(trim($param['user_pwd'])));
        $data['user_pwd2'] = htmlspecialchars(urldecode(trim($param['user_pwd2'])));
        $data['verify'] = $param['verify'];

        // if (empty($data['user_name']) || empty($data['user_question']) || empty($data['user_answer']) || empty($data['user_pwd']) || empty($data['user_pwd2']) || empty($data['verify'])) {
        //     return ['code' => 1001, 'msg' => '参数错误'];
        // }
        if (empty($data['user_name']) || empty($data['user_pwd']) || empty($data['user_pwd2']) || empty($data['verify'])) {
            return ['code' => 1001, 'msg' => '参数错误'];
        }
        if (!captcha_check($data['verify'])) {
            return ['code' => 1002, 'msg' => '验证码错误'];
        }

        if ($data['user_pwd'] != $data['user_pwd2']) {
            return ['code' => 1003, 'msg' => '二次密码不一致'];
        }


        $where = [];
        $where['user_name'] = $data['user_name'];
        $where['user_question'] = $data['user_question'];
        $where['user_answer'] = $data['user_answer'];

        $info = $this->where($where)->find();
        if (empty($info)) {
            return ['code' => 1004, 'msg' => '获取用户失败，账号、问题、答案可能不正确'];
        }

        $update = [];
        $update['user_pwd'] = md5($data['user_pwd']);

        $where = [];
        $where['user_id'] = $info['user_id'];
        $res = $this->where($where)->update($update);

        if (false === $res) {
            return ['code' => 1005, 'msg' => '' . $this->getError()];
        }
        return ['code' => 1, 'msg' => '密码找回成功成功'];

    }

    public function popedom($type_id, $popedom, $group_id = 1)
    {
        $group_list = model('Group')->getCache();
        $group_info = $group_list[$group_id];

        if (strpos(',' . $group_info['group_type'], ',' . $type_id . ',') !== false && !empty($group_info['group_popedom'][$type_id][$popedom]) !== false) {
            return true;
        }
        return false;
    }

    public function upgrade($param)
    {
        $group_id = intval($param['group_id']);
        // $group_id = 3;
        $long = $param['long'];
        $points_long = ['day'=>86400,'week'=>86400*7,'month'=>86400*30,'year'=>86400*365,'permanent'=>-1];

        if (!array_key_exists($long, $points_long)) {
            return ['code'=>1001,'msg'=>'非法操作'];
        }

        if($group_id < 3){
            return ['code'=>1002,'msg'=>'请选择自定义收费会员组'];
        }

        $group_list = model('Group')->getCache();
        $group_info = $group_list[$group_id];
        if(empty($group_info)){
            return ['code'=>1003,'msg'=>'获取会员组信息失败'];
        }

        // 是否是代理商
        if (empty($param['is_agents'])){
            $data['is_agents'] = 0;
        }else{
            $data['is_agents'] = 1;
        }

        if($group_info['group_status'] == 0){
            return ['code'=>1004,'msg'=>'会员组已经关闭，无法升级'];
        }

        $point = $group_info['group_points_'.$long];
        if($GLOBALS['user']['user_points'] < $point){
            return ['code'=>1005,'msg'=>'仙豆不够，无法升级'];
        }
        
        if($GLOBALS['user']['group_id'] >= $group_id){
            return ['code'=>1005,'msg'=>'您已经是此等级或更高等级'];
        }

        $sj = $points_long[$long];
        $end_time = $sj < 0 ? $sj : time() + $sj;
        if($GLOBALS['user']['user_end_time'] > time() ){
            $end_time = $GLOBALS['user']['user_end_time'] + $sj;
        }

        $where = [];
        $where['user_id'] = $GLOBALS['user']['user_id'];

        $data = [];
        $data['user_points'] = $GLOBALS['user']['user_points'] - $point;
        $data['user_end_time'] = $end_time;
        $data['group_id'] = $group_id;

        $db = Db::connect();
        try {
            $db->startTrans();
            $res = $this->where($where)->update($data);
            if($res===false){
                return ['code'=>1009,'msg'=>'升级会员组失败'];
            }
    
            //仙豆日志
            $data = [];
            $data['user_id'] = $GLOBALS['user']['user_id'];
            $data['plog_type'] = 7;
            $data['plog_points'] = $point;
            model('Plog')->saveData($data);
            //原 - 分销日志
           //$this->reward($point);
    
           //新分销
           $this->new_reward($GLOBALS['user']['user_id'], $point);
    
           cookie('group_id', $group_info['group_id'],['expire'=>2592000] );       
           cookie('group_name', $group_info['group_name'],['expire'=>2592000] );
           $db->commit();
        } catch (\Exception $e) {
           $db->rollback();
           return ['code'=>1,'msg'=>'升级会员组失败:'.$e->getMessage()];
        }

        return ['code'=>1,'msg'=>'升级会员组成功'];
    }

    public function new_reward($user_id, $val) {
        $cur_user = model('User')
                    ->where('user_id', $GLOBALS['user']['user_id'])
                    ->field('user_id,user_name,group_id,user_pid,user_pid_2,user_pid_3')
                    ->find();
            
        $user_pid = $cur_user['user_pid'];
        $user_1 = model('User')->where('user_id',$user_pid)->find();
        if(!empty($user_1)){
            $curr_user_commission = model('Group')->where('group_id', $user_1['group_id'])->field('group_commission,group_commission_all')->find();
            
            $group_commission_all = 0;
            if($curr_user_commission['group_commission'] > 0) $group_commission_all += $curr_user_commission['group_commission'] / 100;
            // if($curr_user_commission['group_commission_all'] > 0) $group_commission_all += $curr_user_commission['group_commission_all'] / 100;
            $sum_points = intval($val * $group_commission_all);

            $data = [];
            $data['user_id'] =$cur_user['user_pid'];
            $data['plog_type'] = 4;
            $data['plog_points'] = $sum_points;
            $data['plog_remarks'] = '用户【'.$cur_user['user_id'].'、'.$cur_user['user_name'].'】使用'.$val.'仙豆，获得奖励'.$sum_points.'仙豆';
            model('Plog')->saveData($data);
            
            model('User')->where('user_id',$user_pid)->setInc('user_points',$sum_points);
        }

        $user_pid_2 = $cur_user['user_pid_2'];
        $user_2 = model('User')->where('user_id',$user_pid_2)->find();
        if(!empty($user_2)){
            $curr_user_commission_2 = model('Group')->where('group_id', $user_2['group_id'])->field('group_commission,group_commission_all')->find();
            
            $group_commission_2_all = 0;
            // if($curr_user_commission_2['group_commission'] > 0) $group_commission_2_all += $curr_user_commission_2['group_commission'] / 100;
            if($curr_user_commission_2['group_commission_all'] > 0) $group_commission_2_all += $curr_user_commission_2['group_commission_all'] / 100;
            $sum_points_2 = intval($val * $group_commission_2_all);

            $data = [];
            $data['user_id'] =$cur_user['user_pid_2'];
            $data['plog_type'] = 4;
            $data['plog_points'] = $sum_points_2;
            $data['plog_remarks'] = '用户【'.$cur_user['user_id'].'、'.$cur_user['user_name'].'】使用'.$val.'仙豆，获得奖励'.$sum_points_2.'仙豆';
            model('Plog')->saveData($data);
            
            model('User')->where('user_id',$user_pid_2)->setInc('user_points',$sum_points_2);
        }
        
        $user_pid_3 = $cur_user['user_pid_3'];
        $user_3 = model('User')->where('user_id',$user_pid_3)->find();
        if(!empty($user_3)){
            $curr_user_commission_3 = model('Group')->where('group_id', $user_3['group_id'])->field('group_commission,group_commission_all')->find();
            
            $group_commission_3_all = 0;
            // if($curr_user_commission_3['group_commission'] > 0) $group_commission_3_all += $curr_user_commission_3['group_commission'] / 100;
            if($curr_user_commission_3['group_commission_all'] > 0) $group_commission_3_all += $curr_user_commission_3['group_commission_all'] / 100;
            $sum_points_3 = intval($val * $group_commission_3_all);

            $data = [];
            $data['user_id'] =$cur_user['user_pid_3'];
            $data['plog_type'] = 4;
            $data['plog_points'] = $sum_points_3;
            $data['plog_remarks'] = '用户【'.$cur_user['user_id'].'、'.$cur_user['user_name'].'】使用'.$val.'仙豆，获得奖励'.$sum_points_3.'仙豆';
            model('Plog')->saveData($data);
            
            model('User')->where('user_id',$user_pid_3)->setInc('user_points',$sum_points_3);
        }
    }    

    public function check_msg($param)
    {
        $param['to'] = htmlspecialchars(urldecode(trim($param['to'])));
        $param['code'] = htmlspecialchars(urldecode(trim($param['code'])));
        if(!in_array($param['ac'],['email','phone']) || empty($param['to']) || empty($param['code']) || empty($param['type'])){
            return ['code'=>9001,'msg'=>'参数错误'];
        }
        //msg_type  1绑定2找回3注册
        $stime = strtotime('-15 min');
        $where=[];
        // $where['user_id'] = $GLOBALS['user']['user_id'];
        $where['msg_to'] = $param['to'];
        $where['msg_time'] = ['gt',$stime];
        $where['msg_code'] = ['eq',$param['code']];
        $where['msg_type'] = ['eq', $param['type'] ];
        
        $res = model('msg')->infoData($where);
        if($res['code'] >1){
            return ['code'=>9002,'msg'=>'验证信息错误，请重试'];
        }
        return  ['code'=>1,'msg'=>'ok'];
    }

    public function send_msg($param)
    {
        $param['to'] = htmlspecialchars(urldecode(trim($param['to'])));
        $param['code'] = htmlspecialchars(urldecode(trim($param['code'])));


        if(!in_array($param['ac'],['email','phone']) || !in_array($param['type'],['1','2','3']) || empty($param['to'])  || empty($param['type'])){
            return ['code'=>9001,'msg'=>'参数错误'];
        }

        $type_arr = [
            1=>['des'=>'绑定','flag'=>'bind'],
            2=>['des'=>'找回密码','flag'=>'findpass'],
            3=>['des'=>'注册','flag'=>'reg'],
            ];

        $type_des = $type_arr[$param['type']]['des'];
        $type_flag = $type_arr[$param['type']]['flag'];


        $to = $param['to'];
        $code = mac_get_rndstr(6,'num');

        $sign = '【'.$GLOBALS['config']['site']['site_name'].'】';
        $r=0;

        $stime = strtotime('-1 min');
        $where=[];
        // $where['user_id'] = $GLOBALS['user']['user_id'];
        $where['msg_to'] = $param['to'];
        $where['msg_time'] = ['gt',$stime];
        $where['msg_type'] = ['eq', $param['type'] ];
        $res = model('msg')->infoData($where);
        if($res['code'] ==1){
            return ['code'=>9002,'msg'=>'请不要频繁发送'];
        }
        $res_msg= ',请重试';
        if($param['ac']=='email'){
            $pattern = '/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/';
            if(!preg_match( $pattern, $to)){
                return ['code'=>9003,'msg'=>'邮箱地址格式不正确'];
            }

            $title = '绑定'.$type_des.'验证';
            $msg = $sign.'的会员您好，'.$GLOBALS['user']['user_name'].'。'.$type_des.'验证码为：'. $code .',请在5分钟内完成验证。' ;
            $msg = str_replace(['[用户]','[类型]','[时长]','[验证码]'],[$GLOBALS['user']['user_name'],$type_des,'5',$code],$msg);

            $res_send = mac_send_mail($to, $sign.$title, $sign.$msg);
            if($res_send){
                $r=1;
            }
        }
        else{
            $pattern = "/^1{1}\d{10}$/";
            if(!preg_match($pattern,$to)){
                return ['code'=>9004,'msg'=>'手机号格式不正确'];
            }
            if(empty($GLOBALS['config']['sms']['type'])){
                return ['code'=>9005,'msg'=>'未配置短信发送服务'];
            }

            $msg = $GLOBALS['config']['sms']['content'];
            $msg = str_replace(['[用户]','[类型]','[时长]','[验证码]'],[$GLOBALS['user']['user_name'],$type_des,'5',$code],$msg);


            $cp = 'app\\common\\extend\\sms\\' . ucfirst($GLOBALS['config']['sms']['type']);
            if (class_exists($cp)) {
                $c = new $cp;
                $res_send = $c->submit($to,$code,$type_flag,$type_des,$msg);
            }
            //$res_send = Model('Sms'.$GLOBALS['config']['sms']['type'])->submit($to,$code,$type_flag,$type_des,$msg);
            if($res_send['code']==1){
                $r=1;
            }
            else{
                $res_msg = ','.$res_send['msg'];
            }
        }

        if($r==1){
            $data=[];
            $data['user_id'] = $GLOBALS['user']['user_id'];
            $data['msg_type'] = $param['type'];
            $data['msg_status'] = 0;
            $data['msg_to'] = $to;
            $data['msg_code'] = $code;
            $data['msg_content'] = $msg;
            $data['msg_time'] = time();
            $res = model('msg')->saveData($data);

            return ['code'=>1,'msg'=>'验证码发送成功，请前往查看'];
        }
        else{
            return ['code'=>9009,'msg'=>'验证码发送失败'.$res_msg];
        }
    }

    public function bind($param)
    {
        $param['type'] = 1;
        $res = $this->check_msg($param);
        if($res['code'] >1){
            return ['code'=>$res['code'],'msg'=>$res['msg']];
        }

        $update=[];
        $update2=[];
        $where2=[];
        if($param['ac']=='email') {
            $update['user_email'] = $param['to'];
            $update2['user_email'] = '';
            $where2['user_email'] = $param['to'];
        }
        else{
            $update['user_phone'] = $param['to'];
            $update2['user_phone'] = '';
            $where2['user_phone'] = $param['to'];
        }
        $this->where($where2)->update($update2);

        $where=[];
        $where['user_id'] = $GLOBALS['user']['user_id'];
        $res = $this->where($where)->update($update);
        if($res===false){
            return ['code'=>2003,'msg'=>'更新用户信息失败，请重试'];
        }
        return ['code'=>1,'msg'=>'绑定成功'];
    }

    public function unbind($param)
    {
        if(!in_array($param['ac'],['email','phone']) ){
            return ['code'=>2001,'msg'=>'参数错误'];
        }
        $col = 'user_email';
        if($param['ac']=='phone'){
            $col = 'user_phone';
        }
        $update=[];
        $update[$col] = '';
        $where=[];
        $where['user_id'] = $GLOBALS['user']['user_id'];
        $res = $this->where($where)->update($update);
        if($res===false){
            return ['code'=>2002,'msg'=>'更新用户信息失败，请重试'];
        }
        return ['code'=>1,'msg'=>'解绑成功'];
    }

    public function bindmsg($param)
    {
        $param['type'] = 1;
        return $this->send_msg($param);
    }

    public function findpass_msg($param)
    {
        $param['type'] = 2;
        return $this->send_msg($param);
    }

    public function reg_msg($param)
    {
        $param['type'] = 3;
        return $this->send_msg($param);
    }


    public function findpass_reset($param)
    {
        $to = htmlspecialchars(urldecode(trim($param['user_email'])));
        if(empty($to)){
            $to = htmlspecialchars(urldecode(trim($param['to'])));
        }

        $param['code'] = htmlspecialchars(urldecode(trim($param['code'])));
        $param['user_pwd'] = htmlspecialchars(urldecode(trim($param['user_pwd'])));
        $param['user_pwd2'] = htmlspecialchars(urldecode(trim($param['user_pwd2'])));

        if (strlen($param['user_pwd']) <6) {
            return ['code' => 2002, 'msg' => '密码最少6个字符'];
        }
        if ($param['user_pwd'] != $param['user_pwd2']) {
            return ['code' => 2003, 'msg' => '密码与确认密码不一致'];
        }

        $param['type'] = 2;
        $res = $this->check_msg($param);
        if($res['code'] >1){
            return ['code'=>$res['code'],'msg'=>$res['msg']];
        }

        if($param['ac']=='email') {

            $pattern = '/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/';
            if(!preg_match( $pattern, $to)){
                return ['code'=>2005,'msg'=>'邮箱地址格式不正确'];
            }

            $where = [];
            $where['user_email'] = $to;
            $user = $this->where($where)->find();
            if (!$user) {
                return ['code' => 2006, 'msg' => '邮箱地址错误'];
            }
        }
        else{
            $pattern = "/^1{1}\d{10}$/";
            if(!preg_match($pattern,$to)){
                return ['code'=>2007,'msg'=>'手机号格式不正确'];
            }

            $where = [];
            $where['user_name'] = $to;
            //echo $to;
            $user = $this->where($where)->find();
            if (!$user) {
                return ['code' => 2008, 'msg' => '手机号码错误'];
            }
        }

        $update=[];
        $update['user_pwd'] = md5($param['user_pwd']);

        $res = $this->where($where)->update($update);
        if($res===false){
            return ['code'=>2009,'msg'=>'修改免失败，请重试'];
        }
        return ['code'=>1,'msg'=>'密码重置成功'];
    }

    public function visit($param)
    {
        $param['uid'] = abs(intval($param['uid']));
        if ($param['uid'] == 0) {
            return ['code' => 101, 'msg' => '用户编号错误'];
        }

        $ip = sprintf('%u', ip2long(request()->ip()));
        if ($ip > 2147483647) {
            $ip = 0;
        }

        $max_cc = $GLOBALS['config']['user']['invite_visit_num'];
        if(empty($max_cc)){
            $max_cc=1;
        }
        $todayunix = strtotime("today");
        $where = [];
        $where['user_id'] = $param['uid'];
        $where['visit_ip'] = $ip;
        $where['visit_time'] = ['gt', $todayunix];
        $cc = model('visit')->where($where)->count();
        if ($cc> $max_cc){
            return ['code' => 102, 'msg' => '每日仅能获取'.$max_cc.'次推广访问仙豆'];
        }

        $data = [];
        $data['user_id'] = $param['uid'];
        $data['visit_ip'] = $ip;
        $data['visit_time'] = time();
        $data['visit_ly'] = htmlspecialchars(urldecode(trim(mac_get_refer())));
        $res = model('visit')->saveData($data);

        if ($res['code'] > 1) {
            return ['code' => 103, 'msg' => '插入推广记录失败，请重试'];
        }

        $res = $this->where('user_id', $param['uid'])->setInc('user_points', intval($GLOBALS['config']['user']['invite_visit_points']));
        if($res) {
            //仙豆日志
            $data = [];
            $data['user_id'] = $param['uid'];
            $data['plog_type'] = 3;
            $data['plog_points'] = intval($GLOBALS['config']['user']['invite_visit_points']);
            model('Plog')->saveData($data);
        }

        return ['code'=>1,'msg'=>'推广成功'];
    }

    public function reward($where, $fee_points=0)
    {

        $user = model('User')->where($where)->find();
        if (!$user){
            return ['code'=>1,'msg'=>'分销提成成功'];
        }

        //三级分销
        if($fee_points>0 && $GLOBALS['config']['user']['reward_status'] == '1'){


            if(!empty($GLOBALS['config']['user']['reward_ratio']) && !empty($user['user_pid'])){            // 如果奖励开启 并且用户存在上级
                $points = floor($fee_points / 100 * $GLOBALS['config']['user']['reward_ratio']); // 奖励仙豆数

                if($points>0){
                    $where=[];
                    $where['user_id'] = $user['user_pid'];
                    $r1 = model('User')->where($where)->find($where);

                    if ($r1){
                        // 查看是否是代理商 返金币
                        if (self::isAgents($r1)){
                            $r = model('User')->where($where)->setInc('user_gold',$points);
                            if($r){
                                $data = [];
                                $data['user_id'] = $user['user_pid'];
                                $data['glog_type'] = 3;
                                $data['glog_gold'] = $points;
                                $data['glog_remarks'] = '用户【'.$user['user_id'].'、'.$user['user_name'].'】充值'.$fee_points.'仙豆，获得奖励'.$points.'金币';
                                model('Glog')->saveData($data);
                            }
                        }else{ // 返仙豆
                            $r = model('User')->where($where)->setInc('user_points',$points);
                            if($r){
                                $data = [];
                                $data['user_id'] =$user['user_pid'];
                                $data['plog_type'] = 4;
                                $data['plog_points'] = $points;
                                $data['plog_remarks'] = '用户【'.$user['user_id'].'、'.$user['user_name'].'】充值'.$fee_points.'仙豆，获得奖励'.$points.'仙豆';
                                model('Plog')->saveData($data);
                            }
                        }
                    }

                }
            }

            // 如果存在二级代理商
            if(!empty($GLOBALS['config']['user']['reward_ratio_2']) && !empty($user['user_pid_2'])){
                $points = floor($fee_points / 100 * $GLOBALS['config']['user']['reward_ratio_2']);
                if($points>0){
                    $where=[];
                    $where['user_id'] = $user['user_pid_2'];

                    $r2 = model('User')->where($where)->find($where);
                    if (self::isAgents($r)){  // 是代理商赠送金币
                        $r = model('User')->where($where)->setInc('user_gold',$points);
                        if($r){
                            $data = [];
                            $data['user_id'] = $user['user_pid_2'];
                            $data['glog_type'] = 3;
                            $data['glog_gold'] = $points;
                            $data['glog_remarks'] = '用户【'.$user['user_id'].'、'.$user['user_name'].'】充值'.$fee_points.'仙豆，获得奖励'.$points.'金币';
                            model('Glog')->saveData($data);
                        }
                    }else{ // 是代理商赠送仙豆
                        $r = model('User')->where($where)->setInc('user_points',$points);
                        if($r){
                            $data = [];
                            $data['user_id'] =$user['user_pid_2'];
                            $data['plog_type'] = 4;
                            $data['plog_points'] = $points;
                            $data['plog_remarks'] = '用户【'.$user['user_id'].'、'.$user['user_name'].'】充值'.$fee_points.'仙豆，获得奖励'.$points.'仙豆';
                            model('Plog')->saveData($data);
                        }
                    }

                }
            }

            if(!empty($GLOBALS['config']['user']['reward_ratio_3']) && !empty($user['user_pid_3'])){
                $points = floor($fee_points / 100 * $GLOBALS['config']['user']['reward_ratio_3']);
                if($points>0){
                    $where=[];
                    $where['user_id'] = $user['user_pid_3'];

                    $r3 = model('User')->where($where)->find($where);
                    if (self::isAgents($r3)){
                        $r = model('User')->where($where)->setInc('user_gold',$points);
                        if($r){
                            $data = [];
                            $data['user_id'] = $user['user_pid_3'];
                            $data['glog_type'] = 3;
                            $data['glog_gold'] = $points;
                            $data['glog_remarks'] = '用户【'.$user['user_id'].'、'.$user['user_name'].'】充值'.$fee_points.'仙豆，获得奖励'.$points.'金币';
                            model('Glog')->saveData($data);
                        }
                    }else{
                        $r = model('User')->where($where)->setInc('user_points',$points);
                        if($r){
                            $data = [];
                            $data['user_id'] = $user['user_pid_3'];
                            $data['plog_type'] = 4;
                            $data['plog_points'] = $points;
                            $data['plog_remarks'] = '用户【'.$user['user_id'].'、'.$user['user_name'].'】充值'.$fee_points.'仙豆，获得奖励'.$points.'仙豆';
                            model('Plog')->saveData($data);
                        }
                    }
                }
            }
        }

        return ['code'=>1,'msg'=>'分销提成成功'];
    }

    static $source_string = 'E5FCDG3HQA4B1NPJ2RSTUV67MWX89KLY';
    static $jumpNum = 32768;
    // public static function getInviteCode($userId) {
    //     $source_string = self::$source_string;
    //     $num = $userId + self::$jumpNum;
    //     $code = '';
    //     $stringCount = strlen($source_string);
    //     while ( $num > 0) {
    //         $mod = $num % $stringCount;
    //         $num = ($num - $mod) / $stringCount;
    //         $code = $source_string[$mod].$code;
    //     }
    //     if(empty($code[3]))
    //         $code = str_pad($code,4,'0',STR_PAD_LEFT);
    //     return self::perfectAgentsInviteCode($code);
    // }

    // public static function getUserIdByInviteCode($code){
    //     $source_string = self::$source_string;
    //     $stringCount = strlen($source_string);
    //     $code = self::paseAgentsInviteCodeToOrgan($code);
    //     if (strrpos($code, '0') !== false)
    //         $code = substr($code, strrpos($code, '0')+1);
    //     $len = strlen($code);
    //     $code = strrev($code);
    //     $num = 0;
    //     for ($i=0; $i < $len; $i++) {
    //         $num += strpos($source_string, $code[$i]) * pow($stringCount, $i);
    //     }
    //     return $num-self::$jumpNum;
    // }
/**
     * 加密函数
     * @param string $txt 需要加密的字符串
     * @param string $key 密钥
     * @return string 返回加密结果
     */
    function getInviteCode($txt, $key = ''){
        if (empty($txt)) return $txt;
        if (empty($key)) $key = 'DzJackLee';
        $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.";
        $ikey ="=Yi29aDkAs>9Z3gcXw.pOq3kRIxsZ6rm";
        $nh1 = rand(0,64);
        $nh2 = rand(0,64);
        $nh3 = rand(0,64);
        $ch1 = $chars{$nh1};
        $ch2 = $chars{$nh2};
        $ch3 = $chars{$nh3};
        $nhnum = $nh1 + $nh2 + $nh3;
        $knum = 0;$i = 0;
        while(isset($key{$i})) $knum +=ord($key{$i++});
        $mdKey = substr(md5(md5(md5($key.$ch1).$ch2.$ikey).$ch3),$nhnum%8,$knum%8 + 16);
        $txt = base64_encode(time().'_'.$txt);
        $txt = str_replace(array('+','/','='),array('-','_','.'),$txt);
        $tmp = '';
        $j=0;$k = 0;
        $tlen = strlen($txt);
        $klen = strlen($mdKey);
        for ($i=0; $i<$tlen; $i++) {
            $k = $k == $klen ? 0 : $k;
            $j = ($nhnum+strpos($chars,$txt{$i})+ord($mdKey{$k++}))%64;
            $tmp .= $chars{$j};
        }
        $tmplen = strlen($tmp);
        $tmp = substr_replace($tmp,$ch3,$nh2 % ++$tmplen,0);
        $tmp = substr_replace($tmp,$ch2,$nh1 % ++$tmplen,0);
        $tmp = substr_replace($tmp,$ch1,$knum % ++$tmplen,0);
        return $tmp;
    }
    /**
     * 解密函数
     * @param string $txt 需要解密的字符串
     * @param string $key 密匙
     * @return string 字符串类型的返回结果
     */
    function getUserIdByInviteCode($txt, $key = '', $ttl = 0){
        if (empty($txt)) return $txt;
        if (empty($key)) $key = 'DzJackLee';
        $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.";
        $ikey ="=Yi29aDkAs>9Z3gcXw.pOq3kRIxsZ6rm";
        $knum = 0;$i = 0;
        $tlen = @strlen($txt);
        while(isset($key{$i})) $knum +=ord($key{$i++});
        $ch1 = @$txt{$knum % $tlen};
        $nh1 = strpos($chars,$ch1);
        $txt = @substr_replace($txt,'',$knum % $tlen--,1);
        $ch2 = @$txt{$nh1 % $tlen};
        $nh2 = @strpos($chars,$ch2);
        $txt = @substr_replace($txt,'',$nh1 % $tlen--,1);
        $ch3 = @$txt{$nh2 % $tlen};
        $nh3 = @strpos($chars,$ch3);
        $txt = @substr_replace($txt,'',$nh2 % $tlen--,1);
        $nhnum = $nh1 + $nh2 + $nh3;
        $mdKey = substr(md5(md5(md5($key.$ch1).$ch2.$ikey).$ch3),$nhnum % 8,$knum % 8 + 16);
        $tmp = null;
        $j=0; $k = 0;
        $tlen = @strlen($txt);
        $klen = @strlen($mdKey);
        for ($i=0; $i<$tlen; $i++) {
            $k = $k == $klen ? 0 : $k;
            $j = strpos($chars,$txt{$i})-$nhnum - ord($mdKey{$k++});
            while ($j<0) $j+=64;
            $tmp .= $chars{$j};
        }
        $tmp = str_replace(array('-','_','.'),array('+','/','='),$tmp);
        $tmp = trim(base64_decode($tmp));
        if (preg_match("/\d{10}_/s",substr($tmp,0,11))){
            if ($ttl > 0 && (time() - substr($tmp,0,11) > $ttl)){
                $tmp = null;
            }else{
                $tmp = substr($tmp,11);
            }
        }
        return $tmp;
    }
    private static function perfectAgentsInviteCode($code){
//        $len = 7;
//        $lenth = strlen($code);
//        if ($lenth > $len){
//            return null;
//        }
//        $start = 'M';
//        if ($lenth < $len){
//            $repair = '';
//            for ($i=0;$i<$len-$lenth;$i++){
//                $repair.='0';
//            }
//            $start .= $repair;
//        }
//
//        $code = $start.$code;
        return $code;
    }

    private static function paseAgentsInviteCodeToOrgan($code){
//        $len = 7;
//        $code = substr($code,1, $len);
//        $code = self::outStartZero($code);

        return $code;
    }


    public static function isAgents($user){
        if (empty($user)){

            return false;
        }

        if (isset($user['is_agents']) && $user['is_agents']){

            return true;
        }

        return false;
    }
     /*
     * 变更代理
     * */
    public function changeAgents($where,$score=1000)
    {
        /*
         * 先判断用户是否存在
         * */
        $user = model('User')->where($where)->find();
        if (!$user){
            return ['code'=>0,'msg'=>'用户不存在'];
        }else{

            if(self::isAgents($user)){
                return ['code'=>0,'msg'=>'已是代理无须操作'];
            }

            if($user['user_points']<$score){
                return ['code'=>0,'msg'=>'您的仙豆不够'];
            }
            $data=[];
            $data['is_agents'] = 1;

            $this->where($where)->setDec('user_points',$score);
            $this->where($where)->update($data);
            $plog_data = [
                'user_id'=>$user['user_id'],
                'plog_type'=>'14',
                'plog_points'=>$score,
                'plog_time'=>time(),
                'plog_remarks'=>'用户变更代理商扣除仙豆'
            ];
            model('Plog')->saveData($plog_data);
            return ['code'=>1,'msg'=>'操作成功'];

        }
    }
}