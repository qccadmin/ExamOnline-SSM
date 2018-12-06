<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function fenye(page) {
		var queryName = '${queryName}';
		var choose = '${choose}';
		if ((queryName == '' || queryName == undefined || queryName == null)
				&& choose == 0) {
			var url = 'studentmanage.html?page=' + page + '&choose=' + choose;
			location = url;
		} else {
			var url = 'queryStudentInfolist.html?page=' + page + '&queryName='
					+ queryName + '&choose=' + choose;
			location = url;
		}
	}
</script>
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
			<!-- 教师 -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header" style="display: inline-block;">学生管理</h1>
					<a class="btn btn-primary btn-sm" data-toggle="modal"
						data-target="#batchAddStudent"
						style="float: right;margin-top: 50px;margin-right: 10px;">批量添加</a>
					<a class="btn btn-primary btn-sm" data-toggle="modal"
						data-target="#addStudentOne"
						style="float: right;margin-top: 50px;margin-right: 24px;">添加学生</a>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="queryStudentInfolist.html"
						method="post">

						<div class="form-group">
							<label for="queryName"> 学生名称 </label> <input type="text"
								class="form-control" id="queryName" name="queryName"
								value="${queryName}">
						</div>

						<div class="form-group">
							<label for="choose"> 所属班级 </label> <select class="form-control"
								id="choose" name="choose">
								<option value="0">--请选择--</option>
								<c:forEach items="${classAll}" var="ca">
									<option value="${ca.classId}"
										<c:if test="${ca.classId == choose}"> 
										selected</c:if>>
										${ca.className}</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">学生信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped"
							style="text-align: center;height: 38px;">
							<thead>
								<tr>
									<th>学生ID</th>
									<th>学生姓名</th>
									<th>学生密码</th>
									<th>所属班级</th>
									<th>出生日期</th>
									<th>所在学校</th>
									<th>家庭住址</th>
									<th>联系电话</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${studentInfoList}" var="sil">
									<tr>
										<td>${sil.studentId }</td>
										<td>${sil.studentName}</td>
										<td>${sil.studentPwd}</td>
										<td>${sil.classInfo.className}</td>
										<td>${sil.birthday}</td>
										<td>${sil.school}</td>
										<td>${sil.address}</td>
										<td>${sil.phone}</td>
										<td><a class="btn btn-primary btn-xs" data-toggle="modal"
											data-target="#StudentInfoEditDialog"
											onclick="editStudentInfo(${sil.studentId})">修改</a> <a
											class="btn btn-danger btn-xs"
											onclick="deleteStudentInfo(${sil.studentId})">删除</a></td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="6" align="center">当前页数：${p.page }&nbsp;&nbsp;&nbsp;&nbsp;
										<a onclick="fenye(1)">首页</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
										onclick="fenye(${p.shang})">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
										onclick="fenye(${p.xia})">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
										onclick="fenye(${p.pagecount})">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
										总页数：${p.pagecount}
									</td>
								</tr>
							</tbody>

						</table>
						<div class="col-md-12 text-right">
							<itcast:page
								url="${pageContext.request.contextPath }/customer/list.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
	</div>


	<!-- 学生编辑对话框 -->
	<div class="modal fade" id="StudentInfoEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改学生信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_StudentInfo_form">
						<input type="hidden" id="edit_studentId" name="studentId" />
						<%-- <div class="form-group">
							<label for="edit_class"
								style="float: left; padding: 7px 15px 0 27px;"> 所属班级 </label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_class"
									name="classInfo.classId">
									<option value="0">--请选择--</option>
									<c:forEach items="${classAll}" var="ca">
										<option value="${ca.classId}"<c:if test="${item.cid == qc.hangye}"> selected</c:if>>
											${ca.className}</option>
									</c:forEach>
								</select>
							</div>
						</div> --%>
						<div class="form-group">
							<label for="edit_studentName"
								style="float: left; padding: 7px 15px 0 27px;"> 学生姓名 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studentName"
									placeholder="学生姓名" name="studentName">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studentPwd"
								style="float: left; padding: 7px 15px 0 27px;"> 学生密码 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studentPwd"
									placeholder="学生密码" name="studentPwd">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_birthday"
								style="float: left; padding: 7px 15px 0 25px;">出生日期 </label>
							<div class="control-group">
								<div class="controls input-append date form_date" data-date=""
									data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input size="16" id="edit_birthday" name="birthday" type="text"
										value="2018-11-01" readonly> <span class="add-on"><i
										class="icon-remove"></i></span> <span class="add-on"><i
										class="icon-th"></i></span>
								</div>
								<input type="hidden" id="dtp_input2" value="" /><br />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_school"
								style="float: left; padding: 7px 15px 0 27px;"> 所在学校 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_school"
									placeholder="所在学校" name="school">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_address"
								style="float: left; padding: 7px 15px 0 27px;"> 家庭住址 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_address"
									placeholder="家庭住址" name="address">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_phone"
								style="float: left; padding: 7px 15px 0 27px;"> 联系电话 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_phone"
									placeholder="联系电话" name="phone">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateStudentInfo()">保存修改</button>
				</div>
			</div>

		</div>
	</div>
	<!--
        	作者：ly
        	时间：2018-10-29
        	描述：添加学生对话框
        -->

	<div class="modal fade" id="addStudentOne" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" style="display: none;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加学生</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="insert_student_form"
						autocomplete="off">
						<%-- <div class="form-group">
							<label for="insert_Class"
								style="float: left; padding: 7px 15px 0 27px;"> 所属班级 </label>
							<div class="col-sm-10">
								<select class="form-control" id="insert_Class"
									name="classInfo.classId">
									<option value="0">--请选择--</option>
									<c:forEach items="${classAll}" var="ca">
										<option value="${ca.classId}"<c:if test="${item.cid == qc.hangye}"> selected</c:if>>
											${ca.className}</option>
									</c:forEach>
								</select>
							</div>
						</div> --%>

						<div class="form-group">
							<label for="insert_StudentName"
								style="float: left; padding: 7px 15px 0 27px;"> 学生姓名 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="insert_StudentName"
									placeholder="学生姓名" name="studentName">
							</div>
						</div>
						<div class="form-group">
							<label for="insert_StudentPwd"
								style="float: left; padding: 7px 15px 0 27px;"> 学生密码 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="insert_StudentPwd"
									placeholder="学生密码" name="studentPwd">
							</div>
						</div>
						<div class="form-group">
							<label for="insert_birthday"
								style="float: left; padding: 7px 15px 0 25px;">出生日期 </label>
							<div class="control-group">
								<div class="controls input-append date form_date1" data-date=""
									data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input size="16" id="insert_birthday" name="birthday"
										type="text" value="2018-11-01" readonly> <span
										class="add-on"><i class="icon-remove"></i></span> <span
										class="add-on"><i class="icon-th"></i></span>
								</div>
								<input type="hidden" id="dtp_input2" value="" /><br />
							</div>
						</div>
						<div class="form-group">
							<label for="insert_school"
								style="float: left; padding: 7px 15px 0 27px;"> 所在学校 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="insert_school"
									placeholder="所在学校" name="school">
							</div>
						</div>
						<div class="form-group">
							<label for="insert_address"
								style="float: left; padding: 7px 15px 0 27px;"> 家庭住址 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="insert_address"
									placeholder="家庭住址" name="address">
							</div>
						</div>
						<div class="form-group">
							<label for="insert_phone"
								style="float: left; padding: 7px 15px 0 27px;"> 联系电话 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="insert_phone"
									placeholder="联系电话" name="phone">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="insertStudent()">确认增加</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="batchAddStudent" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close ion-ios-close"
							data-dismiss="modal">
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">批量添加学生</h4>
					</div>
					<div class="modal-body clearfix">
						<div class="form-group">
							<label for="edit_custLevel"
								style="float: left; padding: 7px 15px 0 27px;">上传</label> 
								<input id = "batchAddInput"type="file" style="display:inline-block" /> <span>请按模板导入</span>
							<span><a href="mubanStudentExcel.html">下载导入模板</a></span>
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
	<script src="js/sb-admin-2.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
	<!-- 教师编辑对话框 -->
	<script type="text/javascript">
		$('.form_date').datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
		$('.form_date1').datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
		function insertStudent() {
			$.post("insertstudent.html", $("#insert_student_form").serialize(),
					function(data) {
						if(data){
						alert("添加成功");
						}else{
						alert("添加失败");
						}
						
						location.reload();
					});
		}

		function editStudentInfo(id) {
			$.getJSON("toupdatestudent.html", {
				id : id
			}, function(data) {
				$("#edit_studentId").val(data.studentId);
				$("#edit_studentName").val(data.studentName);
				$("#edit_studentPwd").val(data.studentPwd);
				$("#edit_birthday").val(data.birthday);
				$("#edit_school").val(data.school);
				$("#edit_address").val(data.address);
				$("#edit_phone").val(data.phone);
			});
		}
		function updateStudentInfo(id) {
			$.post("updatestudent.html", $("#edit_StudentInfo_form")
					.serialize(), function(data) {
				if(data){
				alert("修改成功");
				}else{
				alert("修改失败");
				}
				location.reload();
			});
		}

		function deleteStudentInfo(id) {
			if (confirm("你确定删除吗？")) {
				$.post("deletestudent.html", {
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
		    url: 'batchAddStudent.html',
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
