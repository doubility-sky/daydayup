- https://en.wikipedia.org/wiki/HTML
- https://www.w3schools.com/html


### FAQ
- 判断操作系统
```html
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
