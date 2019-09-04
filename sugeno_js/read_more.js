$(function(){
	$('.readmore').click(function(){
		//$(this).hide();
		$(this).parent('.main').toggleClass('onhidden');
		var text = $(this).children('span').text();
		if(text == "続きを読む"){
			$(this).children('span').text("閉じる");
			$(this).css({'background':'none'});
			$(this).css({'position':'static'});
		}
		else{
			$(this).children('span').text("続きを読む");
			$(this).css({'position':'absolute'});
			$(this).css({'background':'rgba(0, 0, 0, 0) linear-gradient(180deg, rgba(255, 255, 255, 0.5), white) repeat scroll 0 0'});
		}
	});
});


