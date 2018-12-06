<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/manage/";
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
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/i18n/defaults-zh_CN.min.js"></script>
	<script type="text/javascript">
 		function fenye(page){
    	var queryName = '${queryName}';
	
	        if (queryName == '' || queryName == undefined || queryName == null) {
	            var url = 'classmanage.html?page='+page;
				location = url;
	        } else {
	           var url = 'classmanage.html?page='+page+'&queryName='+queryName;
				location = url;
	        }
	    }
	    
	    $(document).ready(function () {
	    	var queryName = '${queryName}';
	    	$("#queryName").val(queryName);
	     });
 		</script>
  </head>
  
  <body>
  <div id="wrapper">
			<!-- Navigation -->
			<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
					<a class="navbar-brand" href="index.html">一组在线考试管理员系统</a>
				</div>
				<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">管理员已登录</a>
					</li>
					<li class="dropdown"><button type="button" class="btn btn-default" onclick = "exit()">
							退出登录</button></li>
				</ul>

				<div class="navbar-default sidebar" role="navigation">
					<div class="sidebar-nav navbar-collapse">
						<ul class="nav" id="side-menu">
							<li class="sidebar-search">
							</li>
							<li>
								<a target="_self" href="index.html" target = "right"><i class="fa fa-edit fa-fw"></i>教师管理</a>
							</li>
							<li>
								<a target="_self" href="classmanage.html" ><i class="fa fa-dashboard fa-fw"></i>班级管理</a>
							</li>
							<li>
								<a target="_self" href="studentmanage.html" ><i class="fa fa-dashboard fa-fw"></i>学生管理</a>
							</li>
						</ul>
					</div>
					<!-- /.sidebar-collapse -->
				</div>
				<!-- /.navbar-static-side -->
			</nav>
			<div id="page-wrapper2">
				<!-- 教师 -->
				<div class="row">
				<!-- 班级管理 -->
					<div class="col-lg-12">
						<h1 class="page-header" style="display: inline-block;">
							班级管理
						</h1>
						<!-- <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#ClassInfoEditDialog" style="float: right;margin-top: 50px;margin-right: 10px;">批量添加</a> -->
						<a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addClassOne" style="float: right;margin-top: 50px;margin-right: 24px;">添加班级</a>
					</div>
				</div>
				<!-- /.row -->
				<div class="panel panel-default">
				<!-- 班级查询 -->
					<div class="panel-body">
						<form class="form-inline" action="queryClassInfolist.html" method="post">
							<div class="form-group">
								<label for="queryName">
									班级名称
								</label>
								<input type="text" class="form-control" id="queryName" name="queryName" value = "${queryName}">
							</div>
							<button type="submit" class="btn btn-primary">
								查询
							</button>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								班级信息列表
							</div>
							<!-- /.panel-heading -->
							<table class="table table-bordered table-striped" style="text-align: center;height: 38px;">
								<thead>
									<tr>
										<th>
											班级ID
										</th>
										<th>
											班级名称
										</th>
										<th>
											班级人数
										</th>
										<th>
											操作
										</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items = "${classInfoList}" var = "cil">
									<tr>
										<td>
											${cil.classId}
										</td>
										<td>
											${cil.className }
										</td>
										<td>
											${cil.classSize}
										</td>
										<td>
										
											<a class="btn btn-primary btn-xs"onclick="editClassInfo(${cil.classId})">修改</a> 
											<a class="btn btn-danger btn-xs" onclick="deleteClassInfo(${cil.classId})">删除</a>
										
										</td>
									</tr>
									</c:forEach>
										<tr>
										<td colspan="6" align="center">

											当前页数：${p.page }&nbsp;&nbsp;&nbsp;&nbsp;
											<a onclick="fenye(1)">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a onclick="fenye(${p.shang})">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a onclick="fenye(${p.xia})">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a onclick="fenye(${p.pagecount})">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp; 总页数：${p.pagecount}
										</td>
									</tr>
								</tbody>
							</table>
							<div class="col-md-12 text-right">
								<itcast:page url="${pageContext.request.contextPath }/customer/list.action" />
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-12 -->
				</div>
			</div>
			</div>
			
		<!-- 班级编辑对话框 -->
		<div class="modal fade" id="ClassInfoEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							修改班级信息
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="edit_ClassInfo_form">
							<input type="hidden" id="edit_classId" name="classId" />
							<div class="form-group">
								<label for="edit_className" class="col-sm-2 control-label">
									班级名称
								</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_className" placeholder="班级名称" name="className">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							关闭
						</button>
						<button type="button" class="btn btn-primary" onclick="updateClassInfo()">
							保存修改
						</button>
					</div>
				</div>
			</div>
		</div>
		<!--
        	作者：ly
        	时间：2018-10-29
        	描述：添加班级对话框
        -->
		<div class="modal fade" id="addClassOne" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							添加班级
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="insert_class_form">
							<div class="form-group">
								<label for="insert_ClassName" style="float: left; padding: 7px 15px 0 27px;">
									班级名称
								</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="insert_ClassName" placeholder="班级名称" name="className">
								</div>
							</div>
							<div class="form-group">
								<label for="teacherGroup" style="float: left; padding: 7px 15px 0 27px;">
									老师选择
								</label>
								<select class="selectpicker" id="teacherGroup" multiple data-live-search="true" data-selected-text-format="count > 3">
								     <c:forEach items = "${TeacherInfoList}" var = "til">
										<option value="${til.teacherId }">${til.teacherId }-${til.teacherName}</option>
									</c:forEach>                           
								</select>
							</div>
							<div class="form-group">
								<label for="studentGroup" style="float: left; padding: 7px 15px 0 27px;">
									学生选择
								</label>
								<select class="selectpicker" id="studentGroup" multiple data-live-search="true" data-selected-text-format="count > 3">
								    <c:forEach items = "${StudentInfoList}" var = "sil">
										<option value="${sil.studentId }">${sil.studentId }-${sil.studentName}</option>
									</c:forEach>                           
								</select>
							</div>	
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							关闭
						</button>
						<button type="button" class="btn btn-primary" onclick="insertClass()">
							确认增加
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- jQuery -->
		

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
			
			 function insertClass(){
			 var name = $("#insert_ClassName").val();
			 var teacherstr = "0,";
			 var addteacher = $("#teacherGroup").val();
			 if(addteacher!=null){
			 for(var i = 0;i<addteacher.length;i++){
			 	teacherstr = teacherstr+addteacher[i]+",";
			 }
			 }
			 
			  var studentstr = "0,";
			 var addstudent = $("#studentGroup").val();
			 if(addstudent!=null){
			 for(var i = 0;i<addstudent.length;i++){
			 	studentstr = studentstr+addstudent[i]+",";
			 }
			 }
				$.post("insertclass.html",{studentstr:studentstr,teacherstr:teacherstr,name:name},function (data){
				if(data){
				alert("添加成功");
				}else{
				alert("添加失败");
				}
				location.reload();
				});
			} 
			
			
			
			function editClassInfo(id) {
			$.post("toupdateclass.html",{id:id},function (data){
				location = "editclass.html?classId1="+data;
				});
			}
			
			function updateClassInfo(id){
				$.post("updateclass.html",$("#edit_ClassInfo_form").serialize(),function (data){
				location.reload();
				});
			}
			
			
			
			
			function deleteClassInfo(id){
			if(confirm("你确定删除吗？")){
				$.post("deleteclass.html",{id:id},function (data){
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
			
		</script>
  </body>
</html>
