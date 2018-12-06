// for aside child menu
var show = false;
var li1 = {liName:"course"};
var li2 = {liName:"assessment"};
var li3 = {liName:"grade"};
$("#course").click(li1,showchildMenu);
$("#assessment").click(li2,showchildMenu);
$("#grade").click(li3,showchildMenu);
function showchildMenu(event){
	if (show) {
		$("."+event.data.liName).slideUp();
		show = false;
	}
	else{
	$("."+event.data.liName).slideDown();
	show = true;
}
}



