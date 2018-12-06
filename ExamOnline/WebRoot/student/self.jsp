<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>新卓越考试系统欢迎您</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="新卓越考试系统">
	
	<link rel="stylesheet" type="text/css" href="student/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="student/css/ionicons.min.css">
	<link rel="stylesheet" type="text/css" href="student/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="student/css/common.css">
	<style type="text/css">
 		.title {
 			font-size: 18px;
 		}
 		.label-val {
 			cursor: pointer;
 		}
 	</style>
  </head>
  
  <body>
   <!--top menu-->
	<header>
		<img src="student/img/logo.jpg">
		<strong>新卓越在线考试管理系统</strong>
        <ul class="nav nav-tabs myTab-all" role="tablist" id="myTab">
		  <li role="presentation"><a href="student/mytest.html" role="tab" data-toggle="tab">待考课程</a></li>
		  <li role="presentation"><a href="student/history.html" role="tab" data-toggle="tab">历史成绩</a></li>
		  <li role="presentation" class="active"><a href="student/self.html" role="tab" data-toggle="tab">个人信息</a></li>
		</ul>
        <span id="userName" class="m-r-10">您好,&nbsp;${student.studentName }&nbsp;<a href="student/exit.html">  退出</a></span>
	</header>
<!-- section area -->
<div class="section col-md-10  clearfix">


    	<div class="tab-content">

		  <div role="tabpanel" class="tab-pane fade panel panel-info  in active " id="home">
			<div class="panel-heading">
				<h3 class="panel-title">个人信息</h3>
			</div>
		  	<ul id="detailed" class="panel-body">
		  		<li>学号：<span id="stuId">${student.studentId }</span></li>
		  		<li>姓名：<span>${student.studentName }</span></li>
		  		<li>班级：<span>${student.classInfo.className }</span></li>
		  		<li>
		  	</ul>
		  	<center>
				<span class="title">登录密码: </span> <label class="label-val"
					val="${student.studentPwd }" id="sutdentPwd">******</label> <br />
			</center>
			</div>
		</div>
</div>

<!-- section area end -->

<!--footer area-->
<div  class="footer">
    	<strong class="footer m-l-20">Copyright © 2018 <a href="http://www.baidu.com">新卓越计算机教育</a>.All rights reserved.</strong>
</div>

<!-- js引入 -->
<script type="text/javascript" src = "student/js/jquery.min.js"></script>
<script src="student/js/jquery.js"></script>
<script src="student/js/zeroModal/zeroModal.min.js"></script>
<script src="student/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript">
    	$(function() {
    		$("#sutdentPwd").mouseover(function() {
    			$(this).text($(this).attr("val"));
    		}).mouseout(function() {
    			$(this).text("******");    			
    		}).click(function() {
    			$(this).replaceWith("<input onblur='resetPwd(this)' id='resetPwd' type='text'></input>");
    		});
    	});
    	
    	function resetPwd(t) {
    		$.ajax({
    			type: "POST",
    			url: "student/reset/"+$(t).val()+"/"+$("#stuId").text()+".html",
    			success: function(data) {
    				if(data == "t") {
    					alert("密码修改成功");
    					$("#resetPwd").replaceWith('<label class="label-val" id="sutdentPwd"></label>');
    					$("#sutdentPwd").text($(t).val());
    				} else {
    					alert("修改失败");
    				}
    			}
    		});
    	}
    </script>
</body>
</html>
