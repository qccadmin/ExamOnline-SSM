<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/teacher/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>考试成绩</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/ionicons.min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/exam-grade.css">

  </head>
  
  <body class="row">
<div class="left col-md-2">
    <aside>
        <div class="welcome t-c">
            <strong>赣师大在线考试管理系统</strong>
        </div>
        <ul class="f-16">
            <a href="queryExamPlain.html"  class="side-menu-color"><li>
                <i class="icon ion-navicon-round f-18 m-r-10"></i>  考试概况
                <span class="icon ion-android-radio-button-off f-r f-13"></span>
            </li></a>
            <li  class="side-menu-color" id="course">
                <i class="icon ion-ios-list-outline f-18 m-r-10"></i>  课程管理
                <span class="icon ion-ios-arrow-back f-r f-18"></span>
            </li>
            <a href="searchExamPlan.html" class="side-menu-color"><li class="course child-menu">
                <i class="icon ion-ios-arrow-forward f-18 m-r-10"></i>  课程信息
                <span class="icon ion-android-checkbox-outline f-r f-18"></span>
            </li></a>
            <a href="subject-library.html"  class="side-menu-color"><li class="course child-menu">
                <i class="icon ion-ios-arrow-forward f-18 m-r-10"></i>  题库管理
                <span class="icon ion-android-list f-r f-18"></span>
            </li></a>
            <li class="side-menu-color" id="assessment">
                <i class="icon ion-android-done-all f-18 m-r-10"></i>考核管理
                <span class="icon ion-ios-arrow-back f-r f-18"></span>
            </li>
            <a href="queryExamManage.html"  class="side-menu-color"><li class="assessment child-menu">
                <i class="icon ion-ios-arrow-forward f-18 m-r-10"></i>  考试管理
                <span class="icon ion-ios-calculator f-r f-18"></span>
            </li></a>
            <a href="queryMemberManage.html"  class="side-menu-color"><li class="assessment child-menu">
                <i class="icon ion-ios-arrow-forward f-18 m-r-10"></i>  成员管理
                <span class="icon ion-ios-personadd f-r f-18"></span>
            </li></a>
            <li id="grade"  class="side-menu-color">
                <i class="icon ion-calculator f-18 m-r-10"></i>  成绩管理
                <span class="icon ion-ios-arrow-back f-r f-18"></span>
            </li>
            <a href="exam-grade.html"  class="side-menu-color"><li class="grade nav-list-item-actived">
                <i class="icon ion-ios-arrow-forward f-18 m-r-10"></i>  考试成绩
                <span class="icon ion-android-done-all f-r f-18"></span>
            </li></a>
            <a href="grade-details.html"  class="side-menu-color"><li class="grade">
                <i class="icon ion-ios-arrow-forward f-18 m-r-10"></i>  成绩明细
                <span class="icon ion-android-funnel f-r f-18"></span>
            </li></a>
        </ul>
    </aside>
</div>
<!-- left area end -->

<!-- right area -->
<div class="right col-md-10 f-r">
    <header>
        <span class="notice-body"><i class="icon ion-alert"></i>  公告：</span><span id="notice">2018赣师大秋季软师报名进行中！</span>
        <span id="userName" class="m-r-10">上午好,${teacherName }   <a href="../login/exit.html">  退出</a></span>
    </header>
    <main style="overflow:hidden;">
        <div class="heading clearfix m-b-30">
        <h4 class="f-l">考试概况 <small>查看和管理考试概况</small></h4>

    </div>
        <div class="fliter row m-b-30">
            <div class="col-md-4">
                <span>条件筛选：</span>
                <button type="button" class="btn btn-default dropdown-toggle" id="btn1" data-toggle="dropdown">
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
                    <input type="hidden" value="" id="rainieppz"/>
                        <ul>
                        <c:forEach items="${list }" var="l">
                        
                            <li class="list-item" value="${l.paperId }">${l.paperName }</li>
                        </c:forEach>
                        </ul>
                    </div>
<!--                     <script type="text/javascript"> -->
<!--                 	$.getJSON("shExSc.html",{id:$("#fliterList ul li").eq(index).val()},function(json){ -->
						
<!--                 	}); -->
<!--                     </script> -->
                </div>
            </div>
            <div class="input-group col-md-4 col-md-offset-8">
                <input type="text" class="form-control" placeholder="请输入学号/姓名/课程">
                <span class="input-group-btn">
        <button class="btn btn-default" type="button">搜索</button>
      </span>
            </div>
        </div>
<div id="chartmain" style="width:450px; height: 560px;float:left;display:inline-block;margin-top:19px;"></div>
<div id="chartmain2" style="width:450px; height: 450px;float:right;display:inline-block;margin-top:19px;"></div>
 
    </main>
    <script type="text/javascript" src="js/echarts.js"></script>
    <script type="text/javascript">

    

    </script>
    <footer class="clear:both">
    	<strong class="m-l-20">Copyright © 2016 <a href="http://thoughtcoding.csxupt.com">赣师大计算机教育</a>.</strong> All rights reserved.
    </footer>
<!-- right area end -->
</div>
<script type="text/javascript" src = "js/jquery.min.js"></script>
<script type="text/javascript" src = "js/common.js"></script>

<script type="text/javascript" src="js/exam-grade.js"></script>

  </body>
</html>
