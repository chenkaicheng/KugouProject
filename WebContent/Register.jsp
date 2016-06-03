<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>注册用户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="Shortcut Icon" href="images/favicon.ico">
</head>
<body class="body1">
	<script type="text/javascript" src="js/jquery-1.9.js"></script>
	<script type="text/javascript" src="js/Abandon.js"></script>
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
	<script language=javascript>
		//判断输入密码的类型  
		function CharMode(iN) {
			if (iN >= 48 && iN <= 57) //数字  
				return 1;
			if (iN >= 65 && iN <= 90) //大写  
				return 2;
			if (iN >= 97 && iN <= 122) //小写  
				return 4;
			else
				return 8;
		}
		//bitTotal函数  
		//计算密码模式  
		function bitTotal(num) {
			modes = 0;
			for (i = 0; i < 4; i++) {
				if (num & 1)
					modes++;
				num >>>= 1;
			}
			return modes;
		}
		//返回强度级别  
		function checkStrong(sPW) {
			if (sPW.length <= 4)
				return 0; //密码太短  
			Modes = 0;
			for (i = 0; i < sPW.length; i++) {
				//密码模式  
				Modes |= CharMode(sPW.charCodeAt(i));
			}
			return bitTotal(Modes);
		}

		//显示颜色  
		function pwStrength(pwd) {
			O_color = "#eeeeee";
			L_color = "#5bf53d";
			M_color = "#5bf53d";
			H_color = "#5bf53d";
			if (pwd == null || pwd == '') {
				Lcolor = Mcolor = Hcolor = O_color;
			} else {
				S_level = checkStrong(pwd);
				switch (S_level) {
				case 0:
					Lcolor = Mcolor = Hcolor = O_color;
				case 1:
					Lcolor = L_color;
					Mcolor = Hcolor = O_color;
					break;
				case 2:
					Lcolor = Mcolor = M_color;
					Hcolor = O_color;
					break;
				default:
					Lcolor = Mcolor = Hcolor = H_color;
				}
			}
			document.getElementById("strength_L").style.background = Lcolor;
			document.getElementById("strength_M").style.background = Mcolor;
			document.getElementById("strength_H").style.background = Hcolor;
			return;
		}
	</script>
	<!-- Logo -->
	<div class="logo">
		<div class="logo_1"></div>
		<div class="logo_2">
			<form action="SearchSong" method="post">
				<span> <input id="logo1" type="text" value="搜歌手、歌曲"
					name="show" class="logo_2_1" /> <input type="submit" value=""
					class="logo_2_2" />
				</span>
			</form>
		</div>
		<div class="logo_3">
			<div class="logo_3_1">
				<c:if test="${user != null}">
					<span class="logo_3_1_0">用户<a href="#" title="点击进去安全设置"
						style="color: red">${user.userName}</a>以登陆成功！
					</span>
				</c:if>
				<c:if test="${user == null}">
					<span class="logo_3_1_1"> <a
						href="javascript:opener.location.reload()" title="新用户注册">新用户注册</a>
					</span>
					<span class="logo_3_1_2"> <a href="#" title="立刻登陆"
						id="login1" onclick="loginInfo()">立刻登陆</a>
					</span>
				</c:if>
			</div>
			<div class="logo_3_2">
				<span class="logo_3_2_1"> <a href="#" title="网页播放器">网页播放器</a>
				</span> <span class="logo_3_2_2"> <a href=# title="酷狗游戏">酷狗游戏</a>
				</span> <span class="logo_3_2_3"> <a href=# title="下载客户端">下载客户端</a>
				</span>
			</div>
		</div>
	</div>
	<!-- 导航信息 -->
	<div class="nav">
		<div id="nva-1" class="nva-1">
			<ul>
				<li><a href="WinLoad" title="乐库">乐库</a></li>
				<li><a href="xu/电台频道.html" title="电台">电台</a></li>
				<li><a href="#" title="MV">MV</a></li>
				<li><a href="#" title="资讯">资讯</a></li>
				<li><a href="xu/繁星网.html" title="美女秀场">美女秀场</a></li>
				<li><a href="#" title="音乐达人">音乐达人</a></li>
			</ul>
		</div>
		<div class="nav_0"></div>
		<div class="nav_2">
			<ul>
				<li><a href="#" title="VIP中心">VIP中心</a></li>
				<li><a href="#" title="客服中心">客服中心</a></li>
				<li><a href="#" title="产品中心">产品中心</a></li>
			</ul>
		</div>
	</div>
	<!-- 注册信息 -->
	<div class="main">
		<div class="main_1">
			<p></p>
		</div>
		<div class="main_2">
			<script type="text/javascript" src="js/jquery-1.9.js"></script>
			<script type="text/javascript" src="js/Shift.js"></script>
			<script type="text/javascript" src="js/Code.js"></script>
			<script type="text/javascript" src="js/common.js"></script>
			<form action="add" method="post" id="register"
				onsubmit="return xyj()">
				<table class="main_2_1" id="main1">
					<tr>
						<td class="main_2_1_1"><label>用户名：</label></td>
						<td class="main_2_1_2">
							<div class="main_2_1_2_1">
								<input type="text" maxlength="20" onblur="txtName()"
									name="username" id="UserName" />
							</div>
							<div class="main_2_3_1" id="txtUserName"></div>
						</td>
					</tr>
					<tr>
						<td class="main_2_1_1"><label>邮箱：</label></td>
						<td class="main_2_1_2">
							<div class="main_2_1_2_1">
								<input type="text" maxlength="25" onblur="txtEmail()"
									name="email" id="UserEmail" />
							</div>
							<div class="main_2_3_1" id="txtUserEmail"></div>
						</td>
					</tr>
					<tr>
						<td class="main_2_1_1"><label>密码：</label></td>
						<td class="main_2_1_2">
							<div class="main_2_1_2_1">
								<input type="password" maxlength="16" name="password"
									id="UserPwd" onKeyUp=pwStrength(this.value)
									onBlur=pwStrength(this.value) />
							</div>
							<div class="main_2_3_1" id="txtUserPwd"></div>
						</td>
					</tr>
					<tr align="center" bgcolor="#f5f5f5">
						<td width="2%" height="5px" id="strength_L"
							style="border-radius: 10px">弱</td>
						<td width="2%" height="5px" id="strength_M"
							style="border-radius: 10px">中</td>
						<td width="2%" height="5px" id="strength_H"
							style="border-radius: 10px">强</td>
					</tr>
					<tr>
						<td class="main_2_1_1"><label>确认密码：</label></td>
						<td class="main_2_1_2">
							<div class="main_2_1_2_1">
								<input type="password" maxlength="16" onblur="txtPass()"
									name="rpassword" id="UserPass" />
							</div>
							<div class="main_2_3_1" id="txtUserPass"></div>
						</td>
					</tr>
					<tr>
						<td class="main_2_1_1"><label>验证码：</label></td>
						<td class="main_2_1_2">
							<div class="main_2_2_3">
								<input type="text" maxlength="4" id="inputCode"
									onblur="txtCode()" />
							</div>
							<div class="main_2_3_3" onclick="createCode()" id="checkCode"></div>
							<div class="main_2_3_4">
								<a onclick="createCode()" id="qq" title="看不清楚了吧，点击这里换一张验证码">换一张</a>
							</div>
							<div class="main_2_3_1" id="txtCode"></div>
						</td>
					</tr>
					<tr>
						<td class="main_2_2_2" colspan="2">
							<div class="main_2_2_2_1">
								<input type="checkbox" checked="checked" id="check" />我已认真阅读并同意<a
									href="#">《酷狗服务条款》</a>
							</div>

							<div class="main_2_2_2_2" id="txtCheck"></div>
						</td>
					</tr>
					<tr>
						<td class="main_2_1_1" colspan="2">
							<div class="main_2_2_1">
								<input id="subRegister" type="submit" value="" />
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 声明 -->
	<div class="foot">
		<p>由于音乐来自网友通过P2P网络共享，本站未及一一审核，如有侵犯版权请及时电邮market@kugou.com并出示版权证明，我们将在24小时内删除。</p>
	</div>
	<!-- 酷狗底部 -->
	<div style="width: 960px; height: 110px;">
		<div class="links">
			<div class="kugou"></div>
			<a href="#">关于酷狗</a> | <a href="#">广告服务</a> | <a href="#">友情链接</a> |
			<a href="#">招聘信息</a> | <a href="#">客服中心</a> | <a href="#">用户体验提升计划</a>
			<strong> <a href="#">酷狗2013官方免费下载</a>
			</strong> <br /> <span>网络视听许可证1910564号 文网文[2010]175号 Copyright (C)
				2004-2013 KuGou-Inc.All Rights Reserved</span> <br /> <span>增值电信业务经营许可证粤B2-20060339
				粤ICP备09017694号-2 &nbsp; <a href="#"> <img alt=""
					src="images/logo_down.jpg" style="width: 20px; height: 20px" />
			</a>
			</span>
		</div>
	</div>
</body>
</html>
