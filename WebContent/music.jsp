<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>播放</title>
		<style>
			
		</style>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/musicstyle.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css" />
	</head>
	<body>
		
		<q6player  id="audio_id" src='${pageContext.request.contextPath}/${song.songURL}' lrc='${pageContext.request.contextPath}/${song.songLRC}'></q6player>
		<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/musicplayer.js" ></script>
	</body>
</html>