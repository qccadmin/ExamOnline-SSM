$("#dx1747372").on("click","li",function(t) {
	var index=$(this).index();//第几个li
	var index2=$(t.target).index();
	console.log("li的"+index+"，dd的"+index2);
	var yanse=$("#dx1747372 li:eq("+index+") dl dd").eq(index2).css("color");
	if(yanse!="rgb(21, 21, 21)"){  //如果不等于黑色（不是未选状态）
		danxuanUnCheck(index,index2)
	}else{
		danxuanCheck(index,index2)
	}
});


function danxuanCheck(index,index2){   //执行后，选中答案
	$("#dx1747372 li:eq("+index+") dl dd").css({
		"color": "#151515"
	});
	$("#dx1747372 li:eq("+index+") dl dd").find("span").css({
		"color": "#151515"
	});
	$("#dx1747372 li:eq("+index+") dl dd").eq(index2).css({
		"color": "red"
	});
	$("#dx1747372 li:eq("+index+") dl dd").eq(index2).find("span").css({
		"color": "red"
	});
	danxuanGetV(index);
}


function danxuanUnCheck(index,index2){     //执行后，取消选中答案
	$("#dx1747372 li:eq("+index+") dl dd").eq(index2).css({
		"color": "#151515"
	});
	$("#dx1747372 li:eq("+index+") dl dd").eq(index2).find("span").css({
		"color": "#151515"
	});
	danxuanGetV(index);
}

function danxuanGetV(index){
	var str="";
	for(var i=0;i<$("#dx1747372 li:eq("+index+") dl dd").length;i++){
		var y=$("#dx1747372 li:eq("+index+") dl dd").eq(i).css("color");
		if(y=="rgb(21, 21, 21)"){  //如果等于黑色（未选状态）
			
		}else{
			if(i==0){
				str="A"
			}else if(i==1){
				str="B"
			}else if(i==2){
				str="C"
			}else if(i==3){
				str="D"
			}
		}
	}
	$("#danxInput"+index).val(str);
	console.log($("#danxInput"+index).val());
}




















$("#dx1747373").on("click","li",function(t) {
	var index=$(this).index();//第几个li
	var index2=$(t.target).index();
	console.log("li的"+index+"，dd的"+index2);
	var yanse=$("#dx1747373 li:eq("+index+") dl dd").eq(index2).css("color");
	if(yanse!="rgb(21, 21, 21)"){  //如果不等于黑色（不是未选状态）
		duoxuanUnCheck(index,index2)
	}else{
		duoxuanCheck(index,index2)
	}
});
function duoxuanCheck(index,index2){   //执行后，选中答案
	$("#dx1747373 li:eq("+index+") dl dd").eq(index2).css({
		"color": "red"
	});
	$("#dx1747373 li:eq("+index+") dl dd").eq(index2).find("span").css({
		"color": "red"
	});
	duoxuanGetV(index);
}


function duoxuanUnCheck(index,index2){     //执行后，取消选中答案
	$("#dx1747373 li:eq("+index+") dl dd").eq(index2).css({
		"color": "#151515"
	});
	$("#dx1747373 li:eq("+index+") dl dd").eq(index2).find("span").css({
		"color": "#151515"
	});
	duoxuanGetV(index);
}

function duoxuanGetV(index){
	var str="";
	for(var i=0;i<$("#dx1747373 li:eq("+index+") dl dd").length;i++){
		var y=$("#dx1747373 li:eq("+index+") dl dd").eq(i).css("color");
		if(y=="rgb(21, 21, 21)"){  //如果等于黑色（未选状态）
			
		}else{
			if(i==0){
				str+="A"
			}else if(i==1){
				str+="B"
			}else if(i==2){
				str+="C"
			}else if(i==3){
				str+="D"
			}
		}
	}
	$("#duoxInput"+index).val(str);
	console.log($("#duoxInput"+index).val());
}















$("#pd1747374").on("click","li",function(t) {
	var index=$(this).index();//第几个li
	var index2=$(t.target).index();
	console.log("li的"+index+"，dd的"+index2);
	var yanse=$("#pd1747374 li:eq("+index+") dl dd").eq(index2).css("color");
	if(yanse!="rgb(21, 21, 21)"){  //如果不等于黑色（不是未选状态）
		pdUnCheck(index,index2)
	}else{
		pdCheck(index,index2)
	}
});


function pdCheck(index,index2){   //执行后，选中答案
	$("#pd1747374 li:eq("+index+") dl dd").css({
		"color": "#151515"
	});
	$("#pd1747374 li:eq("+index+") dl dd").find("span").css({
		"color": "#151515"
	});
	$("#pd1747374 li:eq("+index+") dl dd").eq(index2).css({
		"color": "red"
	});
	$("#pd1747374 li:eq("+index+") dl dd").eq(index2).find("span").css({
		"color": "red"
	});
	pdGetV(index);
}


function pdUnCheck(index,index2){     //执行后，取消选中答案
	$("#pd1747374 li:eq("+index+") dl dd").eq(index2).css({
		"color": "#151515"
	});
	$("#pd1747374 li:eq("+index+") dl dd").eq(index2).find("span").css({
		"color": "#151515"
	});
	pdGetV(index);
}

function pdGetV(index){
	var str="";
	for(var i=0;i<$("#pd1747374 li:eq("+index+") dl dd").length;i++){
		var y=$("#pd1747374 li:eq("+index+") dl dd").eq(i).css("color");
		if(y=="rgb(21, 21, 21)"){  //如果等于黑色（未选状态）
			
		}else{
			if(i==0){
				str="T"
			}else if(i==1){
				str="F"
			}
		}
	}
	$("#pdInput"+index).val(str);
	console.log($("#pdInput"+index).val());
}
//
//$(".btn>a").click(function(){
//	$("#myExam").submit();
//	
//	
//});
$(".btn>a").click(function(){
    $("#myExam").ajaxSubmit(function (data) {
           alert(data);
           window.location.replace("examPlan.html");
    });
});


