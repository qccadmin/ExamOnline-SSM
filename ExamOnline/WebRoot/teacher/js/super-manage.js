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
}// delete one end




function managerMarch(){
		//验证
	$('form :input').blur(function(){
             var $parent = $(this).parent();
             $parent.find(".formtips").remove();
             //验证学号
             if( $(this).is('#inputNum') ){
                    if( this.value=="" || this.value.length !== 8 ){
                        var errorMsg = '请输入8位的学号.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    }else{
                        var okMsg = '输入正确.';
                        $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                    }
             }
             //验证用户名
             if( $(this).is('#inputName') ){
                if( this.value=="" ){
                      var errorMsg = '请输入用户名.';
                      $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                }else{
                      var okMsg = '输入正确.';
                      $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                }
             }
        }).keyup(function(){
           $(this).triggerHandler("blur");
        }).focus(function(){
             $(this).triggerHandler("blur");
        });//end blur
 	}


//添加
$('.add-manage').on("click",function (){
	popupManager("add-manage");
	managerMarch();
});
//修改
$('.changeManager').on("click",changeManager);
function changeManager(){
	window.changeManageObject = $(this).parent().parent();
	popupManager("changeManager");
	managerMarch();
}
function popupManager(id){
	$('#zz').css('display', 'block');
	$('#addUser').css('display', 'block');
	if(id == "add-manage"){
		$('#addManageInform').removeClass("changeManage");
		$('#addManageInform').addClass("addManage");
	}
	if(id == "changeManager"){
		$('#addManageInform').removeClass("addManage");
		$('#addManageInform').addClass("changeManage");
	}
}

$('#addManageInform').on('click',function(){
	if($(this).hasClass("addManage")){
	addManagerEnter();
	addColor();
	}
	if($(this).hasClass("changeManage")){
	changeManagerEnter(window.changeManageObject );
	}
});
function addManagerEnter() {
			 	//添加至下一行
                $('table tr:last').after($('<tr><td class="checkbox m-0"><label><input type="checkbox" name="a"></label></td><td></td><td></td><td></td><td><i class="fa fa-trash-o cur-p deleteOne"></i>/<i class="fa fa-edit changeManager"></i></td></tr>'));
                $('table tr:last td:eq(1)').text($('#inputNum').val());
                $('table tr:last td:eq(2)').text($('#inputName').val());
            	$('table tr:last td:eq(3)').text($('#inputCourse').val());
            	$('table tr:last td:eq(4)').find(".deleteOne").click(deleter);
				$('table tr:last td:eq(4)').find(".changeManager").click(changeManager);
				colseZz();
        }
function changeManagerEnter(trobject){
			trobject.find('td:eq(1)').text($('#inputNum').val());
			trobject.find('td:eq(2)').text($('#inputName').val());
			trobject.find('td:eq(3)').text($('#inputCourse').val());
			colseZz();
		};
		

//close and cancel
$('#cancelChange').click(colseZz);
$('#addClose').click(colseZz);
function colseZz() {
	$('#zz').css('display', 'none');
	$('#addUser').css('display', 'none');
}
//close and cancel end

function manageTabke(manageInfo){
	for(var i in manageInfo){
							$('tbody').append($('<tr><td class="checkbox m-0"><label><input type="checkbox" name="a"></label></td><td></td><td></td><td></td><td><i class="fa fa-trash-o cur-p deleteOne"></i>/<i class="fa fa-edit changeManager"></i></td></tr>'));
							$('tbody tr:last td:eq(1)').html(manageInfo[i]["manageNum"]);
							$('tbody tr:last td:eq(2)').html(manageInfo[i]["manageName"]);
							$('tbody tr:last td:eq(3)').html(manageInfo[i]["manageClass"]);
							$('table tr:last td:eq(4)').find(".deleteOne").click(deleter);
							$('table tr:last td:eq(4)').find(".changeManager").click(changeManager);
							colseZz();
							addColor();
	}
}
$(document).ready(function(){
		$.ajax({
			type:"get",
			url:"http://clayz.top/exam/superManage",
			scriptCharset:"utf-8",
			async:true,
			success:function(result){
				manageTabke(result);
			},
			error:function(){
				console.log('发生错误');
			}
		})
})
		