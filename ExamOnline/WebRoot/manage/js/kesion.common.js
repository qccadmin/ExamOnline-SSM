/**----前台模板里必须调用的通用JS文件--**/
var appurl = '/'; //主程序安装URL,请正确填写,否则可能导到JS不能用,如是网站有启用二级域名，请填写主站域名

if(window.name!='dragmain'){
    document.write('<script src="' + appurl + 'ks_inc/dialog/jquery.artDialog.js?skin=opera"><\/script><script src="' + appurl + 'ks_inc/dialog/plugins/iframeTools.js"><\/script>');
};
//===========================Ajax标签结束开始===============================================
$(document).ready(function() {
/*导航必须使用的*/
	$('.two_nav_left').find('.item').each(function(index) {
	  var i = index+1;
	 var na = 'na'+i+'';
	 $(this).find('.first em').addClass(na);
	});

    $("span[type=ajax]").each(function() {
        loadAjaxList($(this));
    });

    $("*[linkref]").click(function() {
        var linkid = $(this).attr("linkref");
        var url = appurl + "plus/Ajaxs.ashx?a=linkhits&linkid=" + linkid + "&anticache=" + Math.floor(Math.random() * 1000);
        $.ajax({
            type: "get",
            async: false,
            url: url,
            cache: false,
            success: function(d) {}
        });
    });
    $("font[type=showhits]").each(function() {
        var url = appurl + "index.aspx?c=hits&action=" + $(this).attr("action") + "&f=" + $(this).attr("f") + "&t=" + $(this).attr("t") + "&modelid=" + $(this).attr("modelid") + "&id=" + $(this).attr("id") + "&anticache=" + Math.floor(Math.random() * 1000);
        var o = $(this);
        $.ajax({
            type: "get",
            async: false,
            url: url,
            cache: false,
            success: function(d) {
                o.html(d);
            }
        });

    });


    //判断APP
    if (isOpenApp()) {
        $(".quick-btn").hide();
        $("body").addClass("appbody");
    }

});

//========================ajax方式加载标签 参数：obj 标签ID ,labelParam 标签参数========================
function loadAjaxList(o) {
    var id = o.attr("id");
    var idarr = id.split('_');
    var labelid = idarr[0].replace(/ks/g, "").replace(/SQL/g, "").replace(/Special/g, "");
    var typeid = idarr[1]; //是否分页
    var channelid = idarr[2];
    var classid = idarr[3];
    var infoid = idarr[4];
    var specialid = idarr[5];
    if (id.substring(0, 7) == "Special") {
        loadPage('Special', id, labelid, 1, channelid, classid, infoid, refreshtype, specialid, userparam);
    } else if (id.substring(0, 2) == "ks") {
        if (typeid == 1) { //分页
            loadPage('Label', id, labelid, 1, channelid, classid, infoid, refreshtype, specialid, userparam);
        } else {
            getlabelcontent("plus/ajaxLabel.aspx", id, labelid, "Label", typeid, channelid, classid, infoid);
        }
    } else if (id.substring(0, 3) == "SQL") {
        var refreshtype = o.attr("refreshtype");
        var userparam = o.attr("userparam");
        if (idarr[1] == 1) {
            loadPage('SQL', id, labelid, 1, channelid, classid, infoid, refreshtype, specialid, userparam);
        } else {
            getlabelcontent("plus/ajaxLabel.aspx?1=1" + getUrlParam(), id, labelid, "SQL", userparam, channelid, classid, infoid);
        }
    }
};

function getlabelcontent(posturl, id, labelid, action, userparam, channelid, classid, infoid) {
    $.get(appurl + posturl, {
        action: action,
        labelid: labelid,
        userparam: userparam,
        channelid: channelid,
        m_classid: classid,
        m_infoid: infoid
    }, function(d) {
        $("#" + id).html(d);
    });
};

function loadPage(action, id, labelid, page, modelid, classid, infoid, refreshtype, specialid, userparam) {
        if (userparam == '') {
            $("#" + id).html("<div align='center'>正在读取数据...</div>");
        } else {
            $("span[userparam^='" + userparam + "']").html("<div align='center'>正在读取数据...</div>");
        }
        var s = appurl + "plus/ajaxLabel.aspx?action=" + action + "&ispage=1&objid=" + escape(id) + "&m_infoid=" + infoid + "&m_id=" + modelid + "&labelid=" + escape(labelid) + "&m_classid=" + classid + "&refreshtype=" + refreshtype + "&specialid=" + specialid + "&page=" + page + "&userparam=" + escape(userparam) + getUrlParam();
        $.ajax({
            type: "post",
            url: s,
            cache: false,
            success: function(d) {
                if (userparam == '') {
                    $("#" + id).html(d);
                } else {

                    $("span[userparam='" + userparam + "']").html(d);
                }

            }
        });
    };
    //取url传的参数

