/**
 * Created by 左江涛 on 2017/1/23.
 */


(function ($) {
    // 头部导航栏效果
    $('.header .hd-link1-b').click(function () {
        $(this).addClass('sel').siblings().removeClass('sel');
    });
    //顶部链接跳转
    $('.hd-link1').find('li:eq(0)').click(function () {
        window.location.href = 'company.html';
    });
    $('.hd-link1').find('li:eq(1)').click(function () {
        window.location.href = 'company.html';
    });
    $('.hd-link1').find('li:eq(2)').click(function () {
        window.location.href = 'Login.html';
    });
    $('.hd-link1').find('li:eq(3)').click(function () {
        window.location.href = 'Login.html';
    });

    $('.hd-link2').find('li:eq(0)').click(function () {
        window.location.href = '../index.html';
    });
})(jQuery);
