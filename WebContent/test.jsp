<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/dataTables.bootstrap.js"></script>
<title>歌曲列表</title>
</head>
<script>
var contextPath = "${pageContext.request.contextPath}";
</script>
<body>
	<table id="example" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>编号</th>
				<th>歌曲名称</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<script type="text/javascript">
		jQuery.fn.dataTableExt.oApi.fnPagingInfo = function(oSettings) {
			return {
				"iStart" : oSettings._iDisplayStart,
				"iEnd" : oSettings.fnDisplayEnd(),
				"iLength" : oSettings._iDisplayLength,
				"iTotal" : oSettings.fnRecordsTotal(),
				"iFilteredTotal" : oSettings.fnRecordsDisplay(),
				"iPage" : oSettings._iDisplayLength === -1 ? 0 : Math.ceil(oSettings._iDisplayStart/ oSettings._iDisplayLength),
				"iTotalPages" : oSettings._iDisplayLength === -1 ? 0 : Math.ceil(oSettings.fnRecordsDisplay()/oSettings._iDisplayLength)
			};
		};
		$(document).ready(function() {
			$("#example").dataTable({
				"bPaginate": true, //翻页功能
				"bLengthChange": true, //改变每页显示数据数量
				"bProcessing" : true,
				"bServerSide" : true,
				"bAutoWidth": false,
				"sort" : "position",
				"bStateSave" : false,
				"iDisplayLength" : 5,
				"iDisplayStart" : 0,
				"aLengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "所有"]],
				"sAjaxSource" : contextPath + "/k/t",
				"aoColumns": [{
	                "mData": "songID",
	                /* "orderable": false, // 禁用排序 */
	                "sDefaultContent": "",
	                "sWidth":"10%"
	          }, {
	                "mData": "songName",
	                "sDefaultContent": "",
	                "sWidth":"10%"
	          }],
	        "oLanguage": { // 国际化配置
	            "sProcessing": "正在获取数据，请稍后...",
	            "sLengthMenu": "显示 _MENU_ 条",
	            "sZeroRecords": "没有您要的内容",
	            "sInfo": "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
	            "sInfoEmpty": "记录数为0",
	            "sInfoFiltered": "(全部记录数 _MAX_ 条)",
	            "sInfoPostFix": "",
	            "sSearch": "搜索",
	            "sUrl": "",
	            "oPaginate": {
	                "sFirst": "第一页",
	                "sPrevious": "上一页",
	                "sNext": "下一页",
	                "sLast": "最后一页"
	            }
	        }});
		});

	</script>
</body>
</html>