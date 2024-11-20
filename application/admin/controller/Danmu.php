<?php
namespace app\admin\controller;

use think\Db;
class Danmu extends Base
{
public function __construct()
{
parent::__construct();
}
public function data()
{
$param = input();
$param['page'] = intval($param['page']) <1 ?1 : $param['page'];
$param['limit'] = intval($param['limit']) <1 ?$this->_pagesize : $param['limit'];
$where=[];
if(!empty($param['uid'])){
$where['user_id'] = ['eq',$param['uid'] ];
}
$order='danmu_id desc';
$res = model('Danmu')->listData($where,$order,$param['page'],$param['limit']);
$data=[];
foreach ($res['list'] as $val=>$k){
$data['danmu_name']= Db::name('vod')->where('vod_id',$k['vod_id'])->value('vod_name');
$ns[] = array_merge($data,$k);
}
$this->assign('list',$ns);
$this->assign('total',$res['total']);
$this->assign('page',$res['page']);
$this->assign('limit',$res['limit']);
$param['page'] = '{page}';
$param['limit'] = '{limit}';
$this->assign('param',$param);
$this->assign('title','弹幕管理');
return $this->fetch('admin@danmu/index');
}
public function info()
{
if (Request()->isPost()) {
$param = input();
$param['admin_id']=1;
$res = model('danmu')->saveData($param);
if($res['code']>1){
return $this->error($res['msg']);
}
return $this->success($res['msg']);
}
$id = input('id');
$where=[];
$where['danmu_id'] = ['eq',$id];
$res = model('Danmu')->infoData($where);
$this->assign('info',$res['info']);
$this->assign('title','弹幕信息');
return $this->fetch('admin@danmu/info');
}
public function del()
{
$param = input();
$ids = $param['ids'];
$all = $param['all'];
if(!empty($ids) ||!empty($all)){
$where=[];
$where['danmu_id'] = ['in',$ids];
if($all==1){
$where['danmu_id'] = ['gt',0];
}
$res = model('Danmu')->delData($where);
if($res['code']>1){
return $this->error($res['msg']);
}
return $this->success($res['msg']);
}
return $this->error('参数错误');
}
public function field()
{
$param = input();
$ids = $param['ids'];
$col = $param['col'];
$val = $param['val'];
if(!empty($ids) &&in_array($col,['gbook_status']) ){
$where=[];
$where['gbook_id'] = ['in',$ids];
$res = model('Gbook')->fieldData($where,$col,$val);
if($res['code']>1){
return $this->error($res['msg']);
}
return $this->success($res['msg']);
}
return $this->error('参数错误');
}
}
?>