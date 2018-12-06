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
// multiple menu end

//请求方式get
//请求字段 .../exam-summary/classInfor
//var classInfor=[
//  {
//	"which-class":"1501软师考试",
//	"which-teacher":"任课教师：范老师",
//	"exam-condition":"考试已结束",
//	"pieInfor":[
//      {value:30, name:'80分以下'},
//      {value:20, name:'80-90分'},
//      {value:20, name:'90-100分'},
//      {value:10, name:'100-110分'},
//      {value:10, name:'110分以上'}
//     ],
//     "tableInfor":[{
//      "studentID" : "06144134",
//		"studentName" : "卓小越",
//		"grade" : "76",
//		"examName" : "1601期前端工程师"
//		},
//     {
//      "studentID" : "06144134",
//		"studentName" : "卓小越",
//		"grade" : "76",
//		"examName" : "1601期前端工程师"
//		},
//     {
//      "studentID" : "06144134",
//		"studentName" : "卓小越",
//		"grade" : "76",
//		"examName" : "1601期前端工程师"
//		}]
//	},	
//	 
//	 {
//	"which-class":"1502软师考试",
//	"which-teacher":"任课教师：范老师",
//	"exam-condition":"考试已结束"
//	},
//	 {
//	"which-class":"1503软师考试",
//	"which-teacher":"任课教师：范老师",
//	"exam-condition":"考试已结束"
//	},
//	 {
//	"which-class":"1503软师考试",
//	"which-teacher":"任课教师：范老师",
//	"exam-condition":"考试已结束"
//	},
//	
//]						
$(function(){
				$.ajax({
					type:'get',
					url:"http://clayz.top/exam/classInfor/",
					scriptCharset:'utf-8',
					async:true,
					dataType:"json",
					success:function(classInfor){
						console.log(classInfor);
						//var data=JSON.parse(a);
						
						for(var i in classInfor){
							
							$('.main-content').append(
							'<li><a href="exam-summary-detail.html"><i class="fa fa-file-pdf-o f-60  m-b-10"></i><p class="f-18 which-class">'+classInfor[i]['which-class']
							+'</p><p class="f-16 which-teacher">'+classInfor[i]['which-teacher']
							+'</p><p class="f-16 exam-condition">'+classInfor[i]['exam-condition']
							+'</p></a></li>');
							
						}
						for(var j=0;j<$('.main-content li').length;j++){
							$('.main-content li')[j].index=j;
							$('.main-content li').eq(j).click(function(){	
								classID=this.index;
								//alert(classID);
							})
						}
					}
				})
			})