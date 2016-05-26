<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
		<title>酷狗首页</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="Shortcut Icon" href="images/favicon.ico">
	</head>
	<body>
		<div>
			<script type="text/javascript">
				function getOs() 
				{ 
				    var OsObject = ""; 
				   if(navigator.userAgent.indexOf("MSIE")>0) { 
				        return "MSIE";
				   } 
				   if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){ 
				        return "Firefox"; 
				   } 
				   if(isSafari=navigator.userAgent.indexOf("Safari")>0) { 
				        return "Safari"; 
				   }  
				   if(isCamino=navigator.userAgent.indexOf("Camino")>0){ 
				        return "Camino"; 
				   } 
				   if(isMozilla=navigator.userAgent.indexOf("Gecko")>0){ 
				        return "Gecko"; 
				   } 
				} 
				if(getOs() == "MSIE"){
					document.write("<link rel='stylesheet' type='text/css' href='css/IEstyles.css'>");
				}
				if(getOs() == "Firefox"){
					document.write("<link rel='stylesheet' type='text/css' href='css/FFstyles.css'>");
				}
				if(getOs() == "Safari"){
					document.write("<link rel='stylesheet' type='text/css' href='css/GGstyles.css'>");
				}
				if(getOs() == "Camino"){
					alert("Camino");
				}
				if(getOs() == "Gecko"){
					alert("Gecko");
				}
			</script>
			<script type="text/javascript" src="js/jquery-1.9.js"></script>
			<script type="text/javascript" src="js/Abandon.js"></script>
			<!-- 头部信系 -->
			<div class="logo">
				<div class="logo_1"></div>
				<div class="logo_2">
					<form action="k/s" method="get">
					<span>
						<input id="logo1" type="text" value="搜歌手、歌曲" id="show" name="show" class="logo_2_1"/>
						<input type="submit" value=""class="logo_2_2"/>
						<!-- <a href="k/s?show=的" class="logo_2_2">搜索</a> -->
					</span>
					</form>
				</div>
				<div class="logo_3">
					<div class = "logo_3_1">
					<c:if test="${user != null}">
						<span class="logo_3_1_0">用户<a href="#" title="点击进去安全设置" style="color:red">${user.userName}</a>已登陆成功！</span>
					</c:if>
					<c:if test="${user == null}">
						<span class = "logo_3_1_1">
						<a href="Register.jsp" title="新用户注册">新用户注册</a>
						</span>
						<span class = "logo_3_1_2">
							<a href="#" id = "qq" title="立刻登陆" id="login1" onclick="loginInfo()">立刻登陆</a>
						</span>
					</c:if>
					</div>
					<div class ="logo_3_2">
						<span class = "logo_3_2_1">
							<a href="#" title="网页播放器">网页播放器</a>
						</span>
						<span class = "logo_3_2_2">
							<a href=# title="酷狗游戏">酷狗游戏</a>
						</span>
						<span class = "logo_3_2_3">
							<a href=# title="下载客户端">下载客户端</a>
						</span>
					</div>
				</div>
			</div>
			<!-- 导航信息 -->
			<div class="nav">
				<div id="nva-1" class="nva-1">
					<ul>
						<li><a href="#" title="乐库">乐库</a></li>
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
						<li><a href = "#" title="VIP中心">VIP中心</a></li>
						<li><a href = "#" title="客服中心">客服中心</a></li>
						<li><a href = "#" title="产品中心">产品中心</a></li>
					</ul>
				</div>
			</div>
			<!-- 小导航信息,导航下面的 -->
			<div class="hover">
				<div class="hover_1">
					<ul id="hover-1">
						<li><a href="#" title="推荐">推荐</a></li>
						<li><a href="#" title="排行榜">排行榜</a></li>
						<li><a href="#" title="分类">分类</a></li>
						<li><a href="#" title="精选">精选</a></li>
						<li><a href="#" title="好歌">好歌</a></li>
						<li><a href="#" title="抢先听">抢先听</a></li>
					</ul>
				</div>
				<div class="hover_2"></div>
			</div>
			<!-- 大图片互换 -->
			<div class="banner">
			<script type="text/javascript" src="js/jquery-1.9.js"></script>
			<script type="text/javascript" src="js/Change.js"></script>
				<div class="banner_1" >
						<div id="banner">
							 <c:forEach items="${list }" var="img" varStatus="status">
							 	<a href="#">
							 		<img src="${img.imgURL }"/>
							 	</a>
							 </c:forEach>
						<div id = "slide">
							<c:forEach begin = "1" end = "6" step="1" var = "index">
									<span>${index}</span>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="banner_2">
					<div class="banner_2_0">
						<ul>
							<li class="banner_2_1">
								<a href="#" title="酷狗音乐盒电脑版免费下载">
									<i>v7506</i>
								</a>
							</li>
							<li class="banner_2_2">
								<a href="#" title="酷狗音乐盒安卓版免费下载">
									<i>v5.6</i>
								</a>
							</li>
							<li class="banner_2_3">
								<a href="#" title="酷狗音乐盒iPhone版免费下载">
									<i>v3.5</i>
								</a>
								
							</li>				
						</ul>
					</div>
				</div>
			</div>
			<!-- 最新歌曲 -->
			<div class="wrap">
				<div class="wrap_1">
					<p class="wrap_1_1">
						<strong class="wrap_1_1_1">最新歌曲</strong>
						<span class="wrap_1_1_2"><a href="#" title="最新">最新</a></span>
						<span class="wrap_1_1_3"><a href="#" title="最热">最热</a></span>
						<span class="wrap_1_1_4"><a href="#" title="推荐榜">推荐榜</a></span>
						<strong class="wrap_1_1_5"><a href="#" title="酷狗音乐盒2013官方免费下载">酷狗音乐盒2013官方免费下载</a></strong>
						<a href="#" title="更多音乐推荐" class="wrap_1_1_6">更多</a>
					</p>
					<div class="wrap_1_2">
					<script type="text/javascript" src="js/Wrap.js"></script>
						<div  class="wrap_1_2_1">
							1
						</div>
						<div  class="wrap_1_2_2">
						2
						</div>
						<div  class="wrap_1_2_3">
							<table class="wrap_1_2_3_1" >
								<c:forEach items="${song }" begin = "0" end = "5" var="wrap" varStatus="status">
									<tr  <c:if test="${status.index % 2 != 0 }">class="wrap_1_2_3_1_1"</c:if><c:if test="${status.index % 2 == 0 }">class="wrap_1_2_3_1_2"</c:if>>
										<td style="width: 340px;height: 55px;margin: 0px;padding: 0px;">
											<div style="float: left;width: 50px;height: 53px;line-height: 50px;text-align: center;font-weight: bold">
												${status.index+1 }
											</div>
											<div style="float: left;width: 180px;">
												<div style="float: left;width: 180px;color:#282828;font-size:12px;height: 30px;line-height: 30px;">${wrap.songName }</div>
												<div style="float: left;width: 180px;color:#C3C9CA;font-size:12px;">
												${wrap.songWords }
												</div>
											</div>
											<div style="float: left;width: 70px;height:53px;line-height: 50px;font-size:12px;text-align: center; ">
												${wrap.songSinger }
											</div>
										</td>
									</tr>
								</c:forEach>
							</table>
							<table class="wrap_1_2_3_2" >
								<c:forEach items="${song }" begin = "0" end = "5" var="wrap" varStatus="status">
									<tr  <c:if test="${status.index % 2 != 0 }">class="wrap_1_2_3_1_1"</c:if><c:if test="${status.index % 2 == 0 }">class="wrap_1_2_3_1_2"</c:if>>
										<td style="width: 340px;height: 55px;margin: 0px;padding: 0px;cursor: pointer;">
											<div style="float: left;width: 50px;height: 53px;line-height: 50px;text-align: center;font-weight: bold">
												${status.index+1 }
											</div>
											<div style="float: left;width: 180px;">
												<div style="float: left;width: 180px;color:#282828;font-size:12px;height: 30px;line-height: 30px;">${wrap.songName }</div>
												<div style="float: left;width: 180px;color:#C3C9CA;font-size:12px;">
												${wrap.songWords }
												</div>
											</div>
											<div style="float: left;width: 70px;height:53px;line-height: 50px;font-size:12px;text-align: center; ">
												${wrap.songSinger }
											</div>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<!-- 乐库 -->
				<div class="wrap_2">
					<div class="wrap_2_1">
						<h4>乐库</h4>
					</div>
					<div class="wrap_2_2">
						<ul>
							<li class="wrap_2_2_1">
								<span>男歌手</span>
								<a href="#" title="山野">山野</a>
								<a href="#" title="周杰伦">周杰伦</a>
								<a href="#" title="林俊杰">林俊杰</a>
								<a href="#" title="郑源">郑源</a>
								<a href="#" title="陈奕迅">陈奕迅</a>
								<a href="#" title="王力宏">王力宏</a>
								<a href="#" title="张杰">张杰</a>
								<a href="#" title="刘德华">刘德华</a>
								<a  href="#" title="更多男歌手" class="wrap_2_2_1_1">更多</a>
							</li>
							<li class="wrap_2_2_1">
								<span>女歌手</span>
								<a href="#" title="萧亚轩">萧亚轩</a>
								<a href="#" title="梁静茹">梁静茹</a>
								<a href="#" title="玄子">玄子</a>
								<a href="#" title="王菲">王菲</a>
								<a href="#" title="张惠妹">张惠妹</a>
								<a href="#" title="卫兰">卫兰</a>
								<a href="#" title="金莎">金莎</a>
								<a href="#" title="张靓颖">张靓颖</a>
								<a  href="#" title="更多女歌手" class="wrap_2_2_1_1">更多</a>
							</li>
							<li class="wrap_2_2_2">
								<span>特色音乐</span>
								<a href="#" title="网络红歌">网络红歌</a>
								<a href="#" title="DJ混音">DJ混音</a>
								<a href="#" title="男女对唱">男女对唱</a>
								<a href="#" title="甜蜜情歌">甜蜜情歌</a>
								<a href="#" title="电影金曲">电影金曲</a>
								<a href="#" title="经典老歌">经典老歌</a>
								<a  href="#" title="更多特色音乐" class="wrap_2_2_1_1">更多</a>
							</li>
							<li class="wrap_2_2_3">
								<span>全球金榜</span>
								<a href="#" title="全球流行榜">全球流行榜</a>
								<a href="#" title="美国Billboard">美国Billboard</a>
								<a href="#" title="香港RTHK榜">香港RTHK榜</a>
								<a href="#" title="CHANNEL[V]">CHANNEL[V]</a>
								<a  href="#" title="更多金榜音乐" class="wrap_2_2_1_1">更多</a>
							</li>
							<li class="wrap_2_2_1">
								<span>音乐电台</span>
								<a href="#" title="热歌">热歌</a>
								<a href="#" title="咖啡厅">咖啡厅</a>
								<a href="#" title="摇滚">摇滚</a>
								<a href="#" title="轻音乐">轻音乐</a>
								<a href="#" title="安静">安静</a>
								<a href="#" title="80后">80后</a>
								<a href="#" title="粤语">粤语</a>
								<a href="#" title="欧美">欧美</a>
								<a  href="#" title="更多电台音乐" class="wrap_2_2_1_1">更多</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 热榜TOP10 -->
			<div class="hot">
				<div class="hot_1">
					<div class="hot_1_1">
						<div class="hot_1_1_1">
							<span>
							热榜Top10
							</span>
							<span>
								<a href="#" title="新歌Top10">最新</a>
							</span>
							<span>
								<a href="#" title="热榜Top10">最热</a>
							</span>
							<span>
								<a href="#" title="更多音乐排行榜">更多</a>
							</span>
						</div>
						<div class="hot_1_1_2">
							<table id="hot1" border="0" cellpadding="0" cellspacing="0">
							<c:forEach items="${songHeat }" var="song" begin="0"  end="9" varStatus="status">
								<tr  <c:if test="${status.index % 2 != 0 }">class="hot_1_1_2_8"</c:if><c:if test="${status.index % 2 == 0 }">class="hot_1_1_2_9"</c:if>>
									<td>
									<a href="#" title="${song.songName }">
										<span class="hot_1_1_2_1">
											${status.index+1 }
										</span>
										<span class="hot_1_1_2_2">
											${song.songName }
										</span>
									</a>
									</td>
								</tr>
							</c:forEach>
						</table>
							<div class="hot_1_1_3">
								<a></a>
							</div>
						</div>
					</div>
					<div class="hot_1_2">
						<div class="hot_1_2_1">
							<span>全球热榜</span>
							<span><a href="#"title="香港RTHK电台榜">香港</a></span>
							<span><a href="#"title="台湾Hito榜">台湾</a></span>
							<span><a href="#"title="英国单曲榜">英国</a></span>
							<span><a href="#"title="美国BillBoard榜">美国</a></span>
							<span><a href="#"title="更多音乐排行榜">更多</a></span>
						</div>
						<div class="hot_1_2_2">
							<div class="hot_1_1_2">
								<table id="hot2" border="0" cellpadding="0" cellspacing="0">
								<c:forEach items="${songHeat }" var="song" begin="0"  end="9" varStatus="status">
									<tr  <c:if test="${status.index % 2 != 0 }">class="hot_1_1_2_8"</c:if><c:if test="${status.index % 2 == 0 }">class="hot_1_1_2_9"</c:if>>
										<td>
										<a href="#" title="${song.songName }">
											<span class="hot_1_1_2_1">
												${status.index+1 }
											</span>
											<span class="hot_1_1_2_2">
												${song.songName }
											</span>
										</a>
										</td>
									</tr>
								</c:forEach>
								</table>
							<div class="hot_1_1_3">
								<a></a>
							</div>
						</div>
						</div>
					</div>
				</div>
				<div class="hot_2">
					<div class="hot_2_1">
						<h4>抢先首发</h4>
					</div>
					<div class="hot_2_2">
						<ul>
							<li class="hot_2_2_1">
								<a href="#" title="《笔仙2》电影原声带">
									<img src="images/20130717135149161722.jpg" />
									<span class="hot_2_2_1_1"></span>
									<i>《笔仙2》电影原
									<br />
									声带
									<br />
										在线首发
									</i>
								</a>
							</li>
							<li class="hot_2_2_1">
								<a href="#" title="阿鲁阿卓《像风一样自由》">
									<img src="images/20130717114143612635.jpg"/>
									<span class="hot_2_2_1_1"></span>
									<i>阿鲁阿卓《像山
									<br />
									风一样自由》
									<br />
										在线首发
									</i>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 音乐盛典 -->
			<div class="party">
				<div class="party_1">
					<div class="party_1_1">
						<div class="party_1_1_1">音乐盛典</div>
						<div class="party_1_1_2"><a href="#" title="电台">电台</a></div>
						<div class="party_1_1_3"><a href="#" title="精选集">精选集</a></div>
						<div class="party_1_1_4"><a href="#" title="酷狗音乐盒2013官方免费下载">酷狗音乐盒2013官方免费下载</a></div>
						<div class="party_1_1_5"><a href="#" title="更多">更多</a></div>
					</div>
					<div class="party_1_2">
						<div class="party_1_2_1">
							<ul>
								<c:forEach items="${songRadio }" var="song" begin="0"  end="14" varStatus="status">
								
									<li>
									
										<a href="#" title="${song.songWords }">
											<span class="party_1_2_1_1" style="display: block;">
												<img src="${song.songImg }"/>
											</span>
											<em>${song.songName }
												<b></b>
											</em>
											<span class="party_1_2_1_2" style="display: block;">
												${song.songSinger }
											</span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="party_2">
					<div class="party_2_1">
						<div class="party_2_1_1">
							<a href="#" title="原创达人">原创达人</a>
						</div>
						<div class="party_2_1_2">
							<a href="#" title="美女歌手">美女歌手</a>
						</div>
						<div class="party_2_1_3">
							<a href="#" title="更多">更多</a>
						</div>
					</div>
					<div  class="party_2_2">
					<div class="party_2_2_1">
						<ul>
							<c:forEach items="${songOriginal}" var="original" begin="0" end="0" varStatus="status">
								<li class="party_2_2_1_1">
									<span class="party_2_2_1_1_1"></span>
									<span class="party_2_2_1_1_2">
										<a href="#" title="${original.songName }">
											<img src="${original.songImg }"/>
										</a>
									</span>
									<span class="party_2_2_1_1_3">
										<i>${original.songName }</i>
									</span>
									<span class="party_2_2_1_1_4">
										<i>${original.songWords }</i>
									</span>
									<div class="party_2_2_1_1_5">
										<span class="party_2_2_1_1_5_1">
											${original.songSinger }
										</span>
										<span class="party_2_2_1_1_5_2">
											<a href="#" title="更多">更多</a>
										</span>
									</div>
									<div class="party_2_2_1_1_6">
										<a href="#" title="${original.songURL }">${original.songURL }</a>
										<span></span>
									</div>
								</li>
							</c:forEach>
							<c:forEach items="${songOriginal}" var="original" begin="1" end="4" varStatus="status">
								<li class="party_2_2_1_2">
									<span>
										${status.index+1 }
									</span>
									<a href="#" title="${original.songName }">
										<img src="${original.songImg }"/>
									</a>
									<div class="party_2_2_1_2_1">
										<a href="#" title="${original.songName }">${original.songName }</a>
										<div>
											${original.songWords }
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					</div>
				</div>
			</div>
			<!-- MV热播 -->
			<div class="MV">
				<div class="MV_1">
					<div class="MV_1_1">
						<div class="MV_1_1_1">MV热播</div>
						<div class="MV_1_1_2"><a href="#" title="酷狗音乐盒2013官方免费下载">酷狗音乐盒2013官方免费下载</a></div>
						<div class="MV_1_1_3"><a href="#" title="更多">更多</a></div>
					</div>
					<div class="MV_1_2">
						<c:forEach items="${songMV }" var="MV" varStatus="status">
							<div class="MV_1_2_1">
								<a class="MV_1_2_1_1">
									<img src="${MV.songImg }"/>
									<b></b>
									<i></i>
								</a>
								<a class="MV_1_2_1_2">${MV.songName }</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="MV_2">
					<div class="MV_2_1">
						<div class="MV_2_1_1">精彩推荐</div>
						<div class="MV_2_1_2"><a href="#" title="更多">更多</a>
						</div>
					</div>
					<div class="MV_2_2">
						<div class="MV_2_2_1">
							<a href="#" title="山东卫视《中国星力量》成龙任大使">
								<img src="images/20130711103847125899.jpg" />
							</a>
						</div>
						<div class="MV_2_2_2">
							<a title="山东卫视《中国星力量》成龙任大使" href="#">山东卫视《中国星力量》成龙任大使</a>
						</div>
					</div>
					<div class="MV_2_3">
						<a title="东方卫视打造偶像选拔赛：《中国梦之声》" href="#">东方卫视打造偶像选拔赛：《中国梦之声》</a>
						<a title="金鹰卡通正式推出少儿版《我是歌手》" href="#">金鹰卡通正式推出少儿版《我是歌手》</a>
					</div>
				</div>
			</div>
			<!-- 合作伙伴 -->
			<div class="partner">
				<div class="partner_1">
					<div class="partner_1_1">
						合作伙伴
					</div>
					<div class="partner_1_2">
						<a href="#" title="更多">更多</a>
					</div>
				</div>
				<div class="partner_2">
					<c:forEach items = "${cooperate }" var="co" varStatus="status">
						<a href="${co.cooperateURL }" title="${co.cooperateName }">${co.cooperateName }</a>
					</c:forEach>
				</div>
			</div>
			<!-- 声明 -->
			<div class="foot">
				<p>由于音乐来自网友通过P2P网络共享，本站未及一一审核，如有侵犯版权请及时电邮market@kugou.com并出示版权证明，我们将在24小时内删除。</p>	
			</div>
			<!-- 酷狗底部 -->
			<div style = "width:960px;height:110px;">
				<div class="links">
				  <div class="kugou"></div>
					  <a href="#" >关于酷狗</a> |
					  <a href="#" >广告服务</a> |
					  <a href="#" >友情链接</a> |
					  <a href="#" >招聘信息</a> |
					  <a href="#" >客服中心</a> | 
					  <a href="#" >用户体验提升计划</a>
					  <strong>
						 <a href="#">酷狗2013官方免费下载</a>
					  </strong>
				  <br />
					<span>网络视听许可证1910564号 文网文[2010]175号 Copyright (C) 2004-2013 KuGou-Inc.All Rights Reserved</span>
				  <br />
					 <span>增值电信业务经营许可证粤B2-20060339 粤ICP备09017694号-2 &nbsp;
						<a href="#">
							 <img alt="" src="images/logo_down.jpg" style="width:20px;height:20px" />
						</a>
				  </span>
				</div>
			</div>
		</div> 
		<script type="text/javascript" src="js/jquery-1.9.js"></script>
		<script type="text/javascript" src="js/test.js"></script>
		<!-- 半透明背景 -->
		<div class="mask" id="mask" style="display:none;"></div>
		<!-- 登陆 -->
		<div class="login" id="login" style="display: none;">
			<div class="login_1">
				<a title="关闭" onclick="EscInfo()">
					<img src="images/logo-2-2.jpg" />
				</a>
			</div>
			<div class="login_2"></div>
			<!--<form action="LoginDo" method="post" onsubmit="return confirmation()">-->
			<script type="text/javascript" src="js/common.js"></script>
			<script type="text/javascript">
				$(function(){
					$("#commit").click(function(){
						if($("#loginName").val() == null || $("#loginName").val() == "请输入账号名或邮箱" || $("#loginName").val() == ""){
							$("#login_1_1").html("账号不能为空！");
						}else if($("#loginPwd").val() == null || $("#loginPwd").val() == ""){
							$("#login_1_1").html("密码不能为空！")
						}else{
							$.ajax({dataType: "text",type: "get",url: "LoginDo",data: "name="+$("#loginName").val()+"&"+"pwd="+$("#loginPwd").val(),success: function(msg){
							    if(msg.trim() == "true"){
									location.reload();
									}else{
										$("#login_1_1").html("账号或密码错误！")
									}
							   }
							});
						}
					});
				});
				
			</script>
				<div class="login_3">
					<div class="login_3_0">
						<p id="login_1_1"></p>
					</div>
					<div class="login_3_1">
						<label>帐号：</label>
						<input type="text" value="请输入账号名或邮箱" maxlength="15" id="loginName" name="loginName" onclick="clickLogin()" onblur="mouserLogin()" />
					</div>
					<br />
					<div class="login_3_1">
						<label>密码：</label>
						<input type="password" maxlength="25" value="" id="loginPwd" name="loginPwd"/>
					</div>
					<div class="login_3_2">
						<div class="login_3_2_1">
							<input type="submit" value="" id = "commit" />
						</div>
						<div class="login_3_2_2">
							<a href="#" title="忘记密码">忘记密码</a>
							<a href="sonclass/Register.jsp" title="注册用户">注册用户</a>
							<span class="login_3_2_2_1">其他方式登录：</span>
							<span class="login_3_2_2_2">
								<a href="#" title="" class="login_3_2_2_2_1" ></a>
								<a href="#" title="" class="login_3_2_2_2_2" ></a>
								<a href="#" title="" class="login_3_2_2_2_3" ></a>
								<a href="#" title="" class="login_3_2_2_2_4" ></a>
							</span>
						</div>
					</div>
				</div>
			<!-- </form> -->
		</div>
	</body>
</html>
