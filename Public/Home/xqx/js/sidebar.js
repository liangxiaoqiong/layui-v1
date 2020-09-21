$(function(){
	if( $.browser.msie){
		if($.browser.version =="6.0" || $.browser.version =="7.0" || $.browser.version =="8.0"){
			$('#browser').show();	
		}
	}
	$('#browser').on('click','.close',function(){
		$('#browser').animate({'top':'-99px'},400);
	})
	$('#side_bar').on('mouseenter','li',function(){
		$(this).find('a').animate({'width':'150px'},100)
	})
	$('#side_bar').on('mouseleave','li',function(){
		$(this).find('a').stop().animate({'width':'50px'},100)
	})
	$('#backtop').on('click',function(){
		$('html,body').animate({'scrollTop':0},300);
	})
	
})