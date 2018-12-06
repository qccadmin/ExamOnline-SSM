<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>后台管理模板页</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/grade-details.css">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body class="row">
	<div class="left col-md-2">
		<aside>
		<div class="welcome t-c">
			<strong>赣师大在线考试管理系统</strong>
		</div>
		<ul class="f-16">
			<a href="queryExamPlain.html" class="side-menu-color"><li><i
					class="icon ion-navicon-round f-18 m-r-10"></i> 考试概况 <span
					class="icon ion-android-radio-button-off f-r f-13"></span></li></a>
			<li class="side-menu-color" id="course"><i
				class="icon ion-ios-list-outline f-18 m-r-10"></i> 课程管理 <span
				class="icon ion-ios-arrow-back f-r f-18"></span></li>
			<a href="searchExamPlan.html" class="side-menu-color"><li
				class="course child-menu"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 课程信息 <span
					class="icon ion-android-checkbox-outline f-r f-18"></span></li></a>
			<a href="subject-library.html" class="side-menu-color"><li
				class="course child-menu"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 题库管理 <span
					class="icon ion-android-list f-r f-18"></span></li></a>
			<li class="side-menu-color" id="assessment"><i
				class="icon ion-android-done-all f-18 m-r-10"></i>考核管理 <span
				class="icon ion-ios-arrow-back f-r f-18"></span></li>
			<a href="queryExamManage.html" class="side-menu-color"><li
				class="assessment child-menu"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 考试管理 <span
					class="icon ion-ios-calculator f-r f-18"></span></li></a>
			<a href="queryMemberManage.html" class="side-menu-color"><li
				class="assessment child-menu"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 成员管理 <span
					class="icon ion-ios-personadd f-r f-18"></span></li></a>
			<li id="grade" class="side-menu-color"><i
				class="icon ion-calculator f-18 m-r-10"></i> 成绩管理 <span
				class="icon ion-ios-arrow-back f-r f-18"></span></li>
			<a href="exam-grade.html" class="side-menu-color"><li
				class="grade"><i class="icon ion-ios-arrow-forward f-18 m-r-10"></i>
					考试成绩 <span class="icon ion-android-done-all f-r f-18"></span></li></a>
			<a href="grade-details.html" class="side-menu-color"><li
				class="grade nav-list-item-actived"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 成绩明细 <span
					class="icon ion-android-funnel f-r f-18"></span></li></a>
		</ul>
		</aside>
	</div>
	<!-- left area end -->

	<!-- right area -->
	<div class="right col-md-10 f-r">
		<header> <span class="notice-body"><i
			class="icon ion-alert"></i> 公告：</span>
		<span id="notice">2018赣师大秋季软师报名进行中！</span> <span id="userName"
			class="m-r-10">上午好,${teacherName }  <a href="../login/exit.html"> 退出</a></span> </header>
		<main>
		<div class="heading clearfix">
			<h4 class="f-l">
				考试成绩 <small>增删改查成绩</small>
			</h4>
			<ol class="breadcrumb f-r">
				<li><a href="exam-summary">考试概况</a></li>
				<li><a href="grade-details">成绩管理</a></li>
				<li class="active">成绩管理</li>
			</ol>
		</div>
		<!-- top：sreach-infors and operations -->
		<div class="opr  m-c clearfix">
			<!--  search infors  -->
			<div class="col-md-2 m-r-10" id="downScoreExcel">
<!-- 				<button class="btn-grade"><i class="fa fa-download cur-p"></i></button> -->
			</div>
			<div class="col-md-4 m-r-10">
				<!--f-l m-r-10-->
				<span>条件筛选：</span>
				<button type="button" class="btn btn-default dropdown-toggle"
					id="btn1" data-toggle="dropdown">
					------- <span id="span1">请选择考试</span> ------- <span class="caret"></span>
				</button>
				<div class="row bgc-white fliter-box" id="fliterBox">
					<!--                     <div class="year col-md-4" id="fliterListNav"> -->
					<!--                         <ul> -->
					<!--                             <li class="list-item nav-actived" name='0'>最近</li> -->
					<!--                             <li class="list-item" name='1'>2017</li> -->
					<!--                             <li class="list-item" name='2'>2016</li> -->
					<!--                             <li class="list-item" name='3'>2015</li> -->
					<!--                             <li class="list-item" name='4'>2014</li> -->
					<!--                         </ul> -->
					<!--                     </div> -->
					<div class="subject col-md-12" id="fliterList">
						<ul>
							<c:forEach items="${list }" var="l">
								<li class="list-item" value="${l.paperId }">${l.paperName }</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
<!-- 			<div class="search-box col-md-4 f-r"> -->
<!-- 				<input type="text" id="searchText" placeholder="请输入学号/姓名/考试名称" -->
<!-- 					class="f-l"> -->
<!-- 				<button id='search' class="btn-grade f-l">搜索</button> -->
<!-- 			</div> -->
			<!--   operations   -->
		</div>

		<!--grade-table-->
		<div class="grade-table  clearfix m-t-30">
		<input type="hidden" id="rainieppz" value=""/>
			<table id="table1" class="table table-hover table-bordered m-t-20"
				contenteditable="false" border="1" bordercolor="#000000"
				width="100%" cellpadding="0" cellspacing="0" align="center";>
				<tbody>
					<tr>
						<th>学号</th>
						<th>姓名</th>
						<th>考试名称</th>
						<th>成绩</th>
						<th>删除</th>
					</tr>
				</tbody>
			</table>
			<nav class="block">
			<ul class="pagination" id="page">
<!-- 				<li><span href="#">&laquo;</span></li> -->
<!-- 				<li><span href="#">1</span></li> -->
<!-- 				<li><span href="#">2</span></li> -->
<!-- 				<li><span href="#">3</span></li> -->
<!-- 				<li><span href="#">4</span></li> -->
<!-- 				<li><span href="#">5</span></li> -->
<!-- 				<li><span href="#">&raquo;</span></li> -->
			</ul>
			<script>
				
			</script>
			</nav>
			<div id="box" class="clearfix">
				<p>
					<strong>学号：</strong><span></span>
				</p>
				<p>
					<strong>姓名：</strong><span></span>
				</p>
				<p>
					<strong>考试名称：</strong><span></span>
				</p>
				<p>
					<strong>成绩：</strong><input type="text">
				</p>
				<div class="btnBox">
					<button value="取消" class="btn btn-primary f-l">取消</button>
					<button value="确认" class="btn btn-primary f-r">确认</button>
				</div>
			</div>
			<div id="mask"></div>
		</div>
		</main>
		<footer> <strong class="m-l-20">Copyright © 2016 <a
			href="http://thoughtcoding.csxupt.com">赣师大计算机教育</a>.
		</strong> All rights reserved. 
		</footer>
		<div id="topic-delete-subject" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close ion-ios-close"
							data-dismiss="modal">
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">删除题目</h4>
					</div>
					<div class="modal-body clearfix">确认删除吗？</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
						<button type="button" class="btn btn-primary">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/grade-details.js"></script>
</body>
</html>
