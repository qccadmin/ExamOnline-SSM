
function getUserInfo(userUrl){

	var index = userUrl.index;
	var loginout = userUrl.loginout;
	var editinfo = userUrl.editinfo;
	var message = userUrl.message;
	var myCourse = userUrl.myCourse;
	
	$.ajax({
		type: "POST",
		datatype: "xml",
		url: "/plus/ajaxs.ashx",
		data: "a=checkislogin",
		success: function (xml) {

			var islogin = $(xml).find("login islogin").text();
			if (islogin == 'false') return;
			var str = '<div class="haed-user"><img src="/UploadFiles/avatar/' + $(xml).find("login userid").text() + '.jpg" class="m-avatar" />' + $(xml).find("login username").text()+ '<div class="u-navdropmenu"><span><a href="'+index+'" target="_blank">我的主页</a></span><span><a href="'+message+'" target="_blank"><i class="num">'+$(xml).find("login message").text()+'</i>我的信息</a></span><span><a href="'+editinfo+'" target="_blank">修改资料</a></span><span><a href="'+loginout+'" target="_blank">退出</a></span></div></div>';
			
			$("#nologin").html(str);
			$('.haed-user').hover(function(){
				$(this).find('.u-navdropmenu').show();
			},function(){
				$(this).find('.u-navdropmenu').hide();
			});
			avatarEach();
		}
	});

};

function imgEach(){
	$('.m-img').each(function() {
		var mImgSrc = $(this).attr('src');
		if(mImgSrc==''){
			$(this).attr('src','/sysimg/nopic_225_142.png');
		}else if(mImgSrc.indexOf('{KS:')==-1&&mImgSrc.indexOf('{$Field')==-1){
			$(this).error(function(){
				$(this).attr('src','/sysimg/nopic_225_142.png');
			});
		};
	});
}

function avatarEach(){
	$('.m-avatar').each(function() {
		var mImgSrc = $(this).attr('src');
		if(mImgSrc==''){
			$(this).attr('src','/sysimg/avatar.jpg');
		}else if(mImgSrc.indexOf('{KS:')==-1&&mImgSrc.indexOf('{$Field')==-1){
			$(this).error(function(){
				$(this).attr('src','/sysimg/avatar.jpg');
			});
		};
	});
};

imgEach();
avatarEach();

function imgLoad(obj,img){
	//懒加载
	$('.'+obj).each(function(){
		$(this).lazyload({
			effect : "fadeIn" ,
			placeholder :img,   
			event : "scroll" 
		});   
	})
	
};


//执行页面动画
$('.page-animate').each(function() {
    var ofTop = $(this).offset().top-$(window).height();
    var maxTop = $(this).offset().top+$(this).outerHeight();
	var type = $(this).attr('data-type');
	if(!type){
		type = 'fadeInUp';
	};
	var $that = $(this);
	if($(window).scrollTop()>ofTop&&$(window).scrollTop()<maxTop){
		var delay = $that.attr('data-delay');
		if(delay){
			$that.css({animationDelay:''+delay+'s'});
		};
		$that.removeClass('page-animate').addClass('animated '+type+'');
	};
	$(window).scroll(function(){
		if($(window).scrollTop()>ofTop&&$(window).scrollTop()<maxTop){
			$that.removeClass('page-animate').addClass('animated '+type+'');
		};
	});
});


/*试卷搜索*/
$('#keyword').focus(function(){
	 if($.trim($(this).val())=='搜索当前分类下的试卷'){
	 	$(this).val('');
	 };
	$('.exambtn').addClass('exambtn-on');
 }).blur(function(){
 	if($.trim($(this).val())==''){
		$(this).val('搜索当前分类下的试卷');
	};
	$('.exambtn').removeClass('exambtn-on');
 }).keydown(function(e){
    if(e.keyCode==13){
        searchByClass();
    };
 });


 function examsearch(url){

   var newurl='';
   if (url.indexOf('&sp')==-1){  //没有启用伪静态
     var param=url.split('?')[1];	  
     var newparam=getNewSearchParam(param);
     newurl= url+'?'+newparam;
   }else{  //启用伪静态
     var parr=url.split('?');
     var qparam=parr[parr.length-1];//问号后面的
     var ext="."+qparam.split('.')[qparam.split('.').length-1];
     var preurl=url.replace(qparam,'');
     var param=qparam.replace(ext,'');
     var newparam = getNewSearchParam(param);
     newurl=preurl+newparam
   }

    location.href=newurl;
   }
 function getNewSearchParam(param){ 
     var key = jQuery("#keyword").val();
     if (key == '搜索当前分类下的试卷')
     {
         key = 0;
     }
     if (param==undefined)
     {
         return  'key-'+key;
     }
     var parr=param.split(',');
     var newparam='';
     for (var i=0;i<parr.length;i++){
       var pparr=parr[i].split('-');
       if (pparr[0]=='key'){
        if (newparam==''){
          newparam='key-'+(key);
        }else{
          newparam+=',key-'+key;
        }
       }else{
         if (newparam==''){
           newparam=parr[i];
         }else{
           newparam+=','+parr[i];
         }
       }
     }
     if (newparam.indexOf('key-')==-1 && key!=''){
      if (newparam==''){
        newparam='key-'+key;
      }else{
        newparam+=',key-'+key;
      }
     }
    return newparam;
 }

//使底部置底
contMinHeight();
 $(window).resize(function () {
       contMinHeight();
    });

function contMinHeight(){
	var minH = $(window).height()-$('#footer').outerHeight(true)-$('.headbar').outerHeight();
	$('.gray').css({minHeight:minH+'px'});
	console.log(minH)
};