function getUrlParam() {
    var URLParams = new Object();
    var aParams = document.location.search.substr(1).split('&'); //substr(n,m)截取字符从n到m,split('o')以o为标记,分割字符串为数组
    if (aParams != '' && aParams != null) {
        var sum = new Array(aParams.length); //定义数组
        for (i = 0; i < aParams.length; i++) {
            sum[i] = new Array();
            var aParam = aParams[i].split('='); //以等号分割
            URLParams[aParam[0]] = aParam[1];
            sum[i][0] = aParam[0];
            sum[i][1] = aParam[1];
        }
        var p = '';
        for (i = 0; i < sum.length; i++) {
            p = p + '&' + sum[i][0] + "=" + sum[i][1];
        }
        return p;
    } else {
        return "";
    }
};

function turn(page, objId, userparam) {
        if (page == -1) {
            alert("已经是首页了！");
        } else if (page == -2) {
            alert("已经是最后一页了！");
        } else {
            var idarr = objId.split('_');
            var labelid = idarr[0].replace("ks", "").replace("SQL", "");
            var channelid = idarr[2];
            var classid = idarr[3];
            var infoid = idarr[4];
            var specialid = idarr[5];
            var refreshtype = $("#" + objId).attr("refreshtype");
            var action = 'Label';
            if (objId.substring(0, 3) == "SQL") action = 'SQL';
            loadPage(action, objId, labelid, page, channelid, classid, infoid, refreshtype, specialid, userparam);
        }
    };
    //============================Ajax标签结束==================================================

//判断是不是APP中打开，是返回 true 否则返回false
isOpenApp = function() {
    var YundabaoUA = navigator.userAgent; //获取当前的useragent
    if (YundabaoUA.indexOf('CK 2.0') > -1) //判断当前的ua中是否包含"CK 2.0"，如果包含"CK 2.0"标识当前在云打包的应用中
    {
        return true;
    } else {
        return false;
    }
};

