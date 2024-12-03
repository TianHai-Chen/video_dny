<?php
namespace app\common\extend\pay;

class Shayu {
    public function submit($user,$order,$param)
    {
        $data = array();
        $data['merchantId'] = '10005';
        $data['orderId'] = $order['order_code'];
        $data['orderAmount'] = sprintf("%.2f",$order['order_price']);
        $data['channelType'] = $GLOBALS['config']['pay']['shayu']['appkey'];
        $data['notifyUrl'] = $GLOBALS['http_type'] . $_SERVER['HTTP_HOST'] . '/index.php/payment/notify/pay_type/Shayu';
        $data['sign'] = $this->sign($data, $GLOBALS['config']['pay']['shayu']['appkey']);

        $data['payment_type'] = '1';//默认值为：1（商品购买）
        $data['quantity'] = '1';//数量
        $data['_input_charset'] = 'utf-8';
        $data['partner'] = trim($GLOBALS['config']['pay']['alipay']['appid']);
        $data['seller_email'] = trim($GLOBALS['config']['pay']['alipay']['account']);
        $data['out_trade_no'] = $order['order_code'];
        $data['notify_url'] = $GLOBALS['http_type'] . $_SERVER['HTTP_HOST'] . '/index.php/payment/notify/pay_type/alipay';
        $data['return_url'] = $GLOBALS['http_type'] . $_SERVER['HTTP_HOST'] . '/index.php/payment/notify/pay_type/alipay';
        $data['subject'] = '仙豆充值（UID：'.$user['user_id'].'）';
        $data['total_fee'] = sprintf("%.2f",$order['order_price']);

        //待请求参数数组
        $para = $this->buildRequestPara($data);
        $sHtml = "<form id='alipaysubmit' name='alipaysubmit' action='https://mapi.alipay.com/gateway.do?_input_charset=utf-8' method='POST'>";
        while (list ($key, $val) = each ($para)) {
            $sHtml.= "<input type='hidden' name='".$key."' value='".$val."'/>";
        }
        //submit按钮控件请不要含有name属性
        $sHtml = $sHtml."<input type='submit' value='正在提交'></form>";
        $sHtml = $sHtml."<script>document.forms['alipaysubmit'].submit();</script>";
        echo $sHtml;
        die;
    }

    public function sign($data, $signkey){
        $data = array_filter($data); //去空
        ksort($data); //排序
        $tmp_string = http_build_query($data); //进行键值对排列  a=1&b=2&c=3
        $tmp_string = urldecode($tmp_string); //参数无需进行urlencode ,上一步进行了urlencode,这里还原一下
        return md5( $tmp_string .'&key='. $signkey );  //签名生成
    }

}