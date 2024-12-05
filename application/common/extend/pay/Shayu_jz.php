<?php
namespace app\common\extend\pay;

class Shayu_jz {
    public function submit($user,$order,$param)
    {
        $data = array();
        $data['merchantId'] = $GLOBALS['config']['pay']['shayu_jz']['merchant_id'];
        $data['orderId'] = $order['order_code'];
        $data['orderAmount'] = sprintf("%.2f",$order['order_price']);
        $data['channelType'] = $GLOBALS['config']['pay']['shayu_jz']['channel_type'];
        $data['notifyUrl'] = $GLOBALS['http_type'] . $_SERVER['HTTP_HOST'] . '/index.php/payment/notify/pay_type/shayu';
        $data['sign'] = $this->sign($data, $GLOBALS['config']['pay']['shayu_jz']['appkey']);

        $res = th_curl_post($GLOBALS['config']['pay']['shayu_jz']['apiurl'], $data);
        $res = json_decode($res,true);
        // print_r($res);exit;

        echo $res['data']['payUrl'];
        if($res['code']==200 && !empty($res['data']['payUrl'])){
            echo "<script>window.location.href = '".$res['data']['payUrl']."';</script>";
            die;
            // return $res;
        } else {
            echo '跳转失败';
        }
        // print_r($res);
        if(isset($res['msg'])) echo $res['msg'];
        else print_r($res);
        die;
    }

    public function sign($data, $signkey){
        $data = array_filter($data); //去空
        ksort($data); //排序
        $tmp_string = http_build_query($data); //进行键值对排列  a=1&b=2&c=3
        $tmp_string = urldecode($tmp_string); //参数无需进行urlencode ,上一步进行了urlencode,这里还原一下
        return md5( $tmp_string .'&key='. $signkey );  //签名生成
    }

    public function notify()
    {
        $param = input();

        //验证成功
        if($param['status'] == 'ok') {
            $res = model('Order')->notify($param['orderId'],'shayu_jz');
            if($res['code'] == 1) {
                echo "ok";
            } else {
                echo "fail";
            }
        }else{
            echo "fail";
        }
    }

}