//检查是否中文字符
is_zw = function(str) {
    exp = /[0-9a-zA-Z_.,#@!$%^&*()-+=|\?/<>]/g;
    if (str.search(exp) != -1) {
        return false;
    }
    return true;
};

// 检查是否有效的扩展名
IsExt = function(FileName, AllowExt) {
        var sTemp;
        var s = AllowExt.toUpperCase().split("|");
        for (var i = 0; i < s.length; i++) {
            sTemp = FileName.substr(FileName.length - s[i].length - 1);
            sTemp = sTemp.toUpperCase();
            s[i] = "." + s[i];
            if (s[i] == sTemp) {
                return true;
                break;
            }
        }
        return false;
    };
    //检查是否数字方法一
is_number = function(str) {
        exp = /[^0-9()-]/g;
        if (str.search(exp) != -1) {
            return false;
        }
        return true;
    };
    //检查数字方法二

function CheckNumber(Obj, DescriptionStr) {
        if (Obj.value != '' && (isNaN(Obj.value) || Obj.value < 0)) {
            alert(DescriptionStr + "应填有效数字！");
            Obj.focus();
            return false;
        }
        return true;
    };
    //检查电子邮件有效性
is_email = function(str) {
        if ((str.indexOf("@") == -1) || (str.indexOf(".") == -1)) {
            return false;
        }
        return true;
    };
    //检查是否手机号

function ismobile(s) {
    var p = /^(013|014|015|017|018|13|14|15|17|18)\d{9}$/;
    if (s.match(p) != null) {
        return true;
    }
    return false;
};
OpenWindow = function(Url, Width, Height, WindowObj) {
    var ReturnStr = showModalDialog(Url, WindowObj, 'dialogWidth:' + Width + 'pt;dialogHeight:' + Height + 'pt;status:no;help:no;scroll:no;status:0;help:0;scroll:0;');
    return ReturnStr;
};

function OpenThenSetValue(Url, Width, Height, WindowObj, SetObj, SetObj2) {
    var ReturnStr = showModalDialog(Url, WindowObj, 'dialogWidth:' + Width + 'pt;dialogHeight:' + Height + 'pt;status:no;help:no;scroll:no;status:0;help:0;scroll:0;');
    if (ReturnStr != '' && ReturnStr != undefined) {
        SetObj.value = ReturnStr;
        if (SetObj2 != undefined) SetObj2.value = ReturnStr;
        try {
            document.getElementById("show" + SetObj.id).src = ReturnStr;
        } catch (e) {}
    }
    return ReturnStr;
};

//后台统一调用选择文件FieldID 返回的text ID号,ChannelID模型ID
function SelectFiles(FieldID, ChannelID, pic, fun) {
    if (document.all || dialogType == 1) {
        var str = OpenThenSetValue('../Include/SelectFile.aspx?channelid=' + ChannelID, 650, 350, window, $('#' + FieldID)[0]);
        if (pic != '' && pic != undefined) {
            $("#" + pic).attr("src", str);
        }
        if (fun != '' && fun != undefined) {
            eval(fun);
        }

    } else {
        parent.openWin('选择文件', 'Include/SelectFile.aspx?fieldID=' + FieldID + "&channelid=" + ChannelID + "&fun=" + fun, false, 800, 480);
    }
};

//前台
function SelectUserFiles(FieldID, ChannelID, pic, fun) {
    if (document.all || dialogType == 1) {
        var str = OpenThenSetValue('/plus/Include/SelectFile.aspx?channelid=' + ChannelID, 650, 350, window, $('#' + FieldID)[0]);
        if (pic != '' && pic != undefined) {
            $("#" + pic).attr("src", str);
        }
        if (fun != '' && fun != undefined) {
            eval(fun);
        }

    } else {
        parent.openWin('选择文件', '/plus/Include/SelectFile.aspx?fieldID=' + FieldID + "&channelid=" + ChannelID + "&fun=" + fun, false, 800, 480);
    }
};

//后台选择模板
var dialogType = 0;

function SelectTemplate(FieldID, from3g) {
    if (dialogType == 1) {
        OpenThenSetValue('../include/KS.SelectTemplate.aspx?from3g=' + from3g, 500, 350, window, $('#' + FieldID)[0]);
    } else {
        parent.openWin('选择模板', 'include/KS.SelectTemplate.aspx?from3g=' + from3g + '&fieldID=' + FieldID, false, 750, 480);
    }
};
var box = '';

function Getcolor(obj, param) {
    box = $.dialog.open(appurl + 'plus/selectcolor.html?' + param, {
        id: 'colorbox',
        title: false,
        left: $('#' + obj).offset().left + 150,
        top: $('#' + obj).position().top + 110,
        width: 225,
        height: 148,
        min: false,
        max: false,
        padding: "0px 0px"
    });
    $('#' + obj).attr('src', '../../admin/images/rect.gif');
};

function ShowSkinPic(id) {
    $.ajax({
        type: "POST",
        url: appurl + "plus/ajaxs.ashx",
        data: "a=getSkinPic&skinid=" + id,
        success: function(data) {
            if (data == '') {
                $("#viewSkin").hide();
            } else {
                $("#viewSkin").show().attr("src", data);
            }
        }
    });
};
CheckEnglishStr = function(Obj, DescriptionStr) {
    var TempStr = Obj.value;
    var  i = 0;
    var  ErrorStr = '';
    var  CharAscii;
    if (TempStr != '') {
        for (i = 0; i < TempStr.length; i++) {
            CharAscii = TempStr.charCodeAt(i);
            if (CharAscii >= 255 || CharAscii <= 31) {
                ErrorStr = ErrorStr + TempStr.charAt(i);
            } else {
                if (!CheckErrorStr(CharAscii)) {
                    ErrorStr = ErrorStr + TempStr.charAt(i);
                }
            }
        }
        if (ErrorStr != '') {
            alert("出错信息:\n\n" + DescriptionStr + '发现非法字符:' + ErrorStr);
            Obj.focus();
            return false;
        }
        if (!(((TempStr.charCodeAt(0) >= 48) && (TempStr.charCodeAt(0) <= 57)) || ((TempStr.charCodeAt(0) >= 65) && (TempStr.charCodeAt(0) <= 90)) || ((TempStr.charCodeAt(0) >= 97) && (TempStr.charCodeAt(0) <= 122)))) {
            alert(DescriptionStr + '首字符只能够为数字或者字母');
            Obj.focus();
            return false;
        }
    }
    return true;
};
CheckErrorStr = function(CharAsciiCode) {
    var TempArray = new Array(43, 46, 34, 47, 92, 42, 58, 60, 62, 63, 124);
    for (var i = 0; i < TempArray.length; i++) {
        if (CharAsciiCode == TempArray[i]) { return false; }
    }
    return true;
};

InsertKeyWords = function(obj, KeyWords) {
    if (KeyWords != '') {
        if (obj.value.search(KeyWords) == -1) {
            if (obj.value == ''){
				obj.value = KeyWords;
			}
            else{ obj.value = obj.value + ' ' + KeyWords; 
			}
        }
    }
    if (KeyWords == 'Clean') {
        obj.value = '';
    }
    return;
};


CheckBox = function(checked) {
    $("input[type='checkbox']").attr("checked", checked);
};
CheckAll = function(form,obj) {
    $("input[type='checkbox']").each(function() {
        var tName = $(this).attr("name");
        if (tName != 'chkall' && $(this).attr("disabled") == undefined && tName.indexOf('$') < 0) {
           
            if ($('input[name="chkall"]')[0].checked == true) {
               
                this.checked = true;
                
            } else {
                this.checked = false;
            }
        }
    });

};

function InsertFileFromUp(FileList, fileSize, maxId, title, EditorId) {
    var files = FileList.split('/');
    var file = files[files.length - 1];
    var fileext = FileList.substring(FileList.lastIndexOf(".") + 1, FileList.length).toLowerCase();
    if (fileext == "gif" || fileext == "jpg" || fileext == "jpeg" || fileext == "bmp" || fileext == "png") {
        if (EditorId == ''){
            insertHTMLToEditor('<img src="' + FileList + '" border="0"/><br/>');
		}
        else{
            insertHTMLToEditorById(EditorId, '<img src="' + FileList + '" border="0"/><br/>');
		}
    } else if (fileext == "mp3" || fileext == "flv" || fileext == "mp4" || fileext == "f4v" || fileext == "wmv" || fileext == "swf" || fileext == "rm" || fileext == "rmvb") {
        var mheight = 450;
        if (fileext == "mp3") mheight = 100;
        if (EditorId == ''){
            insertHTMLToEditor('[media=' + fileext + ',500,' + mheight + ',1]' + FileList + '[/media]');
		}
        else{
            insertHTMLToEditorById(EditorId, '[media=' + fileext + ',500,' + mheight + ',1]' + FileList + '[/media]');
		}
    } else {
        var str = "<div class=\"quote\">[UploadFiles]" + maxId + "," + fileSize + ",." + fileext + "," + title + "[/UploadFiles]</div>";
        if (EditorId == '' || EditorId == undefined) {
            insertHTMLToEditor(str);
        } else {
            insertHTMLToEditorById(EditorId, str);
        }
    }
};

function insertHTMLToEditorById(editorId, codeStr) {
    eval(editorId + ".execCommand('insertHtml', '" + codeStr + "');");
};


//判断是否有选择复选框的值，参数op：edit修改
GetIDS = function(op) {
    var aa = document.getElementsByName("ids");
    var n = 0;
    for (var i = 0; i < aa.length; i++)
        if (aa[i].checked) n++;
    if (n == 0) {
        KesionJS.Alert('对不起，你没有选择记录!', null);
        return false;
    }
    if (op == 'del') {
        return (confirm('确定删除选中的记录吗?'));
    } else if (op == 'edit' && n > 1) {
        KesionJS.Alert('对不起，一次只能编辑一条记录!', null);
        return false;
    } else
        return true;
};
chk = function(obj) {
    var el = event.srcElement;
    var selectedcolor = '#E7F1FA';
    if (el.type == 'checkbox') {
        if (el.checked == true)
            obj.style.background = selectedcolor;
        else
            obj.style.background = '';
    } else {
        var chkbox = $(obj).find("input[type='checkbox']");
        if (chkbox.attr("checked") == undefined) {
            chkbox.attr("checked", true).parent().attr("class", "wCheck wCheck-mode-checkbox  wCheck-theme-square-classic-red wCheck-on");
            obj.style.background = selectedcolor;
        } else {
            obj.style.background = '#ffffff';
            chkbox.attr("checked", false).parent().attr("class", "wCheck wCheck-off wCheck-mode-checkbox  wCheck-theme-square-classic-red");
        }
    }
};

function Select(flag) {
    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];
        if (e.type == "checkbox") {
            switch (flag) {
                case 0:
                    e.checked = 'checked';
                    e.parentElement.parentElement.style.background = '#D2E3F2';
                    break;
                case 1: //反选
                    if (e.checked == '') {
                        e.checked = 'checked';
                        e.parentElement.parentElement.style.background = '#D2E3F2';
                    } else {
                        e.checked = '';
                        e.parentElement.parentElement.style.background = '';
                    }
                    break;
                case 2:
                    e.checked = '';
                    e.parentElement.parentElement.style.background = '';
                    break;
            }
            //   e.checked='checked';
        }
    }
};

