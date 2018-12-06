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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/metisMenu.min.css" rel="stylesheet">
<link href="css/dataTables.bootstrap.css" rel="stylesheet">
<link href="css/sb-admin-2.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/boot-crm.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-select.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<script src="js/i18n/defaults-zh_CN.min.js"></script>
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
		<div id="page-wrapper2">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header" style="display: inline-block;">
						${className}管理</h1>
				</div>
			</div>
			<div>
				<center>
					<form id="edit_ClassInfo_form">
						<input type="hidden" id="edit_classId" name="classId" value = "${classId}"/>
						<div class="form-group">
							<label for="edit_className">班级名称</label> <input type="text"
								id="edit_className" placeholder="班级名称" name="className"
								value="${className}">
						</div>
						<div class="form-group">
							<label> 删除老师 </label> <select class="selectpicker"
								id="deleteTeacher" multiple data-live-search="true"
								data-selected-text-format="count > 3">
								<c:forEach items="${deleteTeacherList}" var="dtl">
									<option value="${dtl.teacherId }">${dtl.teacherId }-${dtl.teacherName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label> 添加老师 </label> <select class="selectpicker"
								id="addTeacher" multiple data-live-search="true"
								data-selected-text-format="count > 3">
								<c:forEach items="${addTeacherList}" var="atl">
									<option value="${atl.teacherId }">${atl.teacherId }-${atl.teacherName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label> 删除学生 </label> <select class="selectpicker"
								id="deleteStudent" multiple data-live-search="true"
								data-selected-text-format="count > 3">
								<c:forEach items="${deleteStudentList}" var="dsl">
									<option value="${dsl.studentId }">${dsl.studentId }-${dsl.studentName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label> 添加学生 </label> <select class="selectpicker"
								id="addStudent" multiple data-live-search="true"
								data-selected-text-format="count > 3">
								<c:forEach items="${addStudentList}" var="asl">
									<option value="${asl.studentId }">${asl.studentId }-${asl.studentName}</option>
								</c:forEach>
							</select>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" onclick = "exitmanage()">
							退出</button>
						<button type="button" class="btn btn-primary"
							onclick="updateClassInfo()">保存修改</button>
					</div>
				</center>
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
	<script src="js/sb-admin-2.js"></script>
	<script type="text/javascript">
		function updateClassInfo() {
			var cid = $("#edit_classId").val();
			var cname = $("#edit_className").val();
			var deleteteacherstr = "0,";
			var deleteteacher = $("#deleteTeacher").val();
			if(deleteteacher != null){
			for (var i = 0; i < deleteteacher.length; i++) {
				deleteteacherstr = deleteteacherstr + deleteteacher[i] + ",";
			}
			}
			var addteacherstr = "0,";
			var addteacher = $("#addTeacher").val();
			if(addteacher != null){
			for (var i = 0; i < addteacher.length; i++) {
				addteacherstr = addteacherstr + addteacher[i] + ",";
			}
			}
			var deletestudentstr = "0,";
			
			var deletestudent = $("#deleteStudent").val();
			if(deletestudent != null){
			for (var i = 0; i < deletestudent.length; i++) {
				deletestudentstr = deletestudentstr + deletestudent[i] + ",";
			}
			}

			var addstudentstr = "0,";
			var addstudent = $("#addStudent").val();
			if(addstudent != null){
				for (var i = 0; i < addstudent.length; i++) {
					addstudentstr = addstudentstr + addstudent[i] + ",";
				}
			}
			/* location = "updateclass.html?id="+cid+"&cname="+cname+"&deleteteacherstr="+deleteteacherstr+"&addteacherstr="+addteacherstr+"&deletestudentstr="+deletestudentstr+"&addstudentstr="+addstudentstr; */
		$.post("updateclass.html",{
			cid:cid,
			cname:cname,
			deleteteacherstr : deleteteacherstr,
			addteacherstr:addteacherstr,
			deletestudentstr:deletestudentstr,
			addstudentstr:addstudentstr
		},function (data){
				if(data){
					alert("修改成功");
					location = "classmanage.html"
				}else{
				alert("修改失败");
				}
				});
		}
		
		function exitmanage(){
		location = "classmanage.html"
		}
		
		function exit(){
		location = "../login/exit.html"
		}
		
	</script>
</body>
</html>
