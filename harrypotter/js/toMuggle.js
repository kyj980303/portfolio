
$(function(){
    $('.wrap .main p').eq(0).addClass('fadeIn')
    $('.wrap .main p').eq(1).addClass('slideDown')
    $('.authortxt p').eq(1).addClass('fadeIn2')
    $('.harryimg li').eq(0).addClass('slideLeft1')
    $('.harryimg li').eq(1).addClass('slideRight1')
    $('.harryimg li').eq(2).addClass('slideLeft2')
    $('.harryimg li').eq(3).addClass('slideRight2')

    $(window).scroll(function(){
        var win_top = $(window).scrollTop()

        if(win_top >= 200){
            $('.authortxt2 span').eq(1).addClass('fadeIn1')
            $('.authortxt2 span').eq(2).addClass('fadeIn4')
            $('.authortxt2 span').eq(3).addClass('fadeIn5')
            $('.authortxt2 span').eq(4).addClass('fadeIn6')
            
        } else {
            $('.authortxt2 span').eq(1).removeClass('fadeIn1')
            $('.authortxt2 span').eq(2).removeClass('fadeIn4')
            $('.authortxt2 span').eq(3).removeClass('fadeIn5')
            $('.authortxt2 span').eq(4).removeClass('fadeIn6')
        }
        if(win_top >= 400){
            $('.hogwarts p').eq(1).addClass('slideUp')
        } else {
            $('.hogwarts p').eq(1).removeClass('slideUp')
        }
        if(win_top >= 600){
            $('.harmioneimg li').eq(0).addClass('slideLeft1')
            $('.harmioneimg li').eq(1).addClass('slideRight1')
            $('.harmioneimg li').eq(2).addClass('slideLeft2')
            $('.harmioneimg li').eq(3).addClass('slideRight2')
        } else {
            $('.harmioneimg li').eq(0).removeClass('slideLeft1')
            $('.harmioneimg li').eq(1).removeClass('slideRight1')
            $('.harmioneimg li').eq(2).removeClass('slideLeft2')
            $('.harmioneimg li').eq(3).removeClass('slideRight2')
        }
        if(win_top >= 1400){
            $('.dormitory p').addClass('slideDown2')
        } else {
            $('.dormitory p').removeClass('slideDown2')
        }
        if(win_top >= 1600){
            $('.dorm li img').eq(0).addClass('fadeIn1')
            $('.dorm li img').eq(2).addClass('fadeIn4')
            $('.dorm li img').eq(1).addClass('fadeIn0')
            $('.dorm li img').eq(3).addClass('fadeIn3')
            $('.authortxt3 span').eq(1).addClass('fadeIn1')
            $('.authortxt3 span').eq(2).addClass('fadeIn4')
            $('.authortxt3 span').eq(3).addClass('fadeIn5')
        } else {
            $('.dorm li img').eq(0).removeClass('fadeIn1')
            $('.dorm li img').eq(2).removeClass('fadeIn4')
            $('.dorm li img').eq(1).removeClass('fadeIn0')
            $('.dorm li img').eq(3).removeClass('fadeIn3')
            $('.authortxt3 span').eq(1).removeClass('fadeIn1')
            $('.authortxt3 span').eq(2).removeClass('fadeIn4')
            $('.authortxt3 span').eq(3).removeClass('fadeIn5')
        }
        if(win_top >= 1600){
            $('.ronimg li').eq(0).addClass('slideLeft1')
            $('.ronimg li').eq(1).addClass('slideRight1')
            $('.ronimg li').eq(2).addClass('slideLeft2')
            $('.ronimg li').eq(3).addClass('slideRight2')
        } else {
            $('.ronimg li').eq(0).removeClass('slideLeft1')
            $('.ronimg li').eq(1).removeClass('slideRight1')
            $('.ronimg li').eq(2).removeClass('slideLeft2')
            $('.ronimg li').eq(3).removeClass('slideRight2')
        }
        if(win_top >= 2600){
            $('.previewtxt span').eq(0).addClass('fadeIn1')
            $('.previewtxt span').eq(1).addClass('fadeIn4')
            $('.authortxt4 span').eq(1).addClass('fadeIn1')
            $('.authortxt4 span').eq(2).addClass('fadeIn4')
            $('.authortxt4 span').eq(3).addClass('fadeIn0')
        } else {
            $('.previewtxt span').eq(0).removeClass('fadeIn1')
            $('.previewtxt span').eq(1).removeClass('fadeIn4')     
            $('.authortxt4 span').eq(1).removeClass('fadeIn1')
            $('.authortxt4 span').eq(2).removeClass('fadeIn4')
            $('.authortxt4 span').eq(3).removeClass('fadeIn0')
        }
        
        if(win_top >= 2600){
            $('.malfoyimg li').eq(0).addClass('slideLeft1')
            $('.malfoyimg li').eq(1).addClass('slideRight1')
            $('.malfoyimg li').eq(2).addClass('slideLeft2')
            $('.malfoyimg li').eq(3).addClass('slideRight2')
        } else {
            $('.malfoyimg li').eq(0).removeClass('slideLeft1')
            $('.malfoyimg li').eq(1).removeClass('slideRight1')
            $('.malfoyimg li').eq(2).removeClass('slideLeft2')
            $('.malfoyimg li').eq(3).removeClass('slideRight2')
        }
        if(win_top >= 3300){
            $('.authortxt5 span').eq(1).addClass('fadeIn1')
            $('.authortxt5 span').eq(2).addClass('fadeIn4')
        } else {
            $('.authortxt5 span').eq(1).removeClass('fadeIn1')
            $('.authortxt5 span').eq(2).removeClass('fadeIn4')
        }
        if(win_top >= 3600){
            $('.magicwand p').addClass('slideDown2')
        } else {
            $('.magicwand p').removeClass('slideDown2')
        }
    })
})