// 修改编辑栏高度
function zoomtextarea(num, objname) {
    if ($("#" + objname).height() > 50 || num > 0) {
        $("#" + objname).height($("#" + objname).height() + num * 10);
    }

};

function showtips(str) {
    document.write('<div id="tips" style="display:none;" class="message">');
    document.write(str + '</div><div style="clear:both;"></div>');
    $("#tips").fadeIn("slow");
};

//显示提示层代码
function showhintinfo(obj, objleftoffset, objtopoffset, title, info, objheight, showtype, objtopfirefoxoffset) {
    var p = getposition(obj);

    if ((showtype == null) || (showtype == "")) {
        showtype == "up";
    }
    document.getElementById('hintiframe' + showtype).style.height = objheight + "px";

    document.getElementById('hintinfo' + showtype).innerHTML = info;
    document.getElementById('hintdiv' + showtype).style.display = 'block';

    if ((objtopfirefoxoffset != null) && !IsIE) {
        document.getElementById('hintdiv' + showtype).style.top = p['y'] + objtopfirefoxoffset + "px";
    } else {

        if (objtopoffset == 0) {
            if (showtype == "up") {
                document.getElementById('hintdiv' + showtype).style.top = p['y'] - document.getElementById('hintinfo' + showtype).offsetHeight - 40 + "px";
            } else {
                document.getElementById('hintdiv' + showtype).style.top = p['y'] + obj.offsetHeight + 5 + "px";
            }
        } else {
            document.getElementById('hintdiv' + showtype).style.top = p['y'] + objtopoffset + "px";
        }
    }
    document.getElementById('hintdiv' + showtype).style.left = p['x'] + objleftoffset + "px";

};

function getposition(obj) {
    var r = new Array();
    r['x'] = obj.offsetLeft;
    r['y'] = obj.offsetTop;
    while (obj = obj.offsetParent) {
        r['x'] += obj.offsetLeft;
        r['y'] += obj.offsetTop;
    }
    return r;
};


//隐藏提示层代码
function hidehintinfo() {
    document.getElementById('hintdivup').style.display = 'none';
    document.getElementById('hintdivdown').style.display = 'none';
};


//==================================================Digg模块开始==================================================
digg = function(diggtype, channelid, infoid, installdir) {
    $.ajax({
        url: installdir + 'plus/Ajaxs.ashx',
        cache: false,
        data: 'a=digg&action=hits&ChannelID=' + channelid + '&infoid=' + infoid + '&diggtype=' + diggtype,
        success: function(returnvalue) {
            switch (returnvalue) {
                case "err":
                    KesionJS.Message('error.gif', 'digg error!', null);
                    break;
                case "over":
                    KesionJS.Message('error.gif', '您已评分过了，不能重复评分！', null);
                    break;
                case "nologin":
                    KesionJS.Message('error.gif', '您还没有登录，不能推荐!', null);
                    break;
                default:
                    try {
                        var sarr = returnvalue.split('|');
                        $('#s' + diggtype + sarr[0]).html(sarr[1 + diggtype]);
                        $('#d' + diggtype + sarr[0]).html("<a href='" + installdir + "index.aspx?c=model&a=dig' target='_blank'>查看</a>");
                    } catch (e) {}
                    try {
                        showdigg(returnvalue);
                    } catch (e) {}
            }
        }
    });
};

show_digg = function(diggtype, channelid, infoid, installdir) {
    $('#s' + diggtype + infoid).html("<img src='" + installdir + "sysimg/loading.gif' />");
    $.ajax({
        url: installdir + "plus/Ajaxs.ashx",
        cache: false,
        data: "a=digg&channelid=" + channelid + "&infoid=" + infoid + "&action=show&diggtype=" + diggtype,
        success: function(obj) {
            ShowDiggNum(obj, diggtype);
        }
    });

};
ShowDiggNum = function(returnvalue, diggtype) {
    var rarr = returnvalue.split('|');
    $('#s' + diggtype + rarr[0]).html(rarr[1 + diggtype]);
};
show_digg1 = function(channelid, infoid, installdir) {
    $.ajax({
        url: installdir + "plus/Ajaxs.ashx",
        cache: false,
        data: "a=digg&channelid=" + channelid + "&infoid=" + infoid + "&action=show",
        success: function(obj) {
            showdigg(obj);
        }
    });
};
showdigg = function(r) {
        try {
            var rarr = r.split('|');
            $("#s" + rarr[0]).html(rarr[1]);
            $("#c" + rarr[0]).html(rarr[2]);
            var znum = $("#s" + rarr[0]).html();
            var cnum = $("#c" + rarr[0]).html();
            var totalnum = parseInt(znum) + parseInt(cnum);
            if (parseInt(znum) == 0) {
                $("#perz" + rarr[0]).html('0%');
            } else {
                $("#perz" + rarr[0]).animate({
                    opacity: 0
                }, 1).html(((znum * 100) / totalnum).toFixed(2) + '%').animate({
                    opacity: 0.2
                }, 300).animate({
                    opacity: 0.5
                }, 200).animate({
                    opacity: 0.7
                }, 300).animate({
                    opacity: 1
                }, 800);
            }
            if (parseInt(cnum) == 0) {
                $("#perc" + rarr[0]).html('0%');
            } else {
                $("#perc" + rarr[0]).animate({
                    opacity: 0
                }, 1).html(((cnum * 100) / totalnum).toFixed(2) + '%').animate({
                    opacity: 0.2
                }, 300).animate({
                    opacity: 0.5
                }, 200).animate({
                    opacity: 0.7
                }, 300).animate({
                    opacity: 1
                }, 800);
            }
            $("#digzcimg").width(parseInt((znum / totalnum) * 55));
            $("#digcimg").width(parseInt((cnum / totalnum) * 55));
        } catch (e) {}
    };
    //==================================================Digg模块结束==================================================

