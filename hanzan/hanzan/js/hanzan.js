$(window).resize(function(){
    if($(window).width() < 769) {
        $('.nav').hide()
        $('.btn_nav').show()
    }else {
        $('.btn_nav').hide()
        $('.nav').show()
    }
}).resize();

$(function(){
    $('.nav .main-menu a').eq(1).click(function(){
        $('.sub-menu1').slideToggle()
    })
    $('.nav .main-menu a').eq(8).click(function(){
        $('.sub-menu2').slideToggle()
    })
    $('.nav .main-menu a').eq(5).click(function(){
        $('.sub-menu3').slideToggle()
    })
    $('.nav .sub-menu1').mouseleave(function(){
        $('.sub-menu1').slideToggle()
    })
    $('.nav .sub-menu2').mouseleave(function(){
        $('.sub-menu2').slideToggle()
    })
    $('.nav .sub-menu3').mouseleave(function(){
        $('.sub-menu3').slideToggle()
    })
    
    // nav2
    $('.btn_nav img').click(function(){
        $('.nav2').fadeIn()
    })
    $('.nav2 .nav_inner .close img').click(function(){
        $('.nav2').fadeOut()
    })

    $('.nav2 .nav_inner .gnb li:eq(1) a img').click(function(){
        $('.nav2 .nav_inner .gnb li:eq(1) .sub_wrap').slideToggle()
    })
    $('.nav2 .nav_inner .gnb li:eq(5) a img').click(function(){
        $('.nav2 .nav_inner .gnb li:eq(5) .sub_wrap').slideToggle()
    })
    $('.nav2 .nav_inner .gnb li:eq(8) a img').click(function(){
        $('.nav2 .nav_inner .gnb li:eq(8) .sub_wrap').slideToggle()
    })




    $('.desertctg p').eq(1).click(function(){
        $('.submtead2').hide() 
        $('.submtead').show()
        $('.desertctg p').eq(1).css('color','#99ac39') 
        $('.desertctg p').eq(1).css('border-bottom','2px solid #99ac39') 
        $('.desertctg p').eq(2).css('color','#000') 
        $('.desertctg p').eq(2).css('border-bottom','none')  
    })
    $('.desertctg p').eq(2).click(function(){
        $('.submtead2').show() 
        $('.submtead').hide()
        $('.desertctg p').eq(2).css('color','#99ac39') 
        $('.desertctg p').eq(2).css('border-bottom','2px solid #99ac39')
        $('.desertctg p').eq(1).css('color','#000') 
        $('.desertctg p').eq(1).css('border-bottom','none')  
    })

    $('.mypage .mypagenav li').eq(0).click(function(){
        $('.myupdate').show() 
        $('.orderlist').hide() 
        $('.wishlist').hide() 
        $('.mypage .mypagenav li').eq(0).css('background-color','#fff') 
        $('.mypage .mypagenav li').eq(0).css('border-bottom','none') 
        $('.mypage .mypagenav li').eq(1).css('background-color','#f6f6f6')
        $('.mypage .mypagenav li').eq(1).css('border-bottom','1px solid #000')
        $('.mypage .mypagenav li').eq(2).css('background-color','#f6f6f6')
        $('.mypage .mypagenav li').eq(2).css('border-bottom','1px solid #000')
    })
    $('.mypage .mypagenav li').eq(1).click(function(){
        $('.myupdate').hide() 
        $('.wishlist').show() 
        $('.orderlist').hide() 
        $('.mypage .mypagenav li').eq(1).css('background-color','#fff')
        $('.mypage .mypagenav li').eq(1).css('border-bottom','none')
        $('.mypage .mypagenav li').eq(0).css('background-color','#f6f6f6') 
        $('.mypage .mypagenav li').eq(0).css('border-bottom','1px solid #000')
        $('.mypage .mypagenav li').eq(2).css('background-color','#f6f6f6')
        $('.mypage .mypagenav li').eq(2).css('border-bottom','1px solid #000')
    })
    $('.mypage .mypagenav li').eq(2).click(function(){
        $('.myupdate').hide() 
        $('.wishlist').hide() 
        $('.orderlist').show() 
        $('.mypage .mypagenav li').eq(1).css('background-color','#f6f6f6')
        $('.mypage .mypagenav li').eq(1).css('border-bottom','1px solid #000')
        $('.mypage .mypagenav li').eq(0).css('background-color','#f6f6f6') 
        $('.mypage .mypagenav li').eq(0).css('border-bottom','1px solid #000')
        $('.mypage .mypagenav li').eq(2).css('background-color','#fff')
        $('.mypage .mypagenav li').eq(2).css('border-bottom','none')
    })



    $('.main .maintxt p').addClass('fadeIn')
    $('.main .maintxt p span').eq(0).addClass('fadeIn1')

    $('.harumain span').eq(0).addClass('fadeIn')
    $('.harumain span').eq(1).addClass('fadeIn3')
    $('.harumain span').eq(2).addClass('fadeIn2')

    $('.teapotmain .teapottxt p').eq(1).addClass('fadeIn33')

    $('.desertmain .deserttxt p').addClass('fadeIn33')
    $('.desertmain2 .deserttxt p').addClass('fadeIn33')

    setInterval(function () {
        $('.arr').animate({'opacity': 0} ,500 , function () {
            $('.arr').animate({'opacity': 0.8}, 500);
        });
    }, 2000);
    setInterval(function () {
        $('.arrb').animate({'opacity': 0} ,500 , function () {
            $('.arrb').animate({'opacity': 0.8}, 500);
        });
    }, 2000);

    $('.mtmain .mtmaintxt p span').eq(0).addClass('fadeIn33')
    $('.mtmain .mtmaintxt p span').eq(1).addClass('fadeIn3')

    $('.mtmain2 .mtmaintxt2 p span').eq(0).addClass('fadeIn33')
    $('.mtmain2 .mtmaintxt2 p span').eq(1).addClass('fadeIn3')

    $('.mtmain3 .mtmaintxt3 p span').eq(0).addClass('fadeIn33')
    $('.mtmain3 .mtmaintxt3 p span').eq(1).addClass('fadeIn3')

    $('.teazanmain .zantxt p').eq(1).addClass('fadeIn')

    $('.teastory .ts p').eq(1).addClass('fadeIn')
    
    $('.fcontent2 p').eq(0).addClass('slideDown0')
    $('.fcontent2 p').eq(1).addClass('slideDown0')

    //submtea
    $('.submtea .subm li:eq(0) .r').mouseenter(function(){
        $('.submtea .subm li a .r').eq(0).attr('src','img/mtea11.png')
    })
    $('.submtea .subm li:eq(0) .r').mouseleave(function(){
        $('.submtea .subm li a .r').eq(0).attr('src','img/mtea1.png') 
    })
    $('.submtea .subm li:eq(1) .r').mouseenter(function(){
        $('.submtea .subm li:eq(1) a .r').attr('src','img/mtea22.png')
    })
    $('.submtea .subm li:eq(1) .r').mouseleave(function(){
        $('.submtea .subm li:eq(1) a .r').attr('src','img/mtea2.png') 
    })
    $('.submtea .subm li:eq(2) .r').mouseenter(function(){
        $('.submtea .subm li:eq(2) a .r').attr('src','img/mtea33.png')
    })
    $('.submtea .subm li:eq(2) .r').mouseleave(function(){
        $('.submtea .subm li:eq(2) a .r').attr('src','img/mtea3.png') 
    })
    $('.submtea .subm li:eq(3) .r').mouseenter(function(){
        $('.submtea .subm li:eq(3) a .r').attr('src','img/mtea44.png')
    })
    $('.submtea .subm li:eq(3) .r').mouseleave(function(){
        $('.submtea .subm li:eq(3) a .r').attr('src','img/mtea4.png') 
    })
    $('.submtea .subm li:eq(4) .r').mouseenter(function(){
        $('.submtea .subm li:eq(4) a .r').attr('src','img/mtea55.png')
    })
    $('.submtea .subm li:eq(4) .r').mouseleave(function(){
        $('.submtea .subm li:eq(4) a .r').attr('src','img/mtea5.png') 
    })
    $('.submtea .subm li:eq(5) .r').mouseenter(function(){
        $('.submtea .subm li:eq(5) a .r').attr('src','img/mtea66.png')
    })
    $('.submtea .subm li:eq(5) .r').mouseleave(function(){
        $('.submtea .subm li:eq(5) a .r').attr('src','img/mtea6.png') 
    })
    
    //subn
    $('.submtea2 .subm2 li:eq(0) .r').mouseenter(function(){
        $('.submtea2 .subm2 li a .r').eq(0).attr('src','img/ntea11.png')
    })
    $('.submtea2 .subm2 li:eq(0) .r').mouseleave(function(){
        $('.submtea2 .subm2 li a .r').eq(0).attr('src','img/ntea1.png') 
    })
    $('.submtea2 .subm2 li:eq(1) .r').mouseenter(function(){
        $('.submtea2 .subm2 li:eq(1) a .r').attr('src','img/ntea22.png')
    })
    $('.submtea2 .subm2 li:eq(1) .r').mouseleave(function(){
        $('.submtea2 .subm2 li:eq(1) a .r').attr('src','img/ntea2.png') 
    })
    $('.submtea2 .subm2 li:eq(2) .r').mouseenter(function(){
        $('.submtea2 .subm2 li:eq(2) a .r').attr('src','img/ntea33.png')
    })
    $('.submtea2 .subm2 li:eq(2) .r').mouseleave(function(){
        $('.submtea2 .subm2 li:eq(2) a .r').attr('src','img/ntea3.png') 
    })
    $('.submtea2 .subm2 li:eq(3) .r').mouseenter(function(){
        $('.submtea2 .subm2 li:eq(3) a .r').attr('src','img/ntea44.png')
    })
    $('.submtea2 .subm2 li:eq(3) .r').mouseleave(function(){
        $('.submtea2 .subm2 li:eq(3) a .r').attr('src','img/ntea4.png') 
    })
    $('.submtea2 .subm2 li:eq(4) .r').mouseenter(function(){
        $('.submtea2 .subm2 li:eq(4) a .r').attr('src','img/ntea55.png')
    })
    $('.submtea2 .subm2 li:eq(4) .r').mouseleave(function(){
        $('.submtea2 .subm2 li:eq(4) a .r').attr('src','img/ntea5.png') 
    })
    $('.submtea2 .subm2 li:eq(5) .r').mouseenter(function(){
        $('.submtea2 .subm2 li:eq(5) a .r').attr('src','img/ntea66.png')
    })
    $('.submtea2 .subm2 li:eq(5) .r').mouseleave(function(){
        $('.submtea2 .subm2 li:eq(5) a .r').attr('src','img/ntea6.png') 
    })
    $('.submtea2 .subm2 li:eq(6) .r').mouseenter(function(){
        $('.submtea2 .subm2 li:eq(6) a .r').attr('src','img/ntea77.png')
    })
    $('.submtea2 .subm2 li:eq(6) .r').mouseleave(function(){
        $('.submtea2 .subm2 li:eq(6) a .r').attr('src','img/ntea7.png') 
    })

    //subb
    $('.submtea3 .subm3 li:eq(0) .r').mouseenter(function(){
        $('.submtea3 .subm3 li a .r').eq(0).attr('src','img/btea11.png')
    })
    $('.submtea3 .subm3 li:eq(0) .r').mouseleave(function(){
        $('.submtea3 .subm3 li a .r').eq(0).attr('src','img/btea1.png') 
    })
    $('.submtea3 .subm3 li:eq(1) .r').mouseenter(function(){
        $('.submtea3 .subm3 li:eq(1) a .r').attr('src','img/btea22.png')
    })
    $('.submtea3 .subm3 li:eq(1) .r').mouseleave(function(){
        $('.submtea3 .subm3 li:eq(1) a .r').attr('src','img/btea2.png') 
    })
    $('.submtea3 .subm3 li:eq(2) .r').mouseenter(function(){
        $('.submtea3 .subm3 li:eq(2) a .r').attr('src','img/btea33.png')
    })
    $('.submtea3 .subm3 li:eq(2) .r').mouseleave(function(){
        $('.submtea3 .subm3 li:eq(2) a .r').attr('src','img/btea3.png') 
    })
    $('.submtea3 .subm3 li:eq(3) .r').mouseenter(function(){
        $('.submtea3 .subm3 li:eq(3) a .r').attr('src','img/btea44.png')
    })
    $('.submtea3 .subm3 li:eq(3) .r').mouseleave(function(){
        $('.submtea3 .subm3 li:eq(3) a .r').attr('src','img/btea4.png') 
    })
    $('.submtea3 .subm3 li:eq(4) .r').mouseenter(function(){
        $('.submtea3 .subm3 li:eq(4) a .r').attr('src','img/btea55.png')
    })
    $('.submtea3 .subm3 li:eq(4) .r').mouseleave(function(){
        $('.submtea3 .subm3 li:eq(4) a .r').attr('src','img/btea5.png') 
    })
    $('.submtea3 .subm3 li:eq(5) .r').mouseenter(function(){
        $('.submtea3 .subm3 li:eq(5) a .r').attr('src','img/btea66.png')
    })
    $('.submtea3 .subm3 li:eq(5) .r').mouseleave(function(){
        $('.submtea3 .subm3 li:eq(5) a .r').attr('src','img/btea6.png') 
    })
    $('.submtea3 .subm3 li:eq(6) .r').mouseenter(function(){
        $('.submtea3 .subm3 li:eq(6) a .r').attr('src','img/btea77.png')
    })
    $('.submtea3 .subm3 li:eq(6) .r').mouseleave(function(){
        $('.submtea3 .subm3 li:eq(6) a .r').attr('src','img/btea7.png') 
    })
    $('.submtea3 .subm3 li:eq(7) .r').mouseenter(function(){
        $('.submtea3 .subm3 li:eq(7) a .r').attr('src','img/btea88.png')
    })
    $('.submtea3 .subm3 li:eq(7) .r').mouseleave(function(){
        $('.submtea3 .subm3 li:eq(7) a .r').attr('src','img/btea8.png') 
    })

    $(window).scroll(function(){
        var win_top = $(window).scrollTop()
        if(win_top >= 150){
            $('.recover .fcontent').css('margin-top','-100px')
        } else {
            $('.recover .fcontent').css('margin-top','0px')
        }
        if(win_top >= 300){
            $('.hanzanStory .storytxt p').addClass('slideDown')
        } else {
            $('.hanzanStory .storytxt p').removeClass('slideDown')
        }
        if(win_top >= 2000){
            $('.main .effect .effecttxt1').addClass('fadeIn3')
            $('.main .effect .effecttxt1 span').addClass('fadeIn4')
        } else {
            $('.main .effect .effecttxt1').removeClass('fadeIn3')
            $('.main .effect .effecttxt1 span').removeClass('fadeIn4')
        }
        if(win_top >= 3200){
            $('.main .effect .effecttxt4 li').eq(0).addClass('slideDown')
            $('.main .effect .effecttxt4 li').eq(1).addClass('slideDown1')
            $('.main .effect .effecttxt4 li').eq(2).addClass('slideDown2')
        } else {
            $('.main .effect .effecttxt4 li').eq(0).removeClass('slideDown')
            $('.main .effect .effecttxt4 li').eq(1).removeClass('slideDown1')
            $('.main .effect .effecttxt4 li').eq(2).removeClass('slideDown2')
        }
        if(win_top >= 5500){
            $('.main .promise .promisetxt').addClass('slideRight2')
        } else {
            $('.main .promise .promisetxt').removeClass('slideRight2')
        }
        if(win_top >= 8000){
            $('.main .conviction p').eq(1).addClass('fadeIn')
            $('.main .conviction p span').eq(0).addClass('fadeIn2')
            $('.main .conviction p span').eq(1).addClass('fadeIn22')
        } else {
            $('.main .conviction p').eq(1).removeClass('fadeIn')
            $('.main .conviction p span').eq(0).removeClass('fadeIn2')
            $('.main .conviction p span').eq(1).removeClass('fadeIn22')
        }
        if(win_top >= 3000){
            $('.madetea .made .mainhanzantxt').addClass('slideleft1')
        } else {
            $('.madetea .made .mainhanzantxt').removeClass('slideleft1')
        }
    })
})
