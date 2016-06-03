<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>后台登陆</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="Shortcut Icon" href="images/favicon.ico">

</head>

<body class="body2">
	<script type="text/javascript">
		function getOs() {
			var OsObject = "";
			if (navigator.userAgent.indexOf("MSIE") > 0) {
				return "MSIE";
			}
			if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) {
				return "Firefox";
			}
			if (isSafari = navigator.userAgent.indexOf("Safari") > 0) {
				return "Safari";
			}
			if (isCamino = navigator.userAgent.indexOf("Camino") > 0) {
				return "Camino";
			}
			if (isMozilla = navigator.userAgent.indexOf("Gecko") > 0) {
				return "Gecko";
			}
		}
		if (getOs() == "MSIE") {
			document
					.write("<link rel='stylesheet' type='text/css' href='css/IERegister.css'>");
		}
		if (getOs() == "Firefox") {
			document
					.write("<link rel='stylesheet' href='css/FFRegister.css' type='text/css'>");
		}
		if (getOs() == "Safari") {
			document
					.write("<link rel='stylesheet' href='css/GGRegister.css' type='text/css'>");
		}
		if (getOs() == "Camino") {
			alert("Camino");
		}
		if (getOs() == "Gecko") {
			alert("Gecko");
		}
	</script>
	<script type="text/javascript" src="js/jquery-1.9.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#back")
					.click(
							function() {
								if ($("#name").val() == null
										|| $("#name").val() == "") {
									$(".backstage_2").css("display", "block");
									$(".backstage_1_5").css("display", "block");
								} else if ($("#pwd").val() == null
										|| $("#pwd").val() == "") {
									$(".backstage_2").css("display", "block");
									$(".backstage_1_5").css("display", "block");
								} else if ($("#spanCode").html() != $(
										".backstage_1_4_2").val()) {
									$(".backstage_2").css("display", "block");
									$(".backstage_1_5").css("display", "block");
								} else {
									document.form1.submit();
									/* $
											.ajax({
												dataType : "text",
												type : "POST",
												url : "AdminLogin",
												data : "name="
														+ $("#name").val()
														+ "&" + "pwd="
														+ $("#pwd").val(),
												success : function(msg) {
													if (msg.length > 0) {
														location.href = "Backstage.jsp";
													} else {
														$(".backstage_2").css(
																"display",
																"block");
														$(".backstage_1_5")
																.css("display",
																		"block");
													}
												}
											}); */
								}
							});
		});
	</script>
	<form action="login" method="post" name="form1">
		<img class="backstage" src="images/133T53031-0.jpg"></img>
		<div class="backstage_1">
			<div class="backstage_1_1">
				<h2>酷狗官网后台管理登陆系统</h2>
			</div>
			<div class="backstage_1_2">
				<div class="backstage_1_2_1">
					<span>用户名：</span> <input type="text" name="username" id="name" />
				</div>
				<div class="backstage_1_2_2">
					<span>密&nbsp;&nbsp;码：</span> <input type="password" name="password"
						id="pwd" />
				</div>
			</div>
			<div class="backstage_1_3">
				<input type="button" value="" id="back" /><font color="red">${error}</font>
			</div>
			<script type="text/javascript" src="js/Admin.js"></script>
			<div class="backstage_1_4">
				<span class="backstage_1_4_1">验证码：</span> <input
					class="backstage_1_4_2" type="text" maxlength="4" /> <span
					class="backstage_1_4_3" id="spanCode"></span> <a
					onclick="createCode()">看不清，换一张</a>
			</div>
			<div style="float:right;">
				<a href="Register.jsp">用户注册</a>
			</div>
			<p class="backstage_1_5" style="display: none;">请勿非法登陆！</p>
			<div class="backstage_2" style="display: none;"></div>
		</div>
	</form>
</body>
</html>
