function showchildMenu(t) {
	show ? ($("." + t.data.liName).slideUp(), show = !1) : ($("." + t.data.liName).slideDown(), show = !0)
}

function updateSubject() {
	console.log("666")
}

function display(t) {
	t.addClass("top-display-b"), t.addClass("fade"), t.addClass("in")
}

function hidden(t) {
	t.removeClass("top-display-b"), t.removeClass("fade"), t.removeClass("in")
}

function sub() {
	this.id = "", this.content = "", this.time = "", this.type = "", this.kind = "", this.answer = ""
}

var show = !1,
	li1 = {
		liName: "course"
	},
	li2 = {
		liName: "assessment"
	},
	li3 = {
		liName: "grade"
	};
	
	
	
$("#course").click(li1, showchildMenu), 
$("#assessment").click(li2, showchildMenu), 
$("#grade").click(li3, showchildMenu),            // 以上是侧边栏



$("#topic-add-btn").click(function() {                  // 添加题目1
	$("#topic-add-subject").find("textarea").val(""), display($("#topic-add-subject"))
}), 
$("#topic-add-btn .modal-footer").find("button").eq(0).click(function() {   // 保存
	hidden($(this).parent().parent().parent().parent())
});
$("#topic-add-btn .modal-footer").find("button").eq(1).click(function() {  // 取消
	hidden($(this).parent().parent().parent().parent())
});


$("#topic-adda-btn").click(function() {          // 批量添加题目2
	display($("#topic-adda-subject"));
	$.ajax({
		method: "post",
		url: "seachPaperNoTit.html",
		contentType: "text/plain",
		success: function(t) {
			var json=$.parseJSON( t );
//			console.log(json);
			var str="<option hidden value='0'>请选择</option>";
			for(i=0;i<json.length;i++){
				str+="<option value="+json[i].paperId+">"+ json[i].paperName + "</option>";
			}
			$("#topic-adda-subject #edit_custLevel").html(str);
		},
		error: function() {
			console.log("error")
		}
	});
}),  
$("#topic-adda-subject .modal-footer").find("button").eq(0).click(function() {   // quxiao
	hidden($(this).parent().parent().parent().parent())
});
$("#topic-adda-subject .modal-footer").find("button").eq(1).click(function() {  // shangchuan
	var formData = new FormData();
	var filename=$("#topic-adda-subject .form-group input").val();
	var course=$("#topic-adda-subject .form-group select").val();
	if(filename==null||course==0||filename==""){
		alert("上传条件不足！");
	}else{
		formData.append('file', $('#topic-adda-subject .form-group input')[0].files[0]);
		formData.append('paperId',$('#edit_custLevel').val());
		$.ajax({
		    url: 'upload.html',
		    type: 'POST',
		    cache: false,
		    data: formData,
		    processData: false,
		    contentType: false,
			success: function(t) {
				alert(t);
			},
			error: function() {
				alert("上传错误！");
			}
		}
		).done(function(res) {
		}).fail(function(res) {});
		hidden($(this).parent().parent().parent().parent())
	}
});



$("button.close").click(function() {                                // 关闭弹窗div
	$(this).parent().parent().parent().parent().removeClass("top-display-b")
}), 


$(".select-subject").find("input").val($(".select-subject ul").find("li > a").eq(0).html()), $(".select-subject").find("button").click(function(t) {
	t.stopPropagation(), $(this).siblings("ul").toggleClass("top-display-b")
}), 
$("#btn1").click(function() {
	"block" == $("#fliterBox").css("display") ? $("#fliterBox").hide("slow") : $("#fliterBox").show("slow");
});

