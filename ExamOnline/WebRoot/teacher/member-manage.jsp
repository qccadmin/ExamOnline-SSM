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
<title>成员管理</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/member-manage.css">
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
				<li class="assessment child-menu"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 考试管理 <span
					class="icon ion-ios-calculator f-r f-18"></span></li>
			</a>
			<a href="queryMemberManage.html" class="side-menu-color">
				<li class="assessment nav-list-item-actived"><i
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
			class="icon ion-alert"></i> 公告：</span> <span id="notice">2016新卓越秋季软师报名进行中！</span>
		<span id="userName" class="m-r-10">上午好,${teacherName} <a href="../login/exit.html"> 退出</a></span>
		</header>
		<main>
		<div class="heading clearfix">
			<h4 class="f-l">
				成员管理 <small>查看考试成员</small>
			</h4>
			<ol class="breadcrumb f-r">
				<li><a href="exam-summer.html">考试概况</a></li>
				<li><a href="exam-mamage.html">考核管理</a></li>
				<li class="active">成员管理</li>
			</ol>
		</div>
		<div class="fliter row">
			<div class="col-md-4">
				<span>条件筛选：</span>
				<button type="button" class="btn btn-default dropdown-toggle"
					id="btn1" data-toggle="dropdown">
					------- <span id="span1">请选择班级</span> ------- <span class="caret"></span>
				</button>
				<div class="row bgc-white fliter-box" id="fliterBox">
					<div class="year col-md-4" id="fliterListNav">
						<ul>
							<li class="list-item nav-actived" name='0'>班级名字</li>
						</ul>
					</div>
					<div class="subject col-md-8" id="fliterList">
						<ul id="teacherId">
							<c:forEach items="${classes}" var="c">
								<li class="list-item" value="${c.classId}">${c.className}</li>
							</c:forEach>
						</ul>
						<script type="text/javascript">
						var classId;
							//获取子菜单节点数据
							$("#teacherId li")
									.click(
											function() {
												var index = $(this).index();
												var classId = $(
														"#teacherId li").eq(
														index).val();
												location = 'queryMemberById.html?classId='
														+ classId;
											})
						</script>
					</div>
				</div>
			</div>
			<div class="input-group col-md-4 col-md-offset-8">
				<input type="text" class="form-control" placeholder="请输入学号/姓名/课程">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button">搜索</button>
				</span>
			</div>
		</div>
		<div class="user-info-container">
			<table align="center" class="table table-hover table-bordered m-t-20"
				contenteditable="false">
				<thead>
					<tr>
						<th>考试名称</th>
						<th>学号</th>
						<th>姓名</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody id="userList">
					<c:forEach items="${examPlans}" var="e">
						<tr>
							<td>${e.paperName}</td>
							<td>${e.studentId}</td>
							<td>${e.studentName}</td>
							<c:choose>
								<c:when test="${e.examState==0}">
									<td>待考试</td>
								</c:when>
								<c:when test="${e.examState==1}">
									<td>已结束考试</td>
								</c:when>
								<c:otherwise>
									<td>正在考试</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<center>
			<ul class="pagination">  <%-- ${p.pagecount} --%>
				<li><a onclick="fenye(${p.shang})">&laquo;</a></li>
					<c:forEach var="i" begin="0" end="4" step="1">
						<li><a onclick="fenye(${p.page+i})"><c:out value="${p.page+i}"/></a></li>
					</c:forEach>
				<li><a onclick="fenye(${p.xia})">&raquo;</a></li>
			</ul>
			<script type="text/javascript">
				function fenye(page) {
					var teacherId ;
					//获取子菜单节点数据
					$("#teacherId li")
							.click(
									function() {
										var index = $(this).index();
										 teacherId = $(
												"#teacherId li").eq(
												index).val();
									})
					var url = 'queryMemberManage.html?page=' + page;
					if(teacherId!=null){
						url="&teacherId="+teacherId;
					}
					location = url;
				}
			</script> 
			</center>
		</div>

		</main>
		<footer> <strong class="m-l-20">Copyright © 2016 <a
			href="http:// www.xupt.edu.cn">赣师大计算机教育</a>.
		</strong> All rights reserved. </footer>
	</div>
	<!-- right area end -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/member-manage.js"></script>
</body>

</html>