
$(function(){

    $('.btxt p').eq(0).addClass('slideRight1')
    $('.btxt p').eq(1).addClass('slideLeft1')
    $('.explanation p span').eq(0).addClass('slide1')
    $('.explanation p span').eq(1).addClass('slide2')
    $('.explanation p span').eq(2).addClass('slide3')
    $('.explanation p span').eq(3).addClass('slide4')
    $('.explanation p span').eq(4).addClass('slide5')


    $('.section1 .ring li').eq(0).mouseenter(function(){
        $('.section1 .ring li img').eq(0).attr('src','img/r1.png')
    })
    $('.section1 .ring li').eq(0).mouseleave(function(){
        $('.section1 .ring li img').eq(0).attr('src','img/ring1.png')
    })

    $('.section1 .ring li').eq(1).mouseenter(function(){
        $('.section1 .ring li img').eq(1).attr('src','img/r2.png')
    })
    $('.section1 .ring li').eq(1).mouseleave(function(){
        $('.section1 .ring li img').eq(1).attr('src','img/ring2.png')
    })

    $('.section1 .ring li').eq(2).mouseenter(function(){
        $('.section1 .ring li img').eq(2).attr('src','img/r3.png')
    })
    $('.section1 .ring li').eq(2).mouseleave(function(){
        $('.section1 .ring li img').eq(2).attr('src','img/ring3.png')
    })

    $('.section1 .ring li').eq(3).mouseenter(function(){
        $('.section1 .ring li img').eq(3).attr('src','img/r4.png')
    })
    $('.section1 .ring li').eq(3).mouseleave(function(){
        $('.section1 .ring li img').eq(3).attr('src','img/ring4.png')
    })



    $('.section3 .bouquet li').eq(0).mouseenter(function(){
        $('.section3 .bouquet li img').eq(0).attr('src','img/f1.png')
    })
    $('.section3 .bouquet li').eq(0).mouseleave(function(){
        $('.section3 .bouquet li img').eq(0).attr('src','img/flower1.png')
    })
    $('.section3 .bouquet li').eq(1).mouseenter(function(){
        $('.section3 .bouquet li img').eq(1).attr('src','img/f2.png')
    })
    $('.section3 .bouquet li').eq(1).mouseleave(function(){
        $('.section3 .bouquet li img').eq(1).attr('src','img/flower2.png')
    })
    $('.section3 .bouquet li').eq(2).mouseenter(function(){
        $('.section3 .bouquet li img').eq(2).attr('src','img/f3.png')
    })
    $('.section3 .bouquet li').eq(2).mouseleave(function(){
        $('.section3 .bouquet li img').eq(2).attr('src','img/flower3.png')
    })
    $('.section3 .bouquet li').eq(3).mouseenter(function(){
        $('.section3 .bouquet li img').eq(3).attr('src','img/f4.png')
    })
    $('.section3 .bouquet li').eq(3).mouseleave(function(){
        $('.section3 .bouquet li img').eq(3).attr('src','img/flower4.png')
    })
    
    
    $(window).scroll(function(){
        var win_top = $(window).scrollTop()

        if(win_top >= 100){
            $('.section1 .txt p').addClass('slideDown')
        } else {
            $('.section1 .txt p').removeClass('slideDown')
        }

        if(win_top >= 200){
            $('.flower p span').eq(0).addClass('slide1')
            $('.flower p span').eq(1).addClass('slide2')
            $('.flower p span').eq(2).addClass('slide3')
            $('.flower p span').eq(3).addClass('slide4')
            
        } else {
            $('.flower p span').eq(0).removeClass('slide1')
            $('.flower p span').eq(1).removeClass('slide2')
            $('.flower p span').eq(2).removeClass('slide3')
            $('.flower p span').eq(3).removeClass('slide4')
        }
        if(win_top >= 300){
            
            $('.section1 .ring li img').eq(0).addClass('slideDown2')
            $('.section1 .ring li img').eq(1).addClass('slideDown3')
            $('.section1 .ring li img').eq(2).addClass('slideDown4')
            $('.section1 .ring li img').eq(3).addClass('slideDown5')
            
        } else {
           
            $('.section1 .ring li img').eq(0).removeClass('slideDown2')
            $('.section1 .ring li img').eq(1).removeClass('slideDown3')
            $('.section1 .ring li img').eq(2).removeClass('slideDown4')
            $('.section1 .ring li img').eq(3).removeClass('slideDown5')

        }

        if(win_top >= 600){
            $('.brandstory p span').addClass("slideUp1")
            $('.boutxt p').eq(0).addClass('slideDown1')
            $('.boutxt p').eq(1).addClass('fadeIn4')
            
        } else {
            $('.brandstory p span').removeClass("slideUp1")
            $('.boutxt p').eq(0).removeClass('slideDown1')
            $('.boutxt p').eq(1).removeClass('fadeIn4')
        }

        if(win_top >= 700){
            $('.section1 .ring2 li').eq(1).addClass('slideLeft1')
            $('.section1 .ring2 li').eq(0).addClass('slideRight1')
            $('.brandstoryE p').addClass("slideUp3")
            
        } else {
            $('.section1 .ring2 li').eq(1).removeClass('slideLeft1')
            $('.section1 .ring2 li').eq(0).removeClass('slideRight1')
            $('.brandstoryE p').removeClass("slideUp3")
        }
        if(win_top >= 1000){
            $('.round .first li').eq(1).addClass('slideLeft1')
        } else {
            $('.round .first li').eq(1).removeClass('slideLeft1')
        }
        if(win_top >= 1100){
            $('.section2 .txt p').addClass('slideDown')
        } else {
            $('.section2 .txt p').removeClass('slideDown')
        }
        if(win_top >= 1300){
            $('.b_ring .img').addClass('slideUp2')
            
            
        } else {
            $('.b_ring .img').removeClass('slideUp2')
        }
        if(win_top >= 1400){
            $('.section2 .studio li').eq(1).addClass('slideLeft1')
            $('.section2 .studio li').eq(0).addClass('slideRight1')  
        } else {
            $('.section2 .studio li').eq(1).removeClass('slideLeft1')
            $('.section2 .studio li').eq(0).removeClass('slideRight1')
        }

        if(win_top >= 1600){
            $('.section2 .dress li img').eq(0).addClass('fadeIn')
            $('.section2 .dress li img').eq(1).addClass('fadeIn2')
            $('.section2 .dress li img').eq(2).addClass('fadeIn3')
            $('.section2 .dress .txt2').addClass('fadeIn3')
            $('.b_dress .img').addClass('slideUp2')
            $('.cascade .second .ftxt2').addClass('slideRight1')
            
        } else {
            $('.section2 .dress li img').eq(0).removeClass('fadeIn')
            $('.section2 .dress li img').eq(1).removeClass('fadeIn2')
            $('.section2 .dress li img').eq(2).removeClass('fadeIn3')
            $('.section2 .dress .txt2').removeClass('fadeIn3')
            $('.b_dress .img').removeClass('slideUp2')
            $('.cascade .second .ftxt2').removeClass('slideRight1')
        }

        if(win_top >= 2000){
            $('.b_bou .img').addClass('slideUp2')
            
        } else {
            $('.b_bou .img').removeClass('slideUp2')
        }

        if(win_top >= 2200){
            $('.section3 .txt p').addClass('slideDown')
            $('.handtide .first .ftxt').addClass('slideLeft1')
            
        } else {
            $('.section3 .txt p').removeClass('slideDown')
            $('.handtide .first .ftxt').removeClass('slideLeft1')
        }

        if(win_top >= 2400){
           
            $('.section3 .bouquet li img').eq(0).addClass('slideDown2')
            $('.section3 .bouquet li img').eq(1).addClass('slideDown3')
            $('.section3 .bouquet li img').eq(2).addClass('slideDown4')
            $('.section3 .bouquet li img').eq(3).addClass('slideDown5')
            $('.explanation p span').addClass("slideUp1")
            
        } else {
            
            $('.section3 .bouquet li img').eq(0).removeClass('slideDown2')
            $('.section3 .bouquet li img').eq(1).removeClass('slideDown3')
            $('.section3 .bouquet li img').eq(2).removeClass('slideDown4')
            $('.section3 .bouquet li img').eq(3).removeClass('slideDown5')
            $('.explanation p span').removeClass("slideUp1")

        }

        if(win_top >= 2800){
            $('.explanation2 p span').addClass("slideUp1")
            $('.ansip .second .ftxt2').addClass('slideRight1')
            
        } else {
            $('.explanation2 p span').removeClass("slideUp1")
            $('.ansip .second .ftxt2').removeClass('slideRight1')
        }
        if(win_top >= 3000){
            $('.ansip .second .ftxt2').addClass('slideRight1')
            
        } else {
            $('.ansip .second .ftxt2').removeClass('slideRight1')
        }

       
    })
})