//点分享加积分
function addScore(classid, infoid) {
        $.ajax({
            type: "POST",
            url: appurl + "plus/Ajaxs.ashx",
            data: "classid=" + classid + "&infoid=" + infoid + "&a=shareaddscore",
            success: function(data) {

            }
        });
        return true;
    };
    //点广告

function clickAds(adid, bid) {
    $.ajax({
        type: "POST",
        url: appurl + "plus/Ajaxs.ashx",
        data: "adid=" + adid + "&bid=" + bid + "&a=clickads",
        success: function(data) {

        }
    });
    return true;
};

//===========================以下是一些常用JS===============================================
var KesionJS = {
    //通用对话框
    Alert: function(msg, act) {
        if (frameElement == null || frameElement.api == undefined) {
            this.Alert1(msg, act);
        } else {
            var api = frameElement.api,
                W = api.opener;
            W.$.dialog.alert(msg, function() {
                setTimeout(function() {
                    eval(act);
                }, 1);
            });
        }
    },
    Alert1: function(msg, act) {
        $.dialog.alert(msg, function() {
            eval(act);
        });
    },
    AlertByTime: function(src, msg, t) {
        if (src == 1) {
            src = "success.gif";
        } else {
            src = "error.gif";
        }
        if (t == ''){ t = 2; }
        $.dialog.tips(msg, t, src, function() {});

    },
    Confirm: function(msg, fun1, fun2) {
        if (frameElement == null || frameElement.api == undefined) {
            this.Confirm1(msg, fun1, fun2);
        } else {
            var api = frameElement.api,
                W = api.opener;
            W.$.dialog.confirm(msg, function() {
                setTimeout(function() {
                    eval(fun1);
                }, 1);
            }, function() {
                setTimeout(function() {
                    eval(fun2);
                }, 1);
            });
        }
    },
    Confirm1: function(msg, fun1, fun2) {
        $.dialog.confirm(msg, function() {
            eval(fun1);
        }, function() {
            eval(fun2);
        });
    },
    Message: function(ico, msg, fun) {
        if (frameElement == null || frameElement.api == undefined) {
            this.Message1(ico, msg, fun);
        } else {
            var api = frameElement.api,
                W = api.opener;
            W.$.dialog.tips(msg, 2, ico, function() {
                setTimeout(function() {
                    eval(fun);
                }, 1);
            });

        }
    },
    Message1: function(ico, msg, fun) {
        $.dialog.tips(msg, 2);
        setTimeout(function() {
            eval(fun);
        }, 2000);
    },
    Tips: function(title, msg, w, h) {
        $.dialog({
            title: title,
            content: msg,
            width: w,
            height: h,
            max: false,
            min: false
        });
    },
    GetFileNameArea: function(val) {
        if (val == 0) {
            $('#filearea').css("display", "none");
        } else {
            $('#filearea').css("display", "");
        }
    },
    GetTemplateArea: function(val) {
        if (val == 2) {
            $('#templatearea').css("display", "none");
        } else {
            $('#templatearea').css("display", "");
        }
    },
    //word存图
    saveWordPic: function(callfrom, id) {

        var html = '';
        if (id != '' && id != undefined)
            html = eval('editor' + id + '.getContent()');
        else
            html = editor.getContent();
        var wordpic;
        try {
            wordpic = new ActiveXObject("Kesion.Word");
        } catch (exception) {
            KesionJS.Alert('您没有安装KesionCMS Word图片上传插件或您的浏览器不支持!', null);
            return;
        }
        if (html == '') {
            KesionJS.Alert('编辑器中没有内容!', null);
            return;
        }

        $('#ajaxmsg', window.parent.document).toggle();
        var temp = "";
        var strBase64 = "";

        var reg = /<img[\s\S]*?="file:\/\/\/[\s\S]*?"[\s\S]*?>/ig;
        var result = html.match(reg);
        if (result) {
            for (i = 0; i < result.length; i++) {
                var str = result[i];
                var src = str.split("file:\/\/\/")[1];
                src = src.split('"')[0];
                var source = "file:\/\/\/" + src;
                html = html.replace(str, "<img src='" + source + "'/>");
                var temppic = wordpic.ImageToBase64(src);
                //alert(str + "|" + temppic + "$");
                if (temppic != "") {
                    temp += source + "|" + temppic + "$";
                }
            }
            if (temp != "") {
                strBase64 = temp.substring(0, temp.length - 1);
            }
        }
        //alert(html);
        //        return strBase64;
        //document.write(html);
        //return;
        strBase64 = strBase64.replace(/\+/ig, "*");
        try {
            var oXmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            var postdata = "callfrom=" + callfrom + "&html=" + escape(html) + "&strbase64=" + escape(strBase64);
            //alert(postdata);
            oXmlHttp.open("POST", appurl + "plus/WordUploadPic.aspx", false);
            oXmlHttp.setRequestHeader("Content-Length", postdata.length);
            oXmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            oXmlHttp.send(postdata);
            if (oXmlHttp.readyState == 4) {
                if (oXmlHttp.status == 200) {
                    html = oXmlHttp.responseText;
                    if (id != '' && id != undefined) {
                        eval('editor' + id + '.setContent(html)');
                    } else {
                        editor.setContent(html);
                    }
                    $('#ajaxmsg', window.parent.document).toggle();
                    return;
                }
            }
        } catch (exception) {
            return;
        }
        return;
    }

};
//===========================JS结束=============================================================


