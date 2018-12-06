//addcolor
$(addColor);
function addColor() {
	$('#userTbody tr').removeClass();
	for(var i = 0; i < $('#userTbody tr').length; i++) {
		if(i % 4 == 0) {
			$('#userTbody tr').eq(i).addClass('info');
		}
		if(i % 4 == 1) {
			$('#userTbody tr').eq(i).addClass('success');
		}
		if(i % 4 == 2) {
			$('#userTbody tr').eq(i).addClass('warning');
		}
		if(i % 4 == 3) {
			$('#userTbody tr').eq(i).addClass('active');
		}
	}
}//addcolor end

//choose all and choose more
$(chooseAll);
function chooseAll() {
	$("#btn").click(function() {
		$("input[name='a']").prop("checked", this.checked);
	});
	$("input[name='a']").click(function() {
		var $subs = $("input[name='a']");
		$("#btn").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
	});
}// choose all and choose more end

// delete choose delete more
$('#deleteAll').on('click', function() {
	deleteChoose();
	addColor();
});
function deleteChoose() {
	if(confirm("确定删除吗？") == true) {
		$("tbody input:checked").each(function() {
			$(this).parent().parent().parent().remove();
		});
	}
	$("#btn").prop("checked", false);
}// delete choose delete more end

// delete one
$('.deleteOne').click(deleter);
function deleter(){
	if(confirm("确定删除吗？") == true) {
	$(this).parent().parent().remove();
			addColor();
	}
}
//}// delete one end

//march
function march() {
	//验证
	$('form :input').blur(function() {
		var $parent = $(this).parent();
		$parent.find(".formtips").remove();
		//验证学号
		if($(this).is('#inputNum')) {
			if(this.value == "" || this.value.length !== 8) {
				//判断是否全为数字
				//var re=/\D/;
				//                  	if(!re.test(this.value)){
				//                  		var errorMsg = '请输入8位数字.';
				//                      $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
				//                  	}
				var errorMsg = '请输入8位的学号.';
				$parent.append('<span class="formtips onError">' + errorMsg + '</span>');
			} else {
				var okMsg = '输入正确.';
				$parent.append('<span class="formtips onSuccess">' + okMsg + '</span>');
			}
		}
		//验证用户名
		if($(this).is('#inputName')) {
			if(this.value == "" || this.value.length > 4) {
				var errorMsg = '请输入正确的用户名.';
				$parent.append('<span class="formtips onError">' + errorMsg + '</span>');
			} else {
				var okMsg = '输入正确.';
				$parent.append('<span class="formtips onSuccess">' + okMsg + '</span>');
			}
		}
		//验证专业
		if($(this).is('#inputClass')) {
			if(this.value == "") {
				var errorMsg = '输入不能为空.';
				$parent.append('<span class="formtips onError">' + errorMsg + '</span>');
			} else {
				var okMsg = '输入正确.';
				$parent.append('<span class="formtips onSuccess">' + okMsg + '</span>');
			}
		}
	}).keyup(function() {
		$(this).triggerHandler("blur");
	}).focus(function() {
		$(this).triggerHandler("blur");
	}); //end blur
}


//change student
$('.changeInfrom').on("click",changeInfo );
function changeInfo(){
	window.changeobject = $(this).parent().parent();
	popup("changeInfrom");
	march();
}



//add student
$('#addUserIn').on("click",function (){
	popup(addUserIn);
	march();
});
//add student enter

//popup
function popup(id){
	$('#zz').css('display', 'block');
	$('#addUser').css('display', 'block');
	if(id == addUserIn){
		$('#addUserInform').removeClass("changeStudent");
		$('#addUserInform').addClass("addStudent");
	}
	if(id == "changeInfrom"){
		$('#addUserInform').removeClass("addStudent");
		$('#addUserInform').addClass("changeStudent");
	}
}
//popup end

//click enter
$('#addUserInform').on("click",function(){
	if($(this).hasClass("addStudent")){
	addEnter();
	addColor();
	}
	if($(this).hasClass("changeStudent")){
	changeEnter(window.changeobject);
	}
})
//click enter end

function addEnter() {
		//添加至下一行
		$('table tr:last').after($('<tr><td class="checkbox m-0"><label><input type="checkbox" name="a"></label></td><td></td><td></td><td></td><td></td><td></td> <td><i class="fa fa-trash-o cur-p deleteOne"></i>/<i class="fa fa-edit changeInfrom"></i></td></tr>'));
		$('table tr:last td:eq(1)').text($('#inputNum').val());
		$('table tr:last td:eq(2)').text($('#inputName').val());
		$('table tr:last td:eq(4)').text($('#inputCourse').val());
		$('table tr:last td:eq(3)').text($('#inputClass').val());
		$('table tr:last td:eq(5)').text($('#classState').val());
		$('table tr:last td:eq(6)').find(".deleteOne").click(deleter);
		$('table tr:last td:eq(6)').find(".changeInfrom").click(changeInfo);
		colseZz();
}

//change student info enter
function changeEnter(trobject) {
  		trobject.find('td:eq(1)').text($('#inputNum').val());
		trobject.find('td:eq(2)').text($('#inputName').val());
		trobject.find('td:eq(3)').text($('#inputClass').val());
		trobject.find('td:eq(4)').text($('#inputCourse').val());
		trobject.find('td:eq(5)').text($('#classState').val());
		colseZz();
}
//change student info enter end
//close and cancel
$('#cancelChange').click(colseZz);
$('#addClose').click(colseZz);
function colseZz() {
	$('#zz').css('display', 'none');
	$('#addUser').css('display', 'none');
}
//close and cancel end

function studentTabke(studentInfo){
	for(var i in studentInfo){
							$('tbody').append($('<tr><td class="checkbox m-0"><label><input type="checkbox" name="a"></label></td><td></td><td></td><td></td><td></td><td></td> <td><i class="fa fa-trash-o cur-p deleteOne"></i>/<i class="fa fa-edit changeInfrom"></i></td></tr>'));
							$('tbody tr:last td:eq(1)').html(studentInfo[i]["studentNum"]);
							$('tbody tr:last td:eq(2)').html(studentInfo[i]["studentName"]);
							$('tbody tr:last td:eq(3)').html(studentInfo[i]["studentMajor"]);
							$('tbody tr:last td:eq(4)').html(studentInfo[i]["studentClass"]);
							$('tbody tr:last td:eq(5)').html(studentInfo[i]["classState"]);
							$('tbody tr:last td:eq(6)').find(".deleteOne").click(deleter);
							$('tbody tr:last td:eq(6)').find(".changeInfrom").click(changeInfo);
							colseZz();
							addColor();
	}
}
$(document).ready(function(){
		$.ajax({
			type:"get",
			url:"http://clayz.top/exam/studentManage",
			scriptCharset:"utf-8",
			async:true,
			success:function(result){
				console.log(result);
				studentTabke(result['studentInfo']);
			},
			error:function(){
				console.log('发生错误'+jqXHR.states);
			}
		})
})
		