$(function () {
	//导航
	$('.nav-lv1-li').hover(function () {
		$(this).find('.top-cate').addClass('cur').next().fadeIn(200);
	}, function () {
		$(this).find('.top-cate').removeClass('cur').next().fadeOut(200);
	});

	//浮动导航
	if( $.browser.msie){
		if($.browser.version =="6.0" || $.browser.version =="7.0" || $.browser.version =="8.0"){
			$('#browser').show();	
		}
	}
	$('#browser').on('click','.close',function(){
		$('#browser').animate({'top':'-99px'},400);
	})
	$('#side_bar').on('mouseenter','li',function(){
		$(this).find('a').animate({'width':'135px'},100)
	})
	$('#side_bar').on('mouseleave','li',function(){
		$(this).find('a').stop().animate({'width':'45px'},100)
	})
	$('#backtop').on('click',function(){
		$('html,body').animate({'scrollTop':0},300);
	})
	
});

//滑动门
function setTab(name,cursel,n){
    for(i=1;i<=n;i++){
        var menu=document.getElementById(name+i);
        var con=document.getElementById("con_"+name+"_"+i);
        menu.className=i==cursel?"hover":"";
        con.style.display=i==cursel?"block":"none";
    }
}

$(function () {
	var timeout         = 500;
	var closetimer      = 0;
	var ddmenuitem      = 0;

	function nav_open()
	{   nav_canceltimer();
	    nav_close();
	    ddmenuitem = $(this).find('ul').eq(0).css('visibility', 'visible');
	    ddmenuitemm = $(this).find('a').eq(0).addClass('curr');}

	function nav_close()
	{   if(ddmenuitem) {
		ddmenuitem.css('visibility', 'hidden');
		ddmenuitemm.removeClass('curr');
	};

	}

	function nav_timer()
	{   closetimer = window.setTimeout(nav_close, timeout);}

	function nav_canceltimer()
	{   if(closetimer)
	    {   window.clearTimeout(closetimer);
	        closetimer = null;}}

	$(document).ready(function()
	{   $('#nav > li').bind('mouseover', nav_open);
	    $('#nav > li').bind('mouseout',  nav_timer);});

	document.onclick = nav_close;
})