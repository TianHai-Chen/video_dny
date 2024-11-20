<?php
return array (
  //subm3u8
  'bjyun' => 
  array (
    'status' => '1',
    'from' => 'subm3u8',
    'show' => '解析1',//速播资源
    'des' => '支持手机电脑在线播放',
    'target' => '_self',
    'ps' => '0',
    'parse' => 'https://jx.m3u8.tv/jiexi/?url=',
    'sort' => '1000',
    'tip' => '无需安装任何插件',
    'id' => 'subm3u8',
  ),
  'qq' => 
  array (
    'status' => '1',
    'from' => 'qq',
    'show' => '解析2',//腾讯视频
    'des' => '支持手机电脑在线播放',
    'ps' => '1',
    'parse' => 'https://jx.m3u8.tv/jiexi/?url=', //https://jx.xxxx.com/?url= | https://jx.wolongm3u8.com:65/m3u8.php?url=
    'parse2' => 'https://jx.m3u8.tv/jiexi/?url=',
    'sort' => '9999',
    'tip' => '无需安装任何插件',
    'kernel' => '0',
    'features' => '.*?.mp4,.*?.m3u8',
    'headers' => '',
    'issethead' => '',
    'id' => 'qq',
  ),
);