<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/teacher/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>考试管理</title>
<meta charset="UTF-8">
<title>exam-summary</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/exam-summary.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
				<li class="nav-list-item-actived"><i
					class="icon ion-navicon-round f-18 m-r-10"></i> 考试概况 <span
					class="icon ion-android-radio-button-off f-r f-13"></span></li>
			</a>
			<li class="side-menu-color" id="course"><i
				class="icon ion-ios-list-outline f-18 m-r-10"></i> 课程管理 <span
				class="icon ion-ios-arrow-back f-r f-18"></span></li>
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
		<span id="userName" class="m-r-10">上午好,${teacherName} <a
			href="../login/exit.html"> 退出</a></span> </header>
		<main>
		<div class="heading clearfix m-b-30">
			<h4 class="f-l">
				考试概况 <small>查看和管理考试概况</small>
			</h4>

		</div>
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
												location = 'queryExamPlainByTeacherId.html?teacherId='
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
		<ul class="main-content clearfix m-t-30">
			<c:forEach items="${summaryList}" var="s">
				<li><a href="#" onclick="return false"> <!--<a href="exam-summary-detail.html">-->
						<i class="fa fa-file-code-o f-60  m-b-10"></i>
						<p class="f-18 which-class">${s.paperInfo.paperName}</p>
						<p class="f-16 which-teacher">${s.classInfo.className}</p> <c:choose>
							<c:when test="${s.examState==0}">
								<p class="f-16 exam-condition">考试未开始</p>
							</c:when>
							<c:when test="${s.examState==2}">
								<p class="f-16 exam-condition">考试已结束</p>
							</c:when>
							<c:otherwise>
								<p class="f-16 exam-condition">考试正在进行</p>
							</c:otherwise>
						</c:choose>
				</a>
			</c:forEach>
		</ul>
		</main>
		<footer> <strong class="m-l-20">Copyright © 2016 <a
			href="http://thoughtcoding.csxupt.com">赣师大计算机教育</a>.
		</strong> All rights reserved. </footer>
		<!-- right area end -->
	</div>
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
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="myjs/exam-summary.js"></script>

	<script>
		//$(function(){
		//				$.ajax({
		//					type:'get',
		//					url:"##",
		//					scriptCharset:'utf-8',
		//					async:true,
		//					dataType:"json",
		//					success:function(a){
		//						console.log(a);
		//						var data=JSON.parse(a);
		//
		//						for(var i in data){
		//
		//							$('<tr></tr>').appendTo($('table'));
		//							$('table tr:last').html('<td class="user-name"></td><td class="mac-addr"></td>');
		//							$('table tr:last td:nth-of-type(1)').html(i);
		//							$('table tr:last td:nth-of-type(2)').html(data[i]);
		//							console.log(i);
		//
		//						}
		//					}
		//				})
		//			})
	</script>
</body>

</html>