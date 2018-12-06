<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/student/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>正在考试。。。</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/base.css" rel="stylesheet" type="text/css">
<link href="css/mcen-top.css" rel="stylesheet" type="text/css">
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="css/tk_navleft.css" rel="stylesheet" type="text/css">
<link href="css/side2.css" rel="stylesheet" type="text/css">
<link href="css/practice.css" rel="stylesheet" type="text/css">
<link href="css/p_dis.css" rel="stylesheet" type="text/css">
<link href="css/moni-paper.css" rel="stylesheet" type="text/css">
<link href="css/ui-dialog.css" rel="stylesheet" type="text/css">
<link href="css/common.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/pub-dialog.css">

<!-- <script type="text/javascript" charset="utf-8" defer="" async="" -->
<!-- 	src="js/tongji.js"></script> -->



</head>

<body >
	<div class="pracontent clearfix">
		<div class="ui-progress f-shadow clearfix">
			<div id="m__ruleInfo" class="ui-progress-sub" data-spy="scroll"
				data-target=".navbar-example">
				<div class="navBox">
					<a href="../exam/${paperId }/kaoshi.html#choose" class="btn this" data-ruleid="1747372">单项选择题</a>
					<a href="../exam/${paperId }/kaoshi.html#fill" class="btn" data-ruleid="1747373">多项选择题</a> <a
						href="../exam/${paperId }/kaoshi.html#mistake" class="btn" data-ruleid="1747374">判断题</a> <a
						href="../exam/${paperId }/kaoshi.html#design" class="btn" data-ruleid="1747375">简答题</a>
				</div>
			</div>
		</div>
		<div class="dopra-con clearfix">
			<div class="pra-left-con pra-right-font16">
				<!-- 练习做题-->
				<form action="../exam/score.html" method="post" id="myExam">
				<input type="hidden" name="I" value="${paperId }" />
					<div id="questionModule" class="">
						<c:forEach items="${list[first]}" var="first" varStatus="STATUS">
							<c:choose>
								<c:when test="${STATUS.index ==0}">
									<div class="m__ruleTitle" data-ruleid="1747372">
										<div id="choose" class="m-secpart">一、单项选择题</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
						<ul class="m__ruleQuest" data-ruleid="1747372" id="dx1747372"
							data-loadstate="notget">
							<c:forEach items="${list[first]}" var="first" varStatus="STATUS">
								<li style="" id="danx${STATUS.index}"><input type="hidden"
									name="a" id="danxInput${STATUS.index}" value="" /> <input
									type="hidden" name="t" value="${first.titleId}">
									<div class="subject-con bor clearfix m-question "
										data-examid="3940668" data-examtype="1" data-rulesid="1747372"
										data-answer="C" data-useranswer="" data-orderid="1" style="">
										<div class="subject-con">
											<div class="sub-content ">
												<i class="subjec-daan" style="display: none;"></i>
												<div class="sub-dotitle">
													<em>${STATUS.index+1 }</em> <i>[单项选择题]</i>${first.titleStem}
												</div>
												<dl class="sub-answer">
													<dd class="m-question-option " data-value="A">
														<i></i><span>A.</span>${first.optionA}
													</dd>
													<dd class="m-question-option " data-value="B">
														<i></i><span>B.</span>${first.optionB}
													</dd>
													<dd class="m-question-option " data-value="C">
														<i></i><span>C.</span>${first.optionC}
													</dd>
													<dd class="m-question-option " data-value="D">
														<i></i><span>D.</span>${first.optionD}
													</dd>
												</dl>
											</div>
										</div>
									</div></li>
							</c:forEach>
						</ul>
						<c:forEach items="${list[second]}" var="first" varStatus="STATUS">
							<c:choose>
								<c:when test="${STATUS.index ==0}">
									<div id="fill" class="m__ruleTitle" data-ruleid="1747373">
										<div class="m-secpart">二、多项选择题</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
						<ul class="m__ruleQuest" data-ruleid="1747373" id="dx1747373"
							data-loadstate="notget">
							<c:forEach items="${list[second]}" var="first" varStatus="STATUS">
								<li style="" id="duox${STATUS.index}"><input type="hidden"
									name="a" id="duoxInput${STATUS.index}" value="" /> <input
									type="hidden" name="t" value="${first.titleId}">
									<div class="subject-con bor clearfix m-question "
										data-examid="3940703" data-examtype="6" data-rulesid="1747373"
										data-answer="" data-useranswer="" data-orderid="41" style="">
										<div class="subject-con">
											<div class="sub-content ">
												<i class="subjec-daan" style="display: none;"></i>
												<div class="sub-dotitle">
													<em>${STATUS.index+1 }</em> <i>[多项选择题]</i>${first.titleStem}
												</div>
												<dl class="sub-answer">
													<dd class="m-question-option " data-value="A">
														<i></i><span>A.</span>${first.optionA}
													</dd>
													<dd class="m-question-option " data-value="B">
														<i></i><span>B.</span>${first.optionB}
													</dd>
													<dd class="m-question-option " data-value="C">
														<i></i><span>C.</span>${first.optionC}
													</dd>
													<dd class="m-question-option " data-value="D">
														<i></i><span>D.</span>${first.optionD}
													</dd>
												</dl>
											</div>
										</div>
									</div></li>
							</c:forEach>
						</ul>
						<c:forEach items="${list[third]}" var="first" varStatus="STATUS">
							<c:choose>
								<c:when test="${STATUS.index ==0}">
									<div id="mistake" class="m__ruleTitle" data-ruleid="1747374">
										<div class="m-secpart">三、判断题</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
						<ul class="m__ruleQuest" data-ruleid="1747374" id="pd1747374"
							data-loadstate="notget">
							<c:forEach items="${list[third]}" var="first" varStatus="STATUS">
								<li style="" id="pd${STATUS.index}"><input type="hidden"
									name="a" id="pdInput${STATUS.index}" value="" /> <input
									type="hidden" name="t" value="${first.titleId}">
									<div class="subject-con bor clearfix m-question "
										data-examid="3940704" data-examtype="7" data-rulesid="1747374"
										data-answer="" data-useranswer="" data-orderid="42" style="">
										<div class="subject-con">
											<div class="sub-content ">
												<i class="subjec-daan" style="display: none;"></i>
												<div class="sub-dotitle">
													<em>${STATUS.index+1 }</em> <i>[判断题]</i>${first.titleStem}
												</div>
												<dl class="sub-answer  ">
													<dd class="m-question-option " data-value="A">
														<i></i><span>1.</span>对
													</dd>
													<dd class="m-question-option " data-value="B">
														<i></i><span>2.</span>错
													</dd>
												</dl>
											</div>
										</div>
									</div></li>
							</c:forEach>
						</ul>
						<c:forEach items="${list[fourth]}" var="first" varStatus="STATUS">
							<c:choose>
								<c:when test="${STATUS.index ==0}">
									<div id="design" class="m__ruleTitle" data-ruleid="1747375">
										<div class="m-secpart">四、简答题</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
						<ul class="m__ruleQuest" data-ruleid="1747375"
							data-loadstate="notget">
							<c:forEach items="${list[fourth]}" var="first" varStatus="STATUS">
								<li style="" id="jd${STATUS.index}">
									<div class="subject-con bor clearfix m-question "
										data-examid="3940705" data-examtype="7" data-rulesid="1747375"
										data-answer="" data-useranswer="" data-orderid="43" style="">
										<div class="subject-con">
											<div class="sub-content ">
												<i class="subjec-daan" style="display: none;"></i>
												<div class="sub-dotitle">
													<em>${STATUS.index+1 }</em> <i>[简答题]</i>
												</div>
												<dl class="sub-answer vsub-mater-con">${first.titleStem}
												</dl>
												<div class="mater-respond" style="display:block;">
													<textarea placeholder="请在此输入您的答案"></textarea>
													<div class="mare-info">
														<div class="mater-resbtn">
															<a href="javascript:;" class="btn__ensure">确定</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- 题目切换栏 -->
					<div id="pageBar"></div>
			</div>
			<!--右侧设置-->
			<div class="pra-right-con">
				<div id="m__rightPart" class="pra-right-con-sub" style="">
					<div class="time-card f-mt20 bor">
						<div class="y-time">
							<div class="f-fl" id="timer"></div>
						</div>
						<!--答题卡区域-->
						<div class="rightArea-answer clear" style="position: relative;">
							<div id="answerCard">
								<div class="hd clearfix">
									<span class="title f-fl">答题卡 <span
										class="e__doneCount card-count"
										style="font-size: 12px;color: #F06000;margin-left: 10px">0/5</span></span>
								</div>
								<div class="bd clear" style="">

									<dl class="panel-item">
										<c:forEach items="${list[first]}" var="first"
											varStatus="STATUS">
											<c:choose>
												<c:when test="${STATUS.index ==0}">
													<dt>
														单项选择题<em></em>
													</dt>
												</c:when>
											</c:choose>
										</c:forEach>

										<dd class="panel-order">
											<c:forEach items="${list[first]}" var="first"
												varStatus="STATUS">
												<a href="../exam/${paperId }/kaoshi.html#danx${STATUS.index}";
													class="e__answerCard page-card-item " data-orderid="1">${STATUS.index+1 }</a>
											</c:forEach>
										</dd>
									</dl>

									<dl class="panel-item">
										<c:forEach items="${list[second]}" var="first"
											varStatus="STATUS">
											<c:choose>
												<c:when test="${STATUS.index ==0}">
													<dt>
														多项选择题题<em></em>
													</dt>
												</c:when>
											</c:choose>
										</c:forEach>
										<dd class="panel-order">
											<c:forEach items="${list[second]}" var="first"
												varStatus="STATUS">
												<a href="../exam/${paperId }/kaoshi.html#duox${STATUS.index}"
													class="e__answerCard page-card-item " data-orderid="41">${STATUS.index+1 }</a>
											</c:forEach>
										</dd>
									</dl>
									<dl class="panel-item">
										<c:forEach items="${list[third]}" var="first"
											varStatus="STATUS">
											<c:choose>
												<c:when test="${STATUS.index ==0}">
													<dt>
														判断题<em></em>
													</dt>
												</c:when>
											</c:choose>
										</c:forEach>

										<dd class="panel-order">
											<c:forEach items="${list[third]}" var="first"
												varStatus="STATUS">
												<a href="../exam/${paperId }/kaoshi.html#pd${STATUS.index}"
													class="e__answerCard page-card-item " data-orderid="42">${STATUS.index+1 }</a>
											</c:forEach>
										</dd>
									</dl>
									<dl class="panel-item">
										<c:forEach items="${list[fourth]}" var="first"
											varStatus="STATUS">
											<c:choose>
												<c:when test="${STATUS.index ==0}">
													<dt>
														简答题<em></em>
													</dt>
												</c:when>
											</c:choose>
										</c:forEach>

										<dd class="panel-order">
											<c:forEach items="${list[fourth]}" var="first"
												varStatus="STATUS">
												<a href="../exam/${paperId }/kaoshi.html#jd${STATUS.index}"
													class="e__answerCard page-card-item " data-orderid="43">${STATUS.index+1 }</a>
											</c:forEach>
										</dd>
									</dl>

								</div>
							</div></form>
							<div class="cad-color clear">
								<div class="panel-order-notice panel-notice-t">
									<em>已做</em><i class="a doit"></i> <em>未做</em><i
										class="a normal"></i>
								</div>
							</div>
							<div class="ft">
								<div class="btn">
									<a href="javascript:void(0)" class="btn__submit">交卷</a>
								</div>
							</div>
						</div>
						<div id="lala" style="position: absolute;right: 77px;top: 25px;">
			<h1><span style="color: red;font-size:24px;" id="time">考试开始！</span></h1>	
			<input type="hidden" id="counttinme" value="1800"/>
		</div>
			
						<!--答题卡区域 end-->
					</div>
				</div>
			</div>
			<!--右侧设置 end-->
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/jqform.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/chooseDa.js"></script>
	
<script>
				setInterval("hahha()",1000);
				function hahha(){
					var time=$("#counttinme").val();
					var shi=parseInt(time/3600); console.log(time/3600);
					var fen=parseInt((time-shi*3600)/60);console.log((time-shi*3600)/60);
					var miao=parseInt(parseInt((time-parseInt(time/3600)*3600)%60));
					if(miao<0){
						miao=00
					}
					$("#time").html("0"+shi+":"+fen+":"+miao);
					$("#counttinme").val(time-1);
				}
				setInterval("zptijiao()",1000*60*30+1500);
				function zptijiao(){
					$("#myExam").submit();
				}
			</script>
	
</body>
</html>
