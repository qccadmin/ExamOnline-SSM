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
// multiple select menu
$('#btn1').click(function() {
    $('#fliterBox').css("display") == "block" ? $('#fliterBox').hide('slow') : $('#fliterBox').show('slow');
     
});

// switch and show fliterList items
for (var i = 0; i < $('#fliterListNav ul li').length; i++) {
    $('#fliterListNav ul li:eq(' + i + ')').click(function(event) {
        $('#fliterListNav ul li').removeClass('nav-actived');
        $(this).addClass('nav-actived');
        var listTable = {
            "0": ["试卷A1", "试卷A2", "试卷A3"],
            "1": ["试卷B1", "试卷B2", "试卷B3"],
            "2": ["试卷C1", "试卷C2", "试卷C3"]
        };

        $('#fliterList ul li').html("");
        for (x in listTable[$(this).attr("name")]) {
            $('#fliterList ul li:eq(' + x + ')').html(listTable[$(this).attr("name")][x]);
        }
    });
}
// switch and show fliterList items end

// bind click event for list items
for (var j = 0; j < $('#fliterList ul li').length; j++) {
    $('#fliterList ul li:eq(' + j + ')').click(function(event) {
        $('#fliterBox').hide('slow');
        $('#span1').text(this.innerHTML);
        //条件筛选匹配班级
         var grade=$('#span1').html().substring(0,4);
var classKind=$('#span1').html().substring(4,6);
var re=eval("/"+grade+classKind+"/");
for(var i=0;i<$('.which-class').length;i++){ 
$('.which-class')[i].innerHTML.replace(re,function($0,$1,$2){	
     for(var j=0;j<$('.which-class').length;j++){
     	$('.main-content li').eq(j).css('display','none');
     }
     $('.main-content li').eq(i).css('display','block');
})
}


    });
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
		