function showuserlogin() {
        $.dialog.open(appurl + "plus/userlogin.aspx", {
            id: "loginbox",
            lock: true,
            fixed: true,
            title: "<div style='text-align:left'><img src='" + appurl + "sysimg/default/user.png' align='absmiddle'>用户登录</div>",
            width: 380,
            height: 500,
            max: false,
            min: false
        });
    };
    //检查是不是数字
isNumber = function(e) {
    if ($.browser.msie) {
        if (((event.keyCode > 47) && (event.keyCode < 58)) ||
            (event.keyCode == 8)) {
            return true;
        } else {
            return false;
        }
    } else {
        if (((e.which > 47) && (e.which < 58)) ||
            (e.which == 8)) {
            return true;
        } else {
            return false;
        }
    }
};

//打印指定区域
function PrintPage(myDiv) {
    var newstr = document.getElementById(myDiv).innerHTML;
    var oldstr = document.body.innerHTML;
    newstr += "<style>";
    newstr += "@media print { .noprint{display:none;}";
    newstr += "a{ color:#555;text-decoration:none;}";
    newstr += "table{ width:100%;  border:#000 solid 1px; border-collapse:collapse;}";
    newstr += "table .CTitle td,table .CTitle th{font-family:微软雅黑;font-size:18px; height:35px;line-height:35px;text-align:center; background-color:#ddd;padding:0 5px;border:#000 solid 1px; color:#555; white-space:nowrap;  }";
    newstr += "table td{ font-family:微软雅黑;font-size:17px;background:#FFF;border:#000 solid 1px;height:25px;line-height:25px;padding:5px;  }";
    newstr += "}</style>";
    document.body.innerHTML = newstr;
    var oldcss = $("link").attr("href");
    $("link").attr("href", "");
    window.print();
    document.body.innerHTML = oldstr;
    $("link").attr("href", oldcss);
    return false;
};

var sAgent = navigator.userAgent.toLowerCase();
var IsIE = sAgent.indexOf("msie") != -1;


/*******显示等待提示消********/
function showWaitInfo(info, obj) {
    try {
        if (obj == null) return;
        clearWaitInfo();
        var newd = document.createElement("span");
        newd.className = 'waitInfo';
        newd.id = 'waitInfo';
        newd.innerHTML = info;
        obj.parentNode.appendChild(newd);
    } catch (e) {}
};

function clearWaitInfo() {
    try {
        if ($('#waitInfo')) {
            $('#waitInfo')[0].parentNode.removeChild($('#waitInfo')[0]);
        }
    } catch (e) {}
};

function AddFavorite(sURL, sTitle) {
    try { //IE
        window.external.addFavorite(sURL, sTitle);
    } catch (e) {
        try { //Firefox
            window.sidebar.addPanel(sTitle, sURL, "");
        } catch (e) {
            try { //Chrome无法自动收藏，用创建快应用程序的捷方式来替代。Js特效大全 www.www.111cn.net
                createShortcut();
            } catch (e) {
                alert("请按Ctrl+D之后按“确定”完成收藏!");
            }
        }
    }
};

function setHomepage(pageURL) {
    if (document.all) {
        document.body.style.behavior = 'url(#default#homepage)';
        document.body.setHomePage(pageURL);
    } else {
        try { //IE
            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
        } catch (e) {
            try { //Firefox
                var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                prefs.setCharPref('browser.startup.homepage', pageURL);
            } catch (e) {
                alert("您的浏览器不支持该操作，请使用浏览器菜单手动设置.");
            }
        }
    }
};

//和当前时间比较,大于当前时间返回true 否则返回false
function compareCurrTime(date) {
    var beginTime = StringToDate(date)
    var nowTime = new Date();
    var tt = nowTime.getTime() - beginTime.getTime();
    if (tt <= 0) {
        return true;
    } else {
        return false;
    }
};

//显示剩余时间
var serverTime = new Date();
var dateTime = new Date();
var difference = dateTime.getTime() - serverTime.getTime();

function StringToDate(DateStr) {
    var converted = Date.parse(DateStr);
    var myDate = new Date(converted);

    if (isNaN(myDate)) {
        var arys = DateStr.split(' ');
        var arys1 = arys[0].split('-');
        var arys2 = arys[1].split(':');
        myDate = new Date(arys1[0], --arys1[1], arys1[2], arys2[0], -arys2[1], arys2[2]);
    }

    return myDate;
};

