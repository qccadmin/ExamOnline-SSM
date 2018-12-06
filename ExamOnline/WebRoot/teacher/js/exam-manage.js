function closeShadow() {
	$('#shadow').css('display', 'none');
	$('#change-exam').css('display', 'none');
}
function openShadow() {
	$('#shadow').css('display', 'block');
	$('#change-exam').css('display', 'block');
	window.changea = $(this).parent();
	$('.exam-header span').text($(this).parent().find('.which-class').html());
}
//点击编辑考试
$(".changeTime").on('click',openShadow);

$("#change-student").on('click',closeShadow);
$("#change-pro").on('click',closeShadow);
$("#addClose").on('click',closeShadow);
//点击确认修改
$("#change-enter").on('click',function(){
	changeExamState(window.changea);
})

function changeExamState(changea) {
		changea.find('.exam-state').text($('#inputCourse').val());
		changea.find('.exam-time').text($('#inputTime').val());
		closeShadow();
}

function makeList(examInfo){
	for(var i in examInfo){
		$('#ulClass').append($('<li><a class="clearfix p-lr"><i class="fa fa-file-code-o f-60  m-b-10"></i><p class="f-18 which-class"></p><p class="f-16 which-teacher teacher">任课教师：</p><div class="f-16 which-teacher">考试类型:<p class="dis-inline exam-state"></p></div><div class="f-16 which-teacher">结束时间:<p class="dis-inline exam-time"></p></div><input type="button" value="查看考试"  class="exam-condition f-l m-l-30"/><input type="button" value="编辑考试"  class="exam-condition f-r m-r-30 changeTime"/></a></li>'));
		$('#ulClass li:last a .which-class').html(examInfo[i]["examName"]);
		$('#ulClass li:last a .teacher').html('任课老师：'+ examInfo[i]["teacherName"]);
		$('#ulClass li:last a .exam-state').html(examInfo[i]["examState"]);
		$('#ulClass li:last a .exam-time').html(examInfo[i]["examTime"]);
		$(".changeTime").on('click',openShadow);
	}
}
$(document).ready(function(){
		$.ajax({
			type:"get",
			url:"http://clayz.top/exam/examManage",
			scriptCharset:"utf-8",
			async:true,
			success:function(result){
				console.log(result);
				makeList(result);
			},
			error:function(){
				console.log('发生错误');
			}
		})
})
		
