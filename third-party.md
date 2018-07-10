# 短信平台
- 国内：[阿里大于](https://www.alidayu.com/)（接入过，价格4分钱一条）
- 国际：[TeleSign](https://www.telesign.com/)（谷歌、微软、fb、steam都在用，听说完全没有延迟，价格未知）

# app推送平台
- 国内：[极光推送](https://www.jiguang.cn/)（接入过，免费）
- 国际：

# 支付平台
- 国内：[支付宝](https://open.alipay.com/)、[微信](https://open.weixin.qq.com/)
- 国际：[appstore](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/StoreKitGuide/Introduction.html)、[google play](https://developer.android.com/training/in-app-billing/index.html)

# 服务器租用
- 国内：[阿里云](https://www.aliyun.com/)（国内速度快）
- 国际：[linode](https://www.linode.com/)（便宜、随时开关）、[AWS](https://aws.amazon.com)（免费抗ddos50G）

# app url映射
- 国内：[hotapp](https://www.hotapp.cn/)（附带部分统计功能，调用的是百度统计）
- 国际：[appurl](https://appurl.org/)（支持app和pc各种客户端）
- 自建页面也可以，通过js判断:
```
<html>
<head>
<title>判断操作系统</title>
<script type="text/javascript">
function detectOS() { 
	var platform = navigator.platform.toLowerCase();
	var userAgent = navigator.userAgent.toLowerCase();

	// windows
	if (platform.indexOf("win") > -1) {
		if (userAgent.indexOf("Windows NT 5.0") > -1 || userAgent.indexOf("Windows 2000") > -1) {
			return "Win2000";
		} else if (userAgent.indexOf("Windows NT 5.1") > -1 || userAgent.indexOf("Windows XP") > -1) {
			return "WinXP";
		} else if (userAgent.indexOf("Windows NT 5.2") > -1 || userAgent.indexOf("Windows 2003") > -1) {
			return "Win2003";
		} else if (userAgent.indexOf("Windows NT 6.0") > -1 || userAgent.indexOf("Windows Vista") > -1) {
			return "WinVista";
		} else if (userAgent.indexOf("Windows NT 6.1") > -1 || userAgent.indexOf("Windows 7") > -1) {
			return "Win7";
		} else if (userAgent.indexOf("Windows NT 10.0") > -1 || userAgent.indexOf("Windows 10") > -1) {
			return "Win10";
		} else {
			return "Other Windows";
		}
	} else if (platform.indexOf("mac") > -1) {
		return "Mac";
	} else if (platform.indexOf("x11") > -1) {
		return "Unix";
	} else if (platform.indexOf("linux") > -1) {
		if (userAgent.indexOf("android") > -1) {
			return "Android";
		} else {
			return "Linux";
		}
	} else if (platform.indexOf("iphone") > -1) {
		return "iPhone";
	} else if (platform.indexOf("ipad") > -1) {
		return "iPad";
	} else {
		return "other. platform:" + platform + " userAgent:" + userAgent;
	}
} 

var os = detectOS()
document.writeln("您的操作系统是：" + os); 
alert(os);
</script>
</head>
<body>
</body>
</html>
```

# 页面或app统计
- 国内：[百度统计](http://tongji.baidu.com/)（貌似只有web统计，没见到app统计）
- 国际：[google统计](https://analytics.google.com/)（可以统计web或app）

# dns
- 国内：[阿里云解析](https://wanwang.aliyun.com/domain/dns/)、[dnspod](https://www.dnspod.cn/)[可自动切换ip]
- 国际：[dynadot](https://www.dynadot.com/)

