<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript">
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}
</script>
<head>
<base href="<%=basePath%>">

<meta charset="UTF-8">
<title>登陆页面</title>
<link rel="stylesheet" type="text/css"
	href="student/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="student/css/ionicons.min.css">
<link rel="stylesheet" type="text/css"
	href="student/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="student/css/common.css">

</head>

<body>
	<!--top menu-->
	<header> <img src="student/img/logo.jpg"> <strong>赣师大在线考试管理系统</strong>
	</header>
	<!-- section area -->
	<div class="section col-md-10  clearfix">
		<div class="tab-content">
			<div class="ion-log-in1">
				<p class="p1">登陆</p>
				<form method="post" class="form-denglu" name="form-denglu"
					id="form-denglu">
					<input type="text" id="uid" placeholder="请输入学号"
						value="" name="uid"> <input type="password"
						id="upwd" placeholder="请输入密码" value=""
						name="upwd"> <input type="hidden" name="remFlag"
						id="remFlag" />
				</form>
				<center>
					<label class="radio-inline"> <input type="radio"
						name="inlineRadioOptions" id="inlineRadio1" value="option1">
						学生
					</label> <label class="radio-inline"> <input type="radio"
						name="inlineRadioOptions" id="inlineRadio2" value="option2">
						教师
					</label> <label class="radio-inline"> <input type="radio"
						name="inlineRadioOptions" id="inlineRadio3" value="option3">
						管理员
					</label> <br /> <br />
				</center>
				<form method="post" class="form-denglu" id="login1" name="login1">
					<input type="button" value="登陆" class="btn btn-info" id="denglu"
						onclick="mylogin()">
				</form>
				<input type="checkbox" id="inlineCheckbox1" value="option1" class="self-motion" onclick="remember()">
				 <span>下次自动登陆</span> 
				 <a href="#" class="gaimi">忘记密码？</a>
			</div>
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
		var oXuehao = document.getElementById('uid');
		var oMima = document.getElementById('upwd');
		var oDenglu = document.getElementById('denglu');
		var str = '';
		$('#inlineRadio1')
				.click(
						function() {
							if (oXuehao.value == "") {
								alert("请输入学号");
							} else if (oMima.value == "") {
								alert('请输入密码')
							}
							if (oXuehao.value && oMima.value) {
								str = '<input type="button"  value="登陆" class="btn btn-info" id="denglu" onclick="mylogin1()"/>'
								$("#login1").html(str);
							}
						})
		function mylogin1() {
			$.post("login/studentlogin.html", $("#form-denglu").serialize(),
					function(data) {
						if (data != "") {
							alert("登录成功");
							window.location.href = "student/examPlan.html";
						} else {
							alert("登录失败,请重新登录");
							window.location.href = "login/showlogin.html";
						}
					});
		}
		$('#inlineRadio2')
				.click(
						function() {
							if (oXuehao.value == "") {
								alert("请输入学号");
							} else if (oMima.value == "") {
								alert('请输入密码')
							}
							if (oXuehao.value && oMima.value) {
								str = '<input type="button"  value="登陆" class="btn btn-info" id="denglu" onclick="teachlogin()"/>'
								$("#login1").html(str);
							}
						})
		function teachlogin() {
			$
					.post(
							"login/teacherlogin.html",
							$("#form-denglu").serialize(),
							function(data) {
								if (data != "") {
									alert("登录成功");
									window.location.href = "teacher/queryExamPlain.html";
								} else {
									alert("登录失败,请重新登录");
									window.location.href = "login/showlogin.html";
								}
							});
		}
		$('#inlineRadio3')
				.click(
						function() {
							if (oXuehao.value == "") {
								alert("请输入学号");
							} else if (oMima.value == "") {
								alert('请输入密码')
							}
							if (oXuehao.value && oMima.value) {
								str = '<input type="button"  value="登陆" class="btn btn-info" id="denglu" onclick="mylogin3()"/>'
								$("#login1").html(str);
							}
						})
		function mylogin3() {
			$.post("login/adminlogin.html", $("#form-denglu").serialize(),
					function(data) {
						if (data != "") {
							alert("登录成功");
							window.location.href = "manage/index.html";
						} else {
							alert("登录失败,请重新登录");
							window.location.href = "login/showlogin.html";
						}
					});
		}
		//记住密码功能
		function remember(){
			var flag = $("input[type='checkbox']").is(':checked');
		    if(flag==true){ 
		        var makesure = confirm("您确定要记住密码吗?");
		        if(makesure){
		            $("#remFlag").val("1");
		        }else{
		            $("#remFlag").removeAttr('checked');
		            $("#remFlag").val("0");
		        }
		    }else{
		        $("#remFlag").val("0");
		    }
		}
		//显示记住密码后的内容
		$(document).ready(function(){
	        var str = getCookie("message");
	        str = str.substring(1,str.length-1);
	        var uid = str.split(",")[0];
	        var upwd = str.split(",")[1];
	        var choose = str.split(",")[2];
	        $("#uid").val(uid);
	        $("#upwd").val(upwd);
	        if (choose == "1") {//再次登录时默认为记住密码
				$("input[type='checkbox']").attr("checked","checked");
				 $("#remFlag").val("1");
			}
		});
	//获取cookie
	function getCookie(message) {
	    var umsg = message + "=";
	    var ca = document.cookie.split(';');
	    for(var i=0; i<ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0)==' ')
	        	c = c.substring(1);
	        if (c.indexOf(umsg) != -1)
	        	return c.substring(umsg.length, c.length);
	    }
	    return "";
	}
	</script>
</body>
</html>
