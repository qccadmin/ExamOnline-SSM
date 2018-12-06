<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>题库管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/common.css">

<!--题库管理的css-->
<link rel="stylesheet" href="css/subject-library.css" type="text/css" />

</head>

<body class="row">

	<!-- left area -->
	<div class="left col-md-2">
		<aside>
		<div class="welcome t-c">
			<strong>赣师大在线考试管理系统</strong>
		</div>
		<ul class="f-16">
			<a href="queryExamPlain.html" class="side-menu-color">
				<li><i class="icon ion-navicon-round f-18 m-r-10"></i> 考试概况 <span
					class="icon ion-android-radio-button-off f-r f-13"></span></li>
			</a>
			<li class="side-menu-color" id="course"><i
				class="icon ion-ios-list-outline f-18 m-r-10"></i> 课程管理 <span
				class="icon ion-ios-arrow-back f-r f-18"></span></li>
			<a href="searchExamPlan.html" class="side-menu-color">
				<li class="course"><i
					class="icon ion-ios-arrow-forward f-18 m-r-10"></i> 课程信息 <span
					class="icon ion-android-checkbox-outline f-r f-18"></span></li>
			</a>
			<a href="subject-library.html" class="side-menu-color">
				<li class="course nav-list-item-actived"><i
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
			class="icon ion-alert"></i> 公告：</span>
		<span id="notice">2018赣师大秋季软师报名进行中！</span> <span id="userName"
			class="m-r-10">上午好!${teacherName } <a href="../login/exit.html"> 退出</a></span> </header>
		<main>
		<div id="top-nav" class="m-b-20">
			<ol class="breadcrumb">
				<li><a href="#">课程管理</a></li>
				<li class="active">题库管理</li>
			</ol>
		</div>
		<!--筛选课程下拉框-->
		<div class="clearfix">
			<div class="fliter row">
				<div class="clearfix col-md-3">
					<button type="button" class="btn btn-default f-l m-r-10"
						id="topic-add-btn">
						<i class="ion-plus-round"></i>
					</button>
					<button type="button" class="btn btn-default f-l m-r-10"
						id="topic-adda-btn">
						<i class="ion-ios-plus-outline"></i>
					</button>
					<!--<button type="button" class="btn btn-default f-l m-r-10" id="topic-lead-btn"><i class="fa fa-share"></i></button>
                    <button type="button" class="btn btn-default f-l m-r-10" id="topic-delete-btn"><i class="ion-ios-trash-outline"></i></button>-->
				</div>
				<div class="col-md-4 select-subject">
					<span>筛选条件</span>
					<button type="button" class="btn btn-default dropdown-toggle"
						id="btn1" data-toggle="dropdown">
						------- <span id="span1">请选择考试场次</span> ------- <span
							class="caret"></span><input type="hidden" value="" id="rainieppz"/>
					</button>
					<div class="row bgc-white fliter-box" id="fliterBox">
						<div class="year col-md-4" id="fliterListNav">
							<ul>
								<c:forEach items="${course }" var="co">
								<li class="list-item" value='${co.courseId }'>${co.courseName }</li>
								</c:forEach>
<!-- 								<li class="list-item" name='2'>php</li> -->
<!-- 								<li class="list-item" name='3'>c</li> -->
<!-- 								<li class="list-item" name='4'>h5</li> -->
							</ul>
						</div>
						<div class="subject col-md-8" id="fliterList">
							<ul>
