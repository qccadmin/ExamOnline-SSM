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

<title>考试安排</title>
<title>exam-manage</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/exam-summary.css">
<link rel="stylesheet" type="text/css" href="css/exam-manage.css">
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
				<li class="course child-menu"><i
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
				<li class="assessment nav-list-item-actived"><i
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
			class="icon ion-alert"></i> 公告：</span> <span id="notice">2018赣师大秋季软师报名进行中！</span>
		<span id="userName" class="m-r-10">上午好,${teacherName} <a href="../login/exit.html"> 退出</a></span>
		</header>
		<main>
		<div class="fliter row m-b-30">
			<div class="col-md-4">
				<span>条件筛选：</span>
				<button type="button" class="btn btn-default dropdown-toggle"
					id="btn1" data-toggle="dropdown">
					------- <span id="span1">请选择老师</span> ------- <span class="caret"></span>
				</button>
				<div class="row bgc-white fliter-box" id="fliterBox">
					<div class="year col-md-4" id="fliterListNav">
						<ul>
							<li class="list-item nav-actived" name='0'>老师姓名</li>
						</ul>
					</div>
					<div class="subject col-md-8" id="fliterList">
						<ul id="teacherId">
							<c:forEach items="${teachers}" var="t">
								<li class="list-item" value="${t.teacherId}">${t.teacherName }</li>
							</c:forEach>
						</ul>
						<script type="text/javascript">
							//获取子菜单节点数据
							$("#teacherId li")
									.click(
											function() {
												var index = $(this).index();
												var teacherId = $(
														"#teacherId li").eq(
														index).val();
												location = 'queryExamManageByTeacherId.html?teacherId='
														+ teacherId;

											})
						</script>
					</div>
				</div>
			</div>
			<div class="input-group col-md-4 col-md-offset-8">
				<input type="text" class="form-control" placeholder="请输入考试名">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button">搜索</button>
				</span>
			</div>
		</div>
		<link rel="stylesheet" type="text/css" href="css/lesson-info.css">
		<div class="content m-t-2">
			<table class="table-information m-t-10">
				<tbody>
					<tr class="title" style="background: rgb(223, 240, 216);">
						<td>课程号</td>
						<td>课程名</td>
						<td>试卷编号</td>
						<td>考试班级</td>
						<td>开课时间</td>
						<td>结束时间</td>
						<td>任课老师</td>
						<td>考试状态</td>
					</tr>
					<c:forEach items="${examPlans}" var="e">
						<tr style="background: rgb(252, 248, 227);">
							<td>${e.paperInfo.courseInfo.courseId}</td>
							<td>${e.paperInfo.courseInfo.courseName}</td>
							<td>${e.paperInfo.paperId}</td>
							<td>${e.classInfo.className}</td>
							<td>${e.startTime}</td>
							<td>${e.overTime}</td>
							<td>${e.paperInfo.courseInfo.teacherInfo.teacherName}</td>
							<td>
								<button type="button" id="start"
									onclick="startExam(${e.examplanId})"
									class="btn btn-primary btn-sm"
									<c:if test="${e.examState==2}">disabled="true"</c:if>>开始考试</button>
								<button type="button" id="end"
									onclick="endExam(${e.examplanId})"
									class="btn btn-default btn-sm"
									<c:if test="${e.examState==2}">disabled="true"</c:if>>结束考试</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">
				function startExam(id) {
					$.post("startExam.html", {
						examplanId : id
					}, function(data) {
						if (data == 1) {
							$("#start").attr('disabled', true);
							alert("考试已开始。。");
							window.location.reload();
						} else {
							alert("对不起，请重试。。");
							window.location.reload()
						}
					})
				}
				function endExam(id) {
					$.post("endExam.html", {
						examplanId : id
					}, function(data) {
						if (data == 1) {
							$("#end").attr('disabled', true);
							alert("考试已结束。。");
							window.location.reload();
						} else {
							alert("对不起，请重试。。");
							window.location.reload()
						}
					})
				}
			</script>
		</div>
		<div class="shadow" id="shadow"></div>
		<div class="change-exam" id="change-exam">
			<div class="exam-header clearfix">
				<span>1601软师考试</span> <i id="addClose" class="f-r">×</i>
			</div>
			<div class="change-exam-condition clearfix" id="change-exam-change">
				<div class="form-group clearfix">
					<label class="col-md-3 control-label" id="exam-btn1">考试类型</label>
					<div class="col-md-6">
						<select class="form-control" id="inputCourse">
							<option>公开考试</option>
							<option>个人考试</option>
						</select>
					</div>
				</div>
				<div class="form-group clearfix">
					<label class="col-md-3 control-label" id="exam-btn2">结束时间</label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="inputTime"
							value="2016-12-30">
					</div>
				</div>
				<div class="change-btn">
					<button type="button" class="btn btn-default" id="change-student">成员管理</button>
					<button type="button" class="btn btn-default" id="change-pro">试题管理</button>
					<button type="button" class="btn btn-default" id="change-enter">确认修改</button>
				</div>
			</div>
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
			function fenye(page) {
				var url = 'queryExamManage.html?page=' + page;
				location = url;
			}
		</script> </nav> </main>
		<footer> <strong class="m-l-20">Copyright © 2016 <a
			href="http://thoughtcoding.csxupt.com">赣师大计算机教育</a>.
		</strong> All rights reserved. </footer>
		<!-- right area end -->
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="myjs/exam-manage.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>

</body>

</html>
