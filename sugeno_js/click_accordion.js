$(function(){
	$('.click_open').click(function(){
		$(this).next().next().slideToggle();
	});
})