<!-- 								<li class="list-item" value="0">java删库跑路</li> -->
<!-- 								<li class="list-item" value="1">java删库跑路</li> -->
<!-- 								<li class="list-item" value="2">java删库跑路</li> -->
<!-- 								<li class="list-item" value="3">java删库跑路</li> -->
							</ul>
					<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
					<script type="text/javascript">
					$("#fliterListNav ul li").click(function(){
						var index=$(this).index();
						$("#fliterListNav ul li").removeClass("nav-actived");
						$("#fliterListNav ul li").eq(index).addClass("nav-actived");
						$.getJSON("seachPaperByCourseID.html",{index:$("#fliterListNav ul li").eq(index).val()},function(json){
// 							console.log(json);
							var str="";
							for(i=0;i<json.length;i++){
								str+="<li class='list-item' value='"+json[i].paperId+"'>"+ json[i].paperName + "</li>";
							}
							$("#fliterList ul").html(str);
						});
					});
					</script>
						</div>
					</div>

				</div>
				<div class="input-group col-md-5">
					<input type="text" class="form-control" placeholder="请输入题目">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">搜索</button>
					</span>
				</div>
			</div>
		</div>
		<!-- 题目信息 -->
		<table class="table table-hover t-c m-t-20" id="subject">
			<thead>
				<tr>
					<th class="clearfix col-md-1 t-c">题目序号</th>
					<th class="col-md-1 t-c">题目类型</th>
					<th class="col-md-1 t-c">题目内容</th>
					<th class="col-md-1 t-c">题目解析</th>
					<th class="col-md-1 t-c">题目分数</th>
					<th class="col-md-1 t-c">操作</th>
				</tr>

			</thead>
			<tbody>
<!-- 				<c:forEach items="json" var="j"> -->
<!-- 				<tr> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td><a class="btn btn-primary btn-xs" data-toggle="modal" -->
<!-- 						data-target="#customerEditDialog">修改</a> <a -->
<!-- 						class="btn btn-danger btn-xs">删除</a></td> -->
<!-- 				</tr> -->
<!-- 				</c:forEach> -->
			</tbody>
		</table>
		<input type="hidden" id="deleteValue" value=""/>
		<nav class="block">
		<ul class="pagination">
<!-- 			<li><span href="#">&laquo;</span></li> -->
<!-- 			<li><span href="#">1</span></li> -->
<!-- 			<li><span href="#">2</span></li> -->
<!-- 			<li><span href="#">3</span></li> -->
<!-- 			<li><span href="#">4</span></li> -->
<!-- 			<li><span href="#">5</span></li> -->
<!-- 			<li><span href="#">&raquo;</span></li> -->
		</ul>
		</nav> <!-- 添加题目弹出框 -->
		<div id="topic-add-subject" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close ion-ios-close"
							data-dismiss="modal">
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">添加题目</h4>
					</div>
					<form action="" class="form-horizontal clearfix top-p-l-0 m-t-20"
						role="form">
						<label for="" class="col-md-3 control-label">请选择题目类型：</label> <label
							class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio1" value="option1">填空题
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio2" value="option2">单选题
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio3" value="option3">多选题
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio4" value="option3">判断题
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio5" value="option3">简答题
						</label>
					</form>
					<div class="modal-body clearfix">
						<textarea class="form-control" name="" id="" cols="70" rows="10"></textarea>
						<form action="" class="form-horizontal clearfix top-p-l-0 m-t-20"
							role="form">
							<label for="" class="col-md-3 control-label">选择课程：</label>
							<div id="" class="input-group col-lg-8 select-subject">
								<input id="selectSub" type="text" class="form-control" value="">
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										课程<span class="caret"></span>
									</button>
									<ul class="dropdown-menu dropdown-menu-right" role="menu">
										<li><a href="#">全部</a></li>
										<li><a href="#">软师</a></li>
										<li><a href="#">程序员</a></li>
										<li><a href="#">前端</a></li>
										<li><a href="#">java</a></li>
									</ul>
								</div>
								<!-- /btn-group -->
							</div>
							<!-- /input-group -->
						</form>
					</div>
					<form action="" class="form-horizontal clearfix" role="form">
						<div class="form-group">
							<label for="inputanswer" class="col-sm-2 control-label">答案:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="inputanswer">
							</div>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">保存</button>
						<button type="button" class="btn btn-primary">取消</button>
					</div>
				</div>
			</div>
		</div>
		<!--批量添加课程弹出框-->
		<div id="topic-adda-subject" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close ion-ios-close"
							data-dismiss="modal">
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">批量添加题目</h4>
					</div>
					<div class="modal-body clearfix">
						<div class="form-group">
							<label for="edit_custLevel"
								style="float: left; padding: 7px 15px 0 27px;">上传试题</label> <input
								type="file" style="display:inline-block" /> <span>请按模板导入</span>
							<span><a href="mubanExcel.html">下载导入模板</a></span>
						</div>

						<div class="form-group">
							<label for="edit_custLevel"
								style="float: left; padding: 7px 15px 0 27px;">课程考卷</label>
							<div class="col-sm-8" style="padding-left: 0px;">
								<select class="form-control" id="edit_custLevel"
									name="cust_level">
									<option value="0" selected="selected">---请选择---</option>
									<option value="1">java入门删库考试</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消上传</button>
						<button type="button" class="btn btn-primary">上传题目</button>
					</div>
				</div>
			</div>
		</div>
		<!--导入功能弹出框-->
		<div id="topic-lead-subject" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close ion-ios-close"
							data-dismiss="modal">
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">添加题目</h4>
					</div>
					<div class="modal-body clearfix">
						<form action="" class="form-horizontal clearfix top-p-l-0 m-t-20"
							role="form">
							<label for="dtp_input2" class="col-md-4 control-label">选择要导入的课程：</label>
							<div class="input-group col-lg-8 select-subject">
								<input type="text" class="form-control" value="">
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										课程<span class="caret"></span>
									</button>
									<ul class="dropdown-menu dropdown-menu-right" role="menu">
										<li><a href="#">全部</a></li>
										<li><a href="#">软师</a></li>
										<li><a href="#">程序员</a></li>
										<li><a href="#">前端</a></li>
										<li class="divider"></li>
										<li><a href="#">java</a></li>
									</ul>
								</div>
								<!-- /btn-group -->
							</div>
							<!-- /input-group -->
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">保存</button>
						<button type="button" class="btn btn-primary">取消</button>
					</div>
				</div>
			</div>
		</div>

		<!--删除功能弹出框-->
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

		<!--修改题目弹出框-->
		<div id="topic-error" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改题目信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="edit_customer_form">
							<input type="hidden" id="updateTitid" name="titleId" />
							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">题目名称</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="titleStem" id="updatetitname" cols="70" rows="2"
										placeholder="题目名称" style="resize:none;"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">选项A</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="optionA"
										placeholder="选项A" name="optionA">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">选项B</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="optionB"
										placeholder="选项B" name="optionB">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">选项C</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="optionC"
										placeholder="选项C" name="optionC">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">选项D</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="optionD"
										placeholder="选项D" name="optionD">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">正确选项</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="answerRight"
										placeholder="正确选项" name="answerRight">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">题目解析</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="analyze" id="analyze" cols="70" rows="2"
										placeholder="题目解析" style="resize:none;"></textarea>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							关闭</button>
						<button type="button" class="btn btn-primary"
							onclick="updateCustomer()">保存修改</button>
					</div>

				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<!--修改题目弹出框-->
		<div id="topic-modify-subject" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close ion-ios-close"
							data-dismiss="modal">
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">修改题目</h4>
					</div>
					<div class="modal-body clearfix">
						<textarea class="form-control" name="" id="" cols="70" rows="10"></textarea>
					</div>
					<p>请输入答案</p>
					<input type="text" class="form-control">
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">保存</button>
						<button type="button" class="btn btn-primary">取消</button>
					</div>
				</div>
			</div>
		</div>
		</main>
		<footer> <strong class="m-l-20">Copyright © 2016 <a
			href="http://thoughtcoding.csxupt.com">赣师大计算机教育</a>.
		</strong> All rights reserved. </footer>
		<!-- right area end -->
	</div>
	<script type="text/javascript" src="js/jquery.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"
		charset="UTF-8"></script>
	<script type="text/javascript" src="js/subject-library.js"
		charset="UTF-8"></script>

	<!--<script src="src/js/common.js"></script>
<script src="src/js/subject-library-all.js"></script>
<script src="src/js/subject-library-add.js"></script>
<script src="src/js/subject-library-delete.js"></script>
<script src="src/js/subject-library-lead.js"></script>
<script src="src/js/subject-library-modify.js"></script>
<script src="src/js/subject-library-select.js"></script>-->

</body>
</html>
