            $(document).ready(function(e) { 
                var in_out_time = 800 //渐显时间 
                var scroll_Interval_time = 2000 //滚动间隔时间 
                var scroll_time = 1000 //滚动动画时间 

                addli() 

                function addli(){ 
                $("#scroll_List").css("top",0); 
                $("#scroll_List li:last").clone().prependTo("#scroll_List"); 
                $("#scroll_List li:first").css("opacity",0); 
                $("#scroll_List li:first").animate({opacity:1},in_out_time); 
                setTimeout(delLi_last,scroll_Interval_time) 
                } 

                function delLi_last(){ 
                $("#scroll_List li:last").detach(); 
                $("#scroll_List").animate({top:100},scroll_time,addli) 
                } 

            }); 