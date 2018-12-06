<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/manage/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/metisMenu.min.css" rel="stylesheet">
<link href="css/dataTables.bootstrap.css" rel="stylesheet">
<link href="css/sb-admin-2.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/boot-crm.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	function fenye(page) {
		var queryName = '${queryName}';

		if (queryName == '' || queryName == undefined || queryName == null) {
			var url = 'index.html?page=' + page;
			location = url;
		} else {
			var url = 'queryTeacherInfolist.html?page=' + page + '&queryName='
					+ queryName;
			location = url;
		}
	}

	$(document).ready(function() {
		var queryName = '${queryName}';
		$("#queryName").val(queryName);
	});
</script>
<style type="text/css">
.next {
	border: 1px solid #e6e6e6;
	background-image: url('picture/timg.jpg');
}
</style>

</head>

<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">一组在线考试管理员系统</a>
		</div>
		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">管理员已登录</a></li>
				<li class="dropdown"><button type="button" class="btn btn-default" onclick = "exit()">
							退出登录</button></li>
		</ul>

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search"></li>
					<li><a target="_self" href="index.html" target="right"><i
							class="fa fa-edit fa-fw"></i>教师管理</a></li>
					<li><a target="_self" href="classmanage.html"><i
							class="fa fa-dashboard fa-fw"></i>班级管理</a></li>
					<li><a target="_self" href="studentmanage.html"><i
							class="fa fa-dashboard fa-fw"></i>学生管理</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>
		<div id="page-wrapper">
			<!-- 教师 -->
			<div class="row">
				<!-- 教师管理 -->
				<div class="col-lg-12">
					<h1 class="page-header" style="display: inline-block;">教师管理</h1>
					<a class="btn btn-primary btn-sm" data-toggle="modal"
						data-target="#batchAddTeacher"
						style="float: right;margin-top: 50px;margin-right: 10px;">批量添加</a>
					<a class="btn btn-primary btn-sm" data-toggle="modal"
						data-target="#addTeacherOne"
						style="float: right;margin-top: 50px;margin-right: 24px;">添加教师</a>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="queryTeacherInfolist.html"
						method="post">
						<div class="form-group">
							<label for="queryName"> 职工名： </label> <input type="text"
								class="form-control" id="queryName" name="queryName"
								value="${queryName}">
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<!-- 教师列表 -->
					<div class="panel panel-default">
						<div class="panel-heading"
							style="text-align: center;height: 47px;font-size: 20px;">
							职工信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped"
							style="text-align: center;height: 38px;">
							<thead>
								<tr>
									<th>教工ID</th>
									<th>职工名</th>
									<th>教工密码</th>
									<th>是否管理员</th>
									<th>入职时间</th>
									<th>邮箱地址</th>
									<th>操作管理</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${teacherInfoList}" var="til">
									<tr>
										<td>${til.teacherId}</td>
										<td>${til.teacherName }</td>
										<td>${til.teacherPwd}</td>
										<td><c:if test="${til.isAdmin==1}">是</c:if> <c:if
												test="${til.isAdmin==0}">否</c:if></td>
										<td>${til.joindate}</td>
										<td>${til.email}</td>
										<td><a class="btn btn-primary btn-xs" data-toggle="modal"
											data-target="#TeacherInfoEditDialog"
											onclick="editTeacherInfo(${til.teacherId})">修改</a> <a
											class="btn btn-danger btn-xs"
											onclick="deleteTeacherInfo(${til.teacherId})">删除</a></td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="6" align="center">当前页数：${p.page }&nbsp;&nbsp;&nbsp;&nbsp;
										<a onclick="fenye(1)">首页</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
										onclick="fenye(${p.shang})">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
										onclick="fenye(${p.xia})">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
										onclick="fenye(${p.pagecount})">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
										总页数：${p.pagecount }
									</td>
								</tr>
							</tbody>

						</table>

						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
	</div>

	<!-- 教师编辑对话框 -->
	<div class="modal fade" id="TeacherInfoEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改教师信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_TeacherInfo_form">
						<input type="hidden" id="edit_teacherId" name="teacherId" />
						<div class="form-group">
							<label for="edit_teacherName" class="col-sm-2 control-label">
								职工名 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_teacherName"
									placeholder="职工名" name="teacherName" readonly>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_teacherPwd" class="col-sm-2 control-label">
								职工密码 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_teacherPwd"
									placeholder="职工密码" name="teacherPwd">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_isAdmin"
								style="float: left; padding: 7px 15px 0 27px;"> 职工类别 </label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_isAdmin" name="isAdmin">
									<option value="0" selected="selected">普通职工</option>
									<option value="1">职工管理员</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_email"
								style="float: left; padding: 7px 40px 0 27px;"> 邮箱 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_email"
									placeholder="邮箱" name="email">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_joindate"
								style="float: left; padding: 7px 15px 0 25px;">入职时间 </label>
							<div class="control-group">
								<div class="controls input-append date form_date" data-date=""
									data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input size="16" id= "edit_joindate" name = "joindate" type="text" value="2018-11-01" readonly> <span
										class="add-on"><i class="icon-remove"></i></span> <span
										class="add-on"><i class="icon-th"></i></span>
								</div>
								<input type="hidden" id="dtp_input2" value="" /><br />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateTeacherInfo()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
	<!--
        	作者：ly
        	时间：2018-10-29
        	描述：添加教师对话框
        -->
	<div class="modal fade" id="addTeacherOne" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" style="display: none;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加教师</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="insert_teacher_form"
						autocomplete="off">
						<div class="form-group">
							<label for="insert_TeacherName"
								style="float: left; padding: 7px 15px 0 27px;"> 教工名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="insert_TeacherName"
									placeholder="教工名称" name="teacherName">
							</div>
						</div>
						<div class="form-group">
							<label for="insert_TeacherPwd"
								style="float: left; padding: 7px 15px 0 27px;"> 教工密码 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="insert_TeacherPwd"
									placeholder="密码" name="teacherPwd">
							</div>
						</div>
						<div class="form-group">
							<label for="insert_TeacherType"
								style="float: left; padding: 7px 15px 0 27px;"> 职工类别 </label>
							<div class="col-sm-10">
								<select class="form-control" id="insert_isAdmin" name="isAdmin">
									<option value="0" selected="selected">普通职工</option>
									<option value="1">职工管理员</option>
								</select>
							</div>

						</div>
						<div class="form-group">
							<label for="insert_joindate"
								style="float: left; padding: 7px 15px 0 25px;">入职时间 </label>
							<div class="control-group">
								<div class="controls input-append date form_date1" data-date=""
									data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input size="16" id= "insert_joindate" name = "joindate" type="text" value="2018-11-01" readonly> <span
										class="add-on"><i class="icon-remove"></i></span> <span
										class="add-on"><i class="icon-th"></i></span>
								</div>
								<input type="hidden" id="dtp_input2" value="" /><br />
							</div>
							</div>
						<div class="form-group">
							<label for="insert_TeacherPwd"
								style="float: left; padding: 7px 40px 0 27px;"> 邮箱 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="insert_TeacherPwd"
									placeholder="邮箱" name="email">
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="insertTeacher()">确认增加</button>
				</div>
			</div>
		</div>
	</div>
	<div id="batchAddTeacher" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close ion-ios-close"
							data-dismiss="modal">
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">批量添加老师</h4>
					</div>
					<div class="modal-body clearfix">
						<div class="form-group">
							<label for="edit_custLevel"
								style="float: left; padding: 7px 15px 0 27px;">上传</label> 
								<input id = "batchAddInput"type="file" style="display:inline-block" /> <span>请按模板导入</span>
							<span><a href="mubanTeacherExcel.html">下载导入模板</a></span>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消上传</button>
						<button type="button" class="btn btn-primary" onclick = "batchAdd()">上传</button>
					</div>
				</div>
			</div>
		</div>
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<!-- <script src="js/metisMenu.min.js"></script> -->
	<!-- DataTables JavaScript -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script src="js/sb-admin-2.js"></script>
	<!-- 教师编辑对话框 -->
	<script type="text/javascript">
	
	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
    $('.form_date1').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
		function insertTeacher() {
			$.post("insertteacher.html", $("#insert_teacher_form").serialize(),
					function(data) {
						if(data){
						alert("添加成功");
						}else{
						alert("添加失败");
						}
						location.reload();
					});
		}

		function editTeacherInfo(id) {
			$.getJSON("toupdateteacher.html", {
				id : id
			}, function(data) {
				$("#edit_teacherId").val(data.teacherId);
				$("#edit_teacherName").val(data.teacherName);
				$("#edit_teacherPwd").val(data.teacherPwd);
				$("#edit_joindate").val(data.joindate);
				$("#edit_email").val(data.email);

			});
		}

		function updateTeacherInfo(id) {
			$.post("updateteacher.html", $("#edit_TeacherInfo_form")
					.serialize(), function(data) {
				if(data){
				alert("修改成功");
				}else{
				alert("修改失败");
				}
				location.reload();
			});
		}

		function deleteTeacherInfo(id) {
			if (confirm("你确定删除吗？")) {
				$.post("deleteteacher.html", {
					id : id
				}, function(data) {
					if(data){
					alert("删除成功");
					}else{
					alert("删除失败");
					}
					location.reload();
				});
			}
		}
		function exit(){
		location = "../login/exit.html"
		}
		
		function batchAdd(){
		var formData = new FormData();
		var filename=$("#batchAddInput").val();
		if(filename==null||filename==""){
			alert("上传条件不足！");
		}else{
		formData.append("file", $("#batchAddInput")[0].files[0]);
		$.ajax({
		    url: 'batchAddTeacher.html',
		    type: 'POST',
		    cache: false,
		    data: formData,
		    processData: false,
		    contentType: false,
			success: function(t) {
				alert(t);
			},
			error: function() {
				alert("上传错误！");
			}

		});
		}
  }
	</script>
</body>
</html>