function show_date_time(begin, end, bjq, f) {
    if (begin == '' || end == '') return;
    var beginTime = StringToDate(begin);
    var endTime = StringToDate(end);
    var nowTime = new Date();
    var nMS = endTime.getTime() - nowTime.getTime() + difference;
    var myD = Math.floor(nMS / (1000 * 60 * 60 * 24));
    var myH = Math.floor(nMS / (1000 * 60 * 60)) % 24;
    var myM = Math.floor(nMS / (1000 * 60)) % 60;
    var myS = Math.floor(nMS / 1000) % 60;
    var myMS = Math.floor(nMS / 100) % 10;
    if (myD >= 0) {
        var str = '';
        var left = '';
        if (myD > 0) str = "<span><font class='d'>" + myD + "</font>天</span>";
        str += "<span><font class='h'>" + myH + "</font>小时</span><span><font class='m'>" + myM + "</font>分</span><span><font class='s'>" + myS + "." + myMS + "</font>秒</span>";
        str = left + str;
    } else {
        var str = "";
        if (f == 0) {
            var tt = beginTime.getTime() - nowTime.getTime();
            if (tt > 0) {
                str = "火爆进行中...";
            } else {
                str = "已结束.";
            }
        } else if (f == 2) { //一元购开奖
            str = "开奖中...";
        } else {
            str = "已结束.";
        }
    }
    $("#" + bjq).html(str);
    var tfun = "show_date_time('" + begin + "','" + end + "','" + bjq + "','" + f + "')";
    eval("t" + bjq + "=window.setTimeout(tfun, 100);");

};

function show_date_time2(begin, end, bjq, f) {
    if (begin == '' || end == '') return;
    var beginTime = StringToDate(begin);
    var endTime = StringToDate(end);
    var nowTime = new Date();
    var nMS = endTime.getTime() - nowTime.getTime() + difference;
    var myD = Math.floor(nMS / (1000 * 60 * 60 * 24));
    var myH = Math.floor(nMS / (1000 * 60 * 60)) % 24;
    var myM = Math.floor(nMS / (1000 * 60)) % 60;
    var myS = Math.floor(nMS / 1000) % 60;
    var myMS = Math.floor(nMS / 100) % 10;
    if (myD >= 0) {
        var str = '';
        if (myD > 0) str = "" + myD + ":";
        str += "" + myH + ":" + myM + ":" + myS + "." + myMS + "";
    } else {
        var str = "";
        if (f == 0) {
            var tt = beginTime.getTime() - nowTime.getTime();
            if (tt > 0) {
                str = "火爆进行中...";
            } else {
                str = "已结束.";
            }
        } else if (f == 2) { //一元购开奖
            str = "开奖中...";
        } else {
            str = "已结束.";
        }
    }
    $("#" + bjq).html(str);
    var tfun = "show_date_time2('" + begin + "','" + end + "','" + bjq + "','" + f + "')";
    eval("t" + bjq + "=window.setTimeout(tfun, 100);");
};


function scrollDoor() {};
scrollDoor.prototype = {
    sd: function(menus, divs, openClass, closeClass) {
        var _this = this;
        if (menus.length != divs.length) {
            alert("菜单层数量和内容层数量不一样!");
            return false;
        }
        for (var i = 0; i < menus.length; i++) {
            _this.$$(menus[i]).value = i;
            _this.$$(menus[i]).onmouseover = function() {

                for (var j = 0; j < menus.length; j++) {
                    _this.$$(menus[j]).className = closeClass;
                    //_this.$$(divs[j]).style.display = "none";
                    $("#" + divs[j]).hide();
                }
                _this.$$(menus[this.value]).className = openClass;
                $("#" + divs[this.value]).show();
                //_this.$$(divs[this.value]).style.display = "block";				
            }
        }
    },
    $$: function(oid) {
        if (typeof(oid) == "string")
            return document.getElementById(oid);
        return oid;
    }
};

// utility function called by getCookie( )
function getCookieVal(offset) {
        var endstr = document.cookie.indexOf(";", offset);
        if (endstr == -1) {
            endstr = document.cookie.length;
        }
        return unescape(document.cookie.substring(offset, endstr));
    };
    // primary function to retrieve cookie by name

function getCookie(name) {
        var arg = name + "=";
        var alen = arg.length;
        var clen = document.cookie.length;
        var i = 0;
        while (i < clen) {
            var j = i + alen;
            if (document.cookie.substring(i, j) == arg) {
                return getCookieVal(j);
            }
            i = document.cookie.indexOf(" ", i) + 1;
            if (i == 0) break;
        }
        return "";
    };
    // store cookie value with optional details as needed

function setCookie(name, value) {
        document.cookie = name + "=" + escape(value);
 };
    // remove the cookie by setting ancient expiration date

function deleteCookie(name, path, domain) {
    if (getCookie(name)) {
        document.cookie = name + "=";
    }
};
