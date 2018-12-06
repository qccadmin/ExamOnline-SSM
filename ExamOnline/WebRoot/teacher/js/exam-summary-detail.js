//var gradeDetails=
//[{"pieInfor":[
//      {value:30, name:'80分以下'},
//      {value:20, name:'80-90分'},
//      {value:20, name:'90-100分'},
//      {value:10, name:'100-110分'}
//     ],
//"tableInfor":[{
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
//},
//		{"pieInfor":[
//      {value:30, name:'80分以下'},
//      {value:20, name:'80-90分'},
//      {value:20, name:'90-100分'},
//      {value:10, name:'100-110分'},
//      {value:10, name:'110分以上'}
//     ],
//"tableInfor":[{
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
//		}]},
//		{"pieInfor":[
//      {value:30, name:'80分以下'},
//      {value:20, name:'80-90分'},
//      {value:20, name:'90-100分'},
//      {value:10, name:'100-110分'},
//      {value:10, name:'110分以上'}
//     ],
//"tableInfor":[{
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
//		}]},
//
//
//		{"pieInfor":[
//      {value:30, name:'80分以下'},
//      {value:20, name:'80-90分'},
//      {value:20, name:'90-100分'},
//      {value:10, name:'100-110分'},
//      {value:10, name:'110分以上'}
//     ],
//"tableInfor":[{
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
//		}]}
//]

$(function(){
				$.ajax({
					type:'get',
					url:"http://clayz.top/exam/examGradeDetails/",
					scriptCharset:'utf-8',
					async:true,
					dataType:"json",
					success:function(details){
                    		var dom = document.getElementById("container");
					var myChart = echarts.init(dom);
					//var flag = false;
					var app = {};
					var option = {
					    title : {
					        text: '1601软师考试',
					        //subtext: '1511级程序员班',
					        x:'center'
					    },
					    tooltip : {
					        trigger: 'item',
					        formatter: "{a} <br/>{b} : {c} ({d}%)"
					    },
					    legend: {
					        orient: 'vertical',
					        left: 'left',
					        data: ['80分以下','80-90分','90-100分','100-110分','110分以上']
					    },
					    series : [
					        {
					            name: '成绩统计',
					            type: 'pie',
					            radius : '55%',
					            center: ['50%', '60%'],
					            data:[
					//              {value:30, name:'80分以下'},
					//              {value:20, name:'80-90分'},
					//              {value:20, name:'90-100分'},
					//              {value:10, name:'100-110分'},
					//              {value:10, name:'110分以上'}
					            ],
					            itemStyle: {
					                emphasis: {
					                    shadowBlur: 10,
					                    shadowOffsetX: 0,
					                    shadowColor: 'rgba(0, 0, 0, 0.5)'
					                }
					            }
					        }
					    ]
					};
							var detail1=details[0]['tableInfor'];
							var detail2=details[0]['pieInfor'];
							option.series[0].data = detail2;
							console.log(detail2);


							//用循环渲染成绩表格
							for(var i in detail1){$('tbody').append(
							'<tr><td>'+detail1[i]['studentID']
							+'</td><td>'+detail1[i]['studentName']
							+'</td><td>'+detail1[i]['grade']
							+'</td><td>'+detail1[i]['examName']
							+'</td>');
							//给表格加颜色
							$("Tr")[0].style.backgroundColor = '#fff';
							for(var i=1;i<$("Tr").length;i++){
									if(i%4 == 0){
										$("Tr").eq(i).addClass('error');
									}
									else if(i%4 == 1){
										$("Tr").eq(i).addClass('info');
									}
									else if(i%4 == 3){
										$("Tr").eq(i).addClass('warning');
									}
									else{
										$("Tr").eq(i).addClass('success');
									}
								}
							}
						if (option && typeof option === "object") {
								    myChart.setOption(option, true);
								}


					}

				})

		})
