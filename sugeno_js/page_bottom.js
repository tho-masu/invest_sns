jQuery(function() {
    var pagebottom = $('#page_bottom');
    var show_content = $('#bottom_content').offset().top;
    $(window).scroll(function () {
        if ($(this).scrollTop() > show_content) {  //100pxスクロールしたら表示
            pagebottom.fadeOut();
        } else {
            pagebottom.fadeIn();
        }
    });

    pagebottom.click(function () {


        $('body,html').animate({
            scrollTop: show_content
        }, 500); //0.5秒かけてトップへ移動
        return false;
    });
});