var jsonC="";
$("#fliterList ul").on("click","li",function(t) {
	var index=$(this).index();
	$("#fliterBox").hide("slow");
	$("#span1").text($("#fliterList ul li").eq(index).text());
	$("#rainieppz").val($("#fliterList ul li").eq(index).val())
//	alert($("#fliterList ul li").eq(index).val());
//	alert("66666");
	$.getJSON("seachPaperByPaperId.html",{id:$("#fliterList ul li").eq(index).val()},function(json){
//		console.log(json.length);
		jsonC=json;
		var str="";
		for(i=0;i<(json.length>10?10:json.length);i++){
			j=i+1;
			var titc="";
			if(json[i].titleCat==1){
				titc="单项选择题";
			}else if(json[i].titleCat==2){
				titc="多项选择题";
			}else if(json[i].titleCat==3){
				titc="判断题";
			}else if(json[i].titleCat==4){
				titc="简答题";
			}
			str+="<tr><td>"+j+"<input type='hidden' value='"+json[i].titleId+"'/></td><td>"+titc+"</td><td>"+json[i].titleStem+"</td><td>"+json[i].analyze+"</td><td>"+json[i].answerScore+"</td><td><a class='btn btn-primary btn-xs' data-toggle='modal' data-target='#customerEditDialog' onclick='update("+json[i].titleId+")'>修改</a> <a class='btn btn-danger btn-xs' onclick='deleteTitle("+json[i].titleId+")'>删除</a></td></tr>";
		}
		list=json.length%10==0?json.length/10:json.length/10+1;
//		console.log(list);
		var page="<li><span href='#'>&laquo;</span></li>"
		for(i=1;i<list;i++){
			page+="<li><span href='#'>"+i+"</span></li>";
		}
		$("#subject tbody").html(str);
		$(".pagination").html(page+="<li><span href='#'>&raquo;</span></li>")
	});
});
$(".pagination").on("click","li",function(t) {
	var index=$(this).index();
	var len=$(".pagination").children('li').length;
//	alert(index+"---"+len);
	if(index!=0&&index!=len-1){
		json=jsonC;
//		console.log(json);
		var str="";
		var xi=$(".pagination li").eq(index).text();
//		console.log(json.length%10);
//		console.log("xi"+xi);
		for(i=0;i<((xi*10)<json.length?10:(json.length-(xi-1)*10));i++){
			j=10*(xi-1)+1+i;
			var titc="";
			if(json[j-1].titleCat==1){
				titc="单项选择题";
			}else if(json[j-1].titleCat==2){
				titc="多项选择题";
			}else if(json[j-1].titleCat==3){
				titc="判断题";
			}else if(json[j-1].titleCat==4){
				titc="简答题";
			}
			str+="<tr><td>"+j+"<input type='hidden' value='"+json[j-1].titleId+"'/></td><td>"+titc+"</td><td>"+json[j-1].titleStem+"</td><td>"+json[j-1].analyze+"</td><td>"+json[j-1].answerScore+"</td><td><a class='btn btn-primary btn-xs' data-toggle='modal' data-target='#customerEditDialog' onclick='update("+json[j-1].titleId+")'>修改</a> <a class='btn btn-danger btn-xs' onclick='deleteTitle("+json[j-1].titleId+")'>删除</a></td></tr>";
		}
		$("#subject tbody").html(str);
	}
});

