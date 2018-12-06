<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta charset="UTF-8">
<title>赣师大在线考试管理系统</title>
<link rel="stylesheet" type="text/css" href="student/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="student/css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="student/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="student/css/common.css">


</head>

<body>
	<!--top menu-->
	<header> <img src="student/img/logo.jpg"> <strong>赣师大在线考试管理系统</strong>
	<div class="loginDiv">
		<a id="login" href="login/showlogin.html">登录</a>
	</div>
	</header>



	<!-- section area -->
	<div class="section col-md-10  clearfix">

		<div id="carousel-example-generic" class="carousel slide picture"
			data-ride="carousel">
			<!-- 轮播（Carousel）指标 -->
			<!--<ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>   -->
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner" role="listbox">
				<div class="item active pic_concent">
					<img src="student/img/sylb1.jpg" alt="First slide">
					<div class="carousel-caption">标题 1</div>
				</div>
				<div class="item pic_concent">
					<img src="student/img/sylb2.jpg" alt="Second slide">
					<div class="carousel-caption">标题 2</div>
				</div>
				<div class="item pic_concent">
					<img src="student/img/sylb3.jpg" alt="Third slide">
					<div class="carousel-caption">标题 3</div>
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<div class="explain">
			<h2>使用须知</h2>
			<h4>1.欢迎使用赣师大考试系统，请使用报名提供的学号和密码登录</h4>
			<h4>2.首次登陆请修改密码，方可继续使用</h4>
			<h4>3.忘记学号和密码请联系管理员</h4>
		</div>
	</div>
	<!-- section area end -->

	<div class="footer">
		<strong class="footer m-l-20">Copyright © 2016 <a
			href="http://thoughtcoding.csxupt.com">赣师大计算机教育</a>.All rights
			reserved.
		</strong>
	</div>


	<script type="text/javascript" src="student/js/jquery.min.js"></script>
	<script type="text/javascript" src="student/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="student/js/common.js"></script>
	<script>
		
	</script>
</body>
</html>
