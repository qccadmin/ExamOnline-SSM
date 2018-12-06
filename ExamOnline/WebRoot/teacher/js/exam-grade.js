$('#btn1').click(function() {
    $('#fliterBox').css("display") == "block" ? $('#fliterBox').hide('slow') : $('#fliterBox').show('slow');
    
});
//for (var j1 = 0; j1 < $('#fliterList ul li').length; j1++) {
//    $('#fliterList ul li:eq(' + j1 + ')').click(function(event) {
//        $('#fliterBox').hide('slow');
//        $('#span1').text(this.innerHTML);
//        alert(this.val());
//});
//}
$("#fliterList ul").on("click","li",function(t) {
	var index=$(this).index();
	$("#fliterBox").hide("slow");
	$("#span1").text($("#fliterList ul li").eq(index).text());
	$("#rainieppz").val($("#fliterList ul li").eq(index).val());
	$.getJSON("shExSc.html",{id:$("#fliterList ul li").eq(index).val()},function(json){
	    var myChart = echarts.init(document.getElementById('chartmain'));
	    var options={
	        //定义一个标题
	        title:{
	            text:$("#fliterList ul li").eq(index).text()
	        },
	        tooltip:{
	            show:true,
	            formatter:'分数段:{b}<br />人数:{c}人'
	        },
	        series:[{
	            name:'各分数段成绩',
	            type:'pie',
	            data:[
	                    {value:json[0],name:'<60分'},
	                    {value:json[1],name:'60-69分'},
	                    {value:json[2],name:'70-79分'},
	                    {value:json[3],name:'80-89分'},
	                    {value:json[4],name:'90-100分'}
	                ]
	        }]

	    };
	    console.log(json);
	    myChart.setOption(options);		
	});
	var myChart = echarts.init(document.getElementById('chartmain2'));
	$.getJSON("shExScZX.html",{id:$("#fliterList ul li").eq(index).val()},function(json){
	    var options={
	            //定义一个标题
	            title:{
	                text:$("#fliterList ul li").eq(index).text()+"各班情况对比"
	            },
	            legend:{
	                data:['各分数段成绩']
	            },
	            //X轴设置
	            xAxis:{
	                data:['<60分','60-69分','70-79分','80-89分','90-100分']
	            },
	            yAxis:{
	            },
	            tooltip:{
	                show:true,
	                formatter:'表名:{a}<br />分数段:{b}<br />人数:{c}'
	            },
	            series:json
	        };
	        myChart.setOption(options);	
	});
});



