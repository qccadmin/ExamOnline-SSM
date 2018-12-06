<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>学生首页</title>
<link rel="stylesheet" type="text/css"
	href="student/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="student/css/ionicons.min.css">
<link rel="stylesheet" type="text/css"
	href="student/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="student/css/common.css">
<style type="text/css">
.yangshi{
font-size: 18px;
color: #644;
position: relative;
top: 45%;
text-align: center;
}


</style>

</head>

<body>
	<!--top menu-->
	<header> <img src="student/img/logo.jpg"> <strong>赣师大在线考试管理系统</strong>
	<ul class="nav nav-tabs myTab-all" role="tablist" id="myTab">

		<li role="presentation" class="active"><a href="#myClass"
			onclick="fun()" role="tab" data-toggle="tab">我的课程</a></li>
		<!--  <li role="presentation"><a href="#test" role="tab" data-toggle="tab">待考课程</a></li> -->
		<li role="presentation"><a href="#history" onclick="history()"
			role="tab" data-toggle="tab">历史成绩</a></li>
		<li role="presentation"><a href="#home" role="tab"
			data-toggle="tab">个人信息</a></li>
	</ul>

	<span id="userName" class="m-r-10">上午好,&nbsp;${student.studentName }&nbsp;
		<a href="login/exit.html" onclick="choose()"> 退出</a>
	</span> </header>



	<!-- section area -->
	<div class="section col-md-10  clearfix">


		<div class="tab-content">



			<div role="tabpanel" class="tab-pane panel panel-info fade in active"
				id="myClass">
				<c:forEach items="${examPlans}" var="e">
					<div class="four">
						<i class="icon ion-ios-locked-outline "></i>
						<h3><span class="yangshi">${e.paperInfo.paperName }</span></h3>
						<h3>${e.paperInfo.courseInfo.teacherInfo.teacherName }</h3>
						<h3>${e.startTime}</h3>
						<h3>
							考试状态
							<c:choose>
								<c:when test="${e.examState==0}">
									<span>待考考试</span>
								</c:when>
								<c:when test="${e.examState==2}">
									<span>考试结束</span>
								</c:when>
								<c:otherwise>
									<span>正在考试</span>
								</c:otherwise>
							</c:choose>
						</h3>
						<c:if test="${e.examState==2}">
						<button  type="button" disabled="disabled" class="btn btn-info" data-toggle="modal"
							data-target="#myModal" onclick="firstKey(${e.paperInfo.paperId })">开始考试</button>
						</c:if>
						<c:if test="${e.examState!=2}">
						<button type="button" class="btn btn-info" data-toggle="modal"
							data-target="#myModal" onclick="firstKey(${e.paperInfo.paperId })">开始考试</button>
						</c:if>
						
					</div>
				</c:forEach>
			</div>

			<%-- 		
			<div role="tabpanel" class="tab-pane panel panel-info fade" id="test">
				
				<c:forEach items="${examPlans}" var="e">
				<div >
					<i class="icon ion-ios-locked-outline "></i>
					<h3>${e.paperInfo.paperName }</h3>
					<p>
						已有<span>.....</span>练习
					</p>
					<button type="button" class="btn btn-info" data-toggle="modal"
						data-target="#myModal">start</button>
				</div>
				</c:forEach>

				
			</div> --%>

			<div role="tabpanel" class="tab-pane fade panel panel-info "
				id="history">
				<table class="history-table table table-striped">
					<thead>
						<tr>
							<th>考试</th>
							<th>状态</th>
							<th>成绩</th>
							<th>课程</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>




			<div role="tabpanel" class="tab-pane fade panel panel-info "
				id="home">
				<div class="panel-heading">
					<h3 class="panel-title">个人信息</h3>
				</div>
				<ul id="detailed" class="panel-body">
					<li>学号：<span id="stuId">${ sessionScope.student.studentId}</span></li>
					<li>姓名：<span>${ sessionScope.student.studentName}</span></li>
					<li>班级：<span>${ sessionScope.student.classInfo.className}</span></li>
				</ul>
				<center>
					<span class="title">登录密码: </span> <label class="label-val"
						val="${sessionScope.student.studentPwd}" id="sutdentPwd">******</label> <br />
				</center>
			</div>
		</div>
	</div>
	<!--考试说明提醒模态框-->

	<!-- 按钮触发模态框 -->

	<!-- 模态框（Modal） -->
	<div class="modal fade" style="z-index: 100;" id="myModal"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">考试说明</h4>
				</div>
				<div class="modal-body">
					您讲参加的是2018年的c语言考试，此次考试限时2小时，超时将自动提交。请合理分配考试时间。</div>
				<div class="modal-body">
					<h4>选择题：</h4>
					<p>分为单选题呵不定项题，单选题选对得分， 不定项题全对得分，漏选扣分，选错不得分。</p>
				</div>
				<div class="modal-body">
					<h4>简答题：</h4>
					<p>请将思考过程及结果输入，只有结果不得分，可以以照片形式上传验算过程。</p>
				</div>
				<div class="modal-body">
					<h4>编程题：</h4>
					<p>请写出实现程序的完整代码，编程语言不限。</p>
				</div>

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">题型分布</h4>
				</div>
				<div class="modal-body">
					<ul class="modal-body-topic">
						<li>选择题：20题 每题5分</li>
						<li>简答题：2题 每题20分</li>
						<li>编程题：3题 每题20分</li>
					</ul>
				</div>


				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<input type="hidden" id="qcc" value="" />
					<button type="button" class="btn btn-primary" onclick="kaoshi()">
						<a href="javascript:;"
							style="display: block; width: 100%; height: 4%;">开始考试</a>
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!-- section area end -->

	<!--footer area-->
	<div class="footer">
		<strong class="footer m-l-20">Copyright © 2018 <a
			href="http://thoughtcoding.csxupt.com">赣师大计算机教育</a>.All rights
			reserved.
		</strong>
	</div>

	<script type="text/javascript" src="student/js/jquery.min.js"></script>
	<!-- <script type="text/javascript" src="student/js/jquery.js"></script> -->
	<script type="text/javascript"
		src="student/js/zeroModal/zeroModal.min.js"></script>
	<script type="text/javascript"
		src="student/js/bootstrap/bootstrap.min.js"></script>
	<!-- <script type="text/javascript" src = "student/js/jquery.min.js"></script> -->
	<script type="text/javascript" src="student/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="student/js/common.js"></script>
	<!-- <script type="text/javascript" src="student/js/zeroModal/zeroModal.min.js"></script> -->
	<script>
		$(function() {
			$('#myTab a:first').tab('show')
		})

		$('#myTab a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')

		})
		var oMyTab = document.getElementById('myTab');

		var aLi = oMyTab.getElementsByTagName('li');
		//for(var i=0; i<aLi.length;i++)
		//{
		//	aLi[i].index = i;
		//	aLi[i].onclick = function(){
		//		for(var j=0;j<aLi.length;j++)
		//		if(this.index==j)
		//		{
		//			aLi[j].style.display = 'block';
		//		}
		//		else{
		//			aLi[j].style.display = 'none';
		//		}
		//	}
		//}
		function choose() {
			var msg = '确定退出吗？请确定';
			if (confirm(msg) == true) {
				return true;
			} else {
				return false;
			}
		}

		$(function() {
			$("#sutdentPwd")
					.mouseover(function() {
						$(this).text($(this).attr("val"));
					})
					.mouseout(function() {
						$(this).text("******");
					})
					.click(
							function() {
								$(this)
										.replaceWith(
												"<input onblur='resetPwd(this)' id='resetPwd' type='text'></input>");
							});
		});

		$(function(){
			$.ajax({
				type : "POST",
				url : "history.html",
				success : function(data) {
					var str = "";
					var json = $.parseJSON(data);
					var i;
					console.log(json);
					for (i = 0; i < json.length; i++) {
						str = str + "<tr><td><span>" + json[i].paperInfo.paperName
								+ "</span></td>" + "<td>已考试</td>" + "<td><span>"
								+ json[i].sumSco + "</span></td><td><span>"
								+ json[i].paperInfo.courseInfo.courseName
								+ "</span></td></tr>";
						$("#history table tbody").html(str);
					}

				}
			});
		});
		function resetPwd(t) {
			$
					.ajax({
						type : "POST",
						url : "student/reset/" + $(t).val() + "/"
								+ $("#stuId").text() + ".html",
						success : function(data) {
							if (data == "t") {
								alert("密码修改成功");
								$("#resetPwd")
										.replaceWith(
												'<label class="label-val" id="sutdentPwd">******</label>');
								$("#sutdentPwd").text($(t).val());
							} else {
								alert("修改失败");
							}
						}
					});
		}
	</script>
	<!-- <script type="text/javascript"> -->
	<!-- 	var name=${name}; -->
	<!-- 	$("#myClass").removeClass("in"); -->
	<!-- 	$("#myClass").removeClass("active"); -->
	<!-- </script> -->
	<script type="text/javascript">
		function fun() {
			var url = "student/examPlan.html"
			location = url;
		}
		
		var msg="${exammsg}";
		if(msg!=""){
			alert(msg);
		}
		function kaoshi() {
// 			$.post("exam/kaoshi.html",{paperId:$("#qcc").val()},function(data){
// 				document.write(data); 
// 			});
			var url = "exam/"+$("#qcc").val()+"/kaoshi.html";
			location = url;
		}
		
		function firstKey(val){
			$("#qcc").val(val)
		}</script>
		</body>
		</html>
	