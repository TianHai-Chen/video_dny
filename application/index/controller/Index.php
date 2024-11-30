<?php
namespace app\index\controller;

class Index extends Base
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        return $this->label_fetch('index/index');
    }

    public function test()
    {
        $data = model('Vod')->where(' vod_pic like "%\"%" OR vod_play_url like "%$$$%" ')->field('vod_id,vod_pic,vod_play_url')->select();
        print_r($data);exit;
        foreach($data as $v) {
            if(strrpos($v->vod_pic , '"')) {
                $v->vod_pic_test = substr($v->vod_pic, 0, strrpos($v->vod_pic , '"'));
                model('Vod')->where('vod_id', $v->vod_id)->update(['vod_pic' => $v->vod_pic_test]);
            }
            if(strrpos($v->vod_play_url , '$$$')) {

                $temp_arr = explode('$$$', $v->vod_play_url);
                foreach ($temp_arr as $value) {
                    if(strpos($value, '.m3u8')) {
                        $v->vod_play_url_test = $value;
                        model('Vod')->where('vod_id', $v->vod_id)->update(['vod_play_url' => $v->vod_play_url_test]);
                    } else {
                        model('Vod')->where('vod_id', $v->vod_id)->delete();
                    }
                    break;
                }
                //============================
                // $v->vod_play_url_test = substr($v->vod_play_url, strrpos($v->vod_play_url , '$$$')+strlen('$$$'));
                //model('Vod')->where('vod_id', $v->vod_id)->update(['vod_play_url' => $v->vod_play_url_test]);

            }
            print_r($v->toArray());
            echo '<br /><br />';
        }
        return 'waf';
    }

    public function autoM() 
    {
        //default
        $num = 500;
        $start_val = 1;
        $mul = 7; //A:7 B:7.92

        //change
        $sum_pe = 0;
        $sum = 0;
        $temp_sum = 0;

        //result
        $arr = [];

        for ($i = 1; $i <= $num; $i++) {
            $every_res = $start_val * $mul;
            $temp_sum = $sum == 0 ? $start_val : $sum + $start_val;
            $result = $every_res - $temp_sum;

            // echo $start_val;
            // echo '<br />';
            // echo $every_res;
            // echo '<br />';
            // echo $temp_sum;
            // echo '<br />';
            // echo $result;
            // echo '<br />';
            // echo '<br />';
            if($every_res <= $temp_sum+$i*0.2) { //A:$temp_sum B:$temp_sum+$i*0.2 C:$temp_sum+$i
                $start_val += 1;
                continue;
            }
            $sum = $temp_sum;
            $sum_pe += 1;
            $arr[$sum_pe]['every_val'] = $start_val;
            $arr[$sum_pe]['result'] = $result;
            $arr[$sum_pe]['sum'] = $sum;
            // $arr[$sum_pe]['temp_sum'] = $temp_sum+$i*0.2;
            $arr[$sum_pe]['every_res'] = $every_res;
        }

        print_r($arr);
        echo '<br />';
        return 'success';
    }

}
