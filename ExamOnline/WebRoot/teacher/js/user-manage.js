// for multiple select menu
// console.debug($('#fliterBox').css("display"));
$('#btn1').click(function(){
	$('#fliterBox').css("display") == "block" ? $('#fliterBox').hide('slow'): $('#fliterBox').show('slow');
})
	for (var i = 0; i < $('#fliterListNav ul li').length; i++) {
		$('#fliterListNav ul li:eq('+i+')').click(function(event) {
			$('#fliterListNav ul li').removeClass('nav-actived');
			$(this).addClass('nav-actived');
		});
		// $.ajax({url:"test.json", success:function(result){
		// 	console.debug(result);
		// }});
	}
	for (var j = 0; j < $('#fliterList ul li').length; j++) {
		$('#fliterList ul li:eq('+j+')').click (function (event) {
			$('#fliterBox').hide('slow');
			$('#span1').text(this.innerHTML);
		});
	}