$("#subject tbody").on("click","td>.btn-primary",function(t) {  // 点击修改
	display($("#topic-error"));
})
$("#topic-error .modal-footer").find("button").eq(0).click(function() {   // 关闭
	hidden($(this).parent().parent().parent().parent())
});
$("#topic-error .modal-footer").find("button").eq(1).click(function() {  // 保存修改
	var params = $("#edit_customer_form").serializeArray();
	var values = {};
	for (var item in params) {
	   values[params[item].name] = params[item].value;
	}
	$.ajax({
		method: "get",
		url: "updateTitle.html",
		contentType: "application/json;charset=utf-8",
		data:values,
		success: function(t) {
//			alert(t);
//			alert($("#rainieppz").val());
			var index=$("#rainieppz").val();
			$.getJSON("seachPaperByPaperId.html",{id:index},function(json){
				console.log(json);
				jsonC=json;
				var str="";
				
				for(i=0;i<(json.length>10?10:json.length);i++){
					j=i+1;
					var titc="";
					if(json[i].titleCat==1){
						titc="单项选择题";
					}else if(json[i].titleCat==2){
						titc="多项选择题";
					}else if(json[i].titleCat==3){
						titc="判断题";
					}else if(json[i].titleCat==4){
						titc="简答题";
					}
					str+="<tr><td>"+j+"<input type='hidden' value='"+json[i].titleId+"'/></td><td>"+titc+"</td><td>"+json[i].titleStem+"</td><td>"+json[i].analyze+"</td><td>"+json[i].answerScore+"</td><td><a class='btn btn-primary btn-xs' data-toggle='modal' data-target='#customerEditDialog' onclick='update("+json[i].titleId+")'>修改</a> <a class='btn btn-danger btn-xs' onclick='deleteTitle("+json[i].titleId+")'>删除</a></td></tr>";
				}
				list=json.length%10==0?json.length/10:json.length/10+1;
//				console.log(list);
				var page="<li><span href='#'>&laquo;</span></li>"
				for(i=0;i<list;i++){
					j=i+1;
					page+="<li><span href='#'>"+j+"</span></li>";
				}
				$("#subject tbody").html(str);
				$(".pagination").html(page+="<li><span href='#'>&raquo;</span></li>")
			});	
		},
		error: function() {
			console.log("error")
		}
	});

	hidden($(this).parent().parent().parent().parent())
});

$("#subject tbody").on("click","td>.btn-danger",function(t) {        // 点击删除
	display($("#topic-delete-subject"));
})
$("#topic-delete-subject .modal-footer").find("button").eq(0).click(function() {   //确认删除 
	hidden($(this).parent().parent().parent().parent());
	$.ajax({
		method: "get",
		url: "deleteTitle.html",
		contentType: "application/json;charset=utf-8",
		data:"titleId="+$("#deleteValue").val(),
		success: function(t) {
			var index=$("#rainieppz").val();
			$.getJSON("seachPaperByPaperId.html",{id:index},function(json){
//				console.log(json);
				jsonC=json;
				var str="";
				for(i=0;i<(json.length>10?10:json.length);i++){
					j=i+1;
					var titc="";
					if(json[i].titleCat==1){
						titc="单项选择题";
					}else if(json[i].titleCat==2){
						titc="多项选择题";
					}else if(json[i].titleCat==3){
						titc="判断题";
					}else if(json[i].titleCat==4){
						titc="简答题";
					}
					str+="<tr><td>"+j+"<input type='hidden' value='"+json[i].titleId+"'/></td><td>"+titc+"</td><td>"+json[i].titleStem+"</td><td>"+json[i].analyze+"</td><td>"+json[i].answerScore+"</td><td><a class='btn btn-primary btn-xs' data-toggle='modal' data-target='#customerEditDialog' onclick='update("+json[i].titleId+")'>修改</a> <a class='btn btn-danger btn-xs' onclick='deleteTitle("+json[i].titleId+")'>删除</a></td></tr>";
				}
				list=json.length%10==0?json.length/10:json.length/10+1;
//				console.log(list);
				var page="<li><span href='#'>&laquo;</span></li>"
				for(i=0;i<list;i++){
					j=i+1;
					page+="<li><span href='#'>"+j+"</span></li>";
				}
				$("#subject tbody").html(str);
				$(".pagination").html(page+="<li><span href='#'>&raquo;</span></li>")
			});	
		},
		error: function() {
			console.log("error")
		}
	});
});
$("#topic-delete-subject .modal-footer").find("button").eq(1).click(function() {  // 关闭
	hidden($(this).parent().parent().parent().parent())
	
});


function update(val){
	json=jsonC;
	for(i=0;i<json.length;i++){
		if(json[i].titleId==val){
			$("#updateTitid").val(val);
			$("#updatetitname").val(json[i].titleStem);
			$("#optionA").val(json[i].optionA);
			$("#optionB").val(json[i].optionB);
			$("#optionC").val(json[i].optionC);
			$("#optionD").val(json[i].optionD);
			$("#answerRight").val(json[i].answerRight);
			$("#analyze").val(json[i].analyze);
		}
	}
};

function deleteTitle(val){
	$("#deleteValue").val(val);
}

