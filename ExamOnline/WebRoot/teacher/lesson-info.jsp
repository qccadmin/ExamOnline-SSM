<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/teacher/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">

<meta charset="UTF-8">
<title>赣师大考试安排</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/lesson-info.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body class="row">

	<!-- left area -->
	<div class="left col-md-2">
		<aside>
		<div class="welcome t-c">
			<strong>赣师大考试安排</strong>
		</div>
		<ul class="f-16">
			<a href="queryExamPlain.html" class="side-menu-color">
				<li><i class="icon ion-navicon-round f-18 m-r-10"></i> 考试概况 <span
					class="icon ion-android-radio-button-off f-r f-13"></span></li>
			</a>
			<li class="side-menu-color" id="course">
						<i class="icon ion-ios-list-outline f-18 m-r-10"></i> 课程管理
						<span class="icon ion-ios-arrow-back f-r f-18"></span>
					</li>
			<a href="searchExamPlan.html" class="side-menu-color">
				<li class="course  nav-list-item-actived"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 课程信息 <span
					class="icon ion-android-checkbox-outline f-r f-18"></span></li>
			</a>
			<a href="subject-library.html" class="side-menu-color">
				<li class="course"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 题库管理 <span
					class="icon ion-android-list f-r f-18"></span></li>
			</a>
			<li class="side-menu-color" id="assessment"><i
				class="icon ion-android-done-all f-18 m-r-10"></i>考核管理 <span
				class="icon ion-ios-arrow-back f-r f-18"></span></li>
			<a href="queryExamManage.html" class="side-menu-color">
				<li class="assessment child-menu"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 考试管理 <span
					class="icon ion-ios-calculator f-r f-18"></span></li>
			</a>
			<a href="queryMemberManage.html" class="side-menu-color">
				<li class="assessment child-menu"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 成员管理 <span
					class="icon ion-ios-personadd f-r f-18"></span></li>
			</a>
			<li id="grade" class="side-menu-color"><i
				class="icon ion-calculator f-18 m-r-10"></i> 成绩管理 <span
				class="icon ion-ios-arrow-back f-r f-18"></span></li>
			<a href="exam-grade.html" class="side-menu-color">
				<li class="grade child-menu"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 考试成绩 <span
					class="icon ion-android-done-all f-r f-18"></span></li>
			</a>
			<a href="grade-details.html" class="side-menu-color">
				<li class="grade child-menu"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 成绩明细 <span
					class="icon ion-android-funnel f-r f-18"></span></li>
			</a>
		</ul>
		</aside>
	</div>
	<!-- left area end -->

	<!-- right area -->
	<div class="right col-md-10 f-r">
		<header> <span class="notice-body"><i
			class="icon ion-alert"></i> 公告：</span> <span id="notice">2018赣师大在线考试火热报名中。。。</span>
		<span id="userName" class="m-r-10">上午好,${teacherName} <a href="../login/exit.html"> 退出</a></span>
		</header>
		<main>
		<div id="information">
			<div class="heading clearfix" id="nav">
				<h4 class="f-l">
					考试安排 <small>查看考试信息</small>
				</h4>
				<ol class="breadcrumb f-r">
					<li><a href="lesson-info.html">添加考试</a></li>
					<li class="active">考试安排</li>
				</ol>
			</div>
			<div class="row">
				<button class="btn btn-default col-md-1" id="add">
					<i class="fa fa-plus">添加考试安排</i>
				</button>
				<div class="col-md-6 search">
					<input type="text" id="search" placeholder="请输入课程编号/课程名/学时/老师">
					<button class="btn btn-default" id="searchBtn">搜索</button>
				</div>
			</div>
			<div class="content m-t-2">
				<table class="table-information m-t-10">
					<tr class="title">
						<td>课程号</td>
						<td>课程名</td>
						<td>试卷编号</td>
						<td>考试班级</td>
						<td>任课老师</td>
						<td>考试人数</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${examPlans}" var="e">
						<tr>
							<td>${e.paperInfo.courseInfo.courseId}</td>
							<td>${e.paperInfo.courseInfo.courseName}</td>
							<td>${e.paperInfo.paperId}</td>
							<td>${e.classInfo.className}</td>
							<td>${e.paperInfo.courseInfo.teacherInfo.teacherName}</td>
							<td>400</td>
							<td><i class="fa fa-trash-o cur-p delete" onclick="deletePlan(${e.examplanId})"></i></td>
						</tr>
					</c:forEach>
				</table>
				<script type="text/javascript">
					function deletePlan(id){
						var examplanId = id;
						$.post("deleteExamPlan.html",{examplanId:examplanId},function(data){
							if (data == 1) {
								alert("删除成功");
								window.location.reload();
							} else {
								alert("删除失败");
								window.location.reload()
							}
						})
					}
				</script>
			</div>
		</div>
		<div class="addcourse" id="addCourse">
			<center>
				<h3>考试安排</h3>
				<br /> <br /> <br />
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="col-md-6">
							<h4>创建试卷</h4>
							<form class="form-horizontal">
								<div class="controls">
									试卷名称：<input id="paperName" type="text" placeholder="请输入试卷名称" />
								</div>
								<div class="controls">
									<div class="form-group">
										所属课程： <select class="selectpicker" id="courseId">
											<c:forEach items="${courses}" var="c">
												<option  value="${c.courseId}">${c.courseName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="controls">
									<button type="button" onclick="create()"
										class="btn btn-primary">创建试卷</button>
								</div>
							</form>
							<script type="text/javascript">
								function create() {
									var paperName = $("#paperName").val();
									var courseId = $("#courseId").val();
									$.post("addPaperInfo.html", {
										"paperName" : paperName,
										"courseInfo.courseId" : courseId
									}, function(data) {
										if (data == 1) {
											alert("创建成功");
											window.location.reload();
										} else {
											alert("创建失败");
											window.location.reload()
										}
									})
								}
							</script>
						</div>
						<div class="col-md-6">
							<h4>创建考试安排</h4>
							<form class="form-horizontal">
								<div class="controls">
									<div class="form-group">
										考试试卷： <select class="selectpicker" id="paperId" >
											<c:forEach items="${papers}" var="p">
												<option  value="${p.paperId}">${p.paperName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="controls">
									<div class="form-group">
										考试班级：
										<c:forEach items="${classes}" var="c">
											<input type="checkbox" name="tempString" value="${c.classId}">${c.className}
										</c:forEach>
									</div>
									<div class="controls">
										<button type="button" onclick="plan()" class="btn btn-primary">安排考试</button>
									</div>
							</form>
							<script type="text/javascript">
								function plan() {
									var bb = "";
									var temp = "";
									var a = document
											.getElementsByName("tempString");
									for (var i = 0; i < a.length; i++) {
										if (a[i].checked) {
											temp = a[i].value;
											bb = bb + "," + temp;
										}
									}
									var tempString = bb.substring(1, bb.length);
									var paperId = $("#paperId").val();
									$.post("addExamPlan.html", {
										paperId : paperId,
										tempString : tempString
									}, function(data) {
										if (data != 0) {
											alert("创建成功");
											window.location.reload();
										} else {
											alert("创建失败");
											window.location.reload();
										}
									});
								}
							</script>
						</div>
					</div>
				</div>
				<br> <br> <br> <br> <br>
			</center>
		</div>
		<div class="filterform">
			<table id="table-filterform"></table>
			<button class="btn btn-default back">返回全部列表</button>
		</div>
		<nav>
		<ul class="pagination">
			<li><a onclick="fenye(${p.shang})">&laquo;</a></li>
			<c:forEach var="i" begin="1" end="${p.pagecount}" step="1">
				<li><a onclick="fenye(${i})"><c:out value="${i}" /></a></li>
			</c:forEach>
			<li><a onclick="fenye(${p.xia})">&raquo;</a></li>
		</ul>
		<script type="text/javascript">
			function fenye(page){
				var url = 'searchExamPlan.html?page='+page;
				location=url;
			}
		</script>
		</nav> 
		</main>
		<footer> <strong class="m-l-20">Copyright © 2016 <a
			href="http://thoughtcoding.csxupt.com">赣师大计算机教育</a>.
		</strong> All rights reserved. </footer>
		<!-- right area end -->
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/lesson-info.js" charset="GB2312"></script>
	<script type="text/javascript" src="js/ajax.js" charset="GB2312"></script>
</body>

</html>
