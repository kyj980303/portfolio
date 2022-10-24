$(function(){
    $('.button img').click(function(){
        $('#visual .menu').fadeIn()
    })
    $('.button2 img').click(function(){
        $('#visual .menu').fadeOut()
    })

    var win_w = $(window).width()
    if(win_w <= 768){
        $('.menu ul li').eq(0).click(function(){
            $('.sub-menu').slideToggle()
        })
    } else {
        $('.menu ul li').eq(0).hover(function(){
            $('.sub-menu').slideToggle()
        })
    }
    

    $(window).scroll(function(){
        var win_top = $(window).scrollTop()

        if(win_top >= 200){
            $('.content1 .txt .bar').addClass('slideDown3')
            $('.content1 .txt h2').addClass('fadeOut')
            $('.content1 .txt p').addClass('slideUp2')
            $('.content1 .img1').addClass('slideRight3')
            $('.content1 .img2').addClass('slideLeft2')
            $('.content1 .box').addClass('slideLeft3')
        } else {
            $('.content1 .txt .bar').removeClass('slideDown3')
            $('.content1 .txt h2').removeClass('fadeOut')
            $('.content1 .txt p').removeClass('slideUp2')
            $('.content1 .img1').removeClass('slideRight3')
            $('.content1 .img2').removeClass('slideLeft2')
            $('.content1 .box').removeClass('slideLeft3')
        }
        if(win_top >= 300){
            $('#lush .lush-title span').addClass('slideLeft')
            $('#lush .lush-title h2').addClass('slideDown')

            $('.spell .img1').addClass('slideRight4')
            $('.spell .img2').addClass('slideRight4')
            $('.spell .txt').addClass('slideLeft4')

        } else {
            $('#lush .lush-title span').removeClass('slideLeft')
            $('#lush .lush-title h2').removeClass('slideDown')

            $('.spell .img1').removeClass('slideRight4')
            $('.spell .img2').removeClass('slideRight4')
            $('.spell .txt').removeClass('slideLeft4')

        }
        if(win_top >= 400){
            $('#lush .img1').addClass('fadeIn')
            $('#lush .img2').addClass('fadeIn2')
            $('#lush .box1').addClass('slideRight')
           


        } else {
            $('#lush .img1').removeClass('fadeIn')
            $('#lush .img2').removeClass('fadeIn2')
            $('#lush .box1').removeClass('slideRight')
           


        }
        if(win_top >= 500){ 
            $('#lush .txt1 p').addClass('slideUp2')
            $('#lush .txt1 a').addClass('slideUp2')

        } else {
            $('#lush .txt1 p').removeClass('slideUp2')
            $('#lush .txt1 a').removeClass('slideUp2')
        }


        if(win_top > 1000){
            $('.content2 .txt-bg').addClass('slideLeft')
            $('.content2 .txt').addClass('slideUp2')

            $('.hour .img1').addClass('slideRight4')
            $('.hour .img2').addClass('slideRight4')
            $('.hour .txt').addClass('slideLeft4')
        } else {
            $('.content2 .txt-bg').removeClass('slideLeft')
            $('.content2 .txt').removeClass('slideUp2')
            
            $('.hour .img1').removeClass('slideRight4')
            $('.hour .img2').removeClass('slideRight4')
            $('.hour .txt').removeClass('slideLeft4')
        }

        if(win_top >=1300) {
            $('#best .best-title span').addClass('slideRight2')
            $('#best .best-title h2').addClass('slideDown2')
            $('#best .box-768').addClass('slideLeft')
            $('#best .img3').addClass('fadeIn')
            $('#best iframe').addClass('fadeIn2')

           
        } else {
            $('#best .best-title span').removeClass('slideRight2')
            $('#best .best-title h2').removeClass('slideDown2')
            $('#best .box-768').removeClass('slideLeft')
            $('#best .img3').removeClass('fadeIn')
            $('#best iframe').removeClass('fadeIn2')
           
            
        }

        if(win_top >= 1500){
            $('#best .txt2').addClass('slideUp2')
        } else {
            $('#best .txt2').removeClass('slideUp2')
        }

        if(win_top >= 1600){
            $('.content2 .img2').addClass('fadeIn')
        } else {
            $('.content2 .img2').removeClass('fadeIn')

        }
        if(win_top >= 1800){
            $('.content2 .second .txt').addClass('slideUp2')
            $('.content2 .second .txt-750').addClass('slideUp2')
            $('.content2 .second .txt-1024').addClass('slideUp2')
            $('.content2 .second .bar').addClass('slideRight2')
        } else {
            $('.content2 .second .txt').removeClass('slideUp2')
            $('.content2 .second .txt-750').removeClass('slideUp2')
            $('.content2 .second .txt-1024').removeClass('slideUp2')
            $('.content2 .second .bar').removeClass('slideRight2')

        }

        if(win_top >= 2300){
            $('.tales .img1').addClass('slideRight4')
            $('.tales .img2').addClass('slideRight4')
            $('.tales .txt').addClass('slideLeft4')
        } else {
            $('.tales .img1').removeClass('slideRight4')
            $('.tales .img2').removeClass('slideRight4')
            $('.tales .txt').removeClass('slideLeft4')

        }

        if(win_top >= 2200) {
            $('#new-item .new-item-title span').addClass('slideLeft')
            $('#new-item .new-item-title h2').addClass('slideDown')
            $('#new-item .img4').addClass('fadeIn')
            $('#new-item .img5').addClass('fadeIn2')
            $('#new-item .arrow').addClass('fadeIn2')
            $('#new-item .box3').addClass('slideRight')
            $('#new-item .txt3').addClass('slideUp2')
        } else {
            $('#new-item .new-item-title span').removeClass('slideLeft')
            $('#new-item .new-item-title h2').removeClass('slideDown')
            $('#new-item .img4').removeClass('fadeIn')
            $('#new-item .img5').removeClass('fadeIn2')
            $('#new-item .arrow').removeClass('fadeIn2')
            $('#new-item .box3').removeClass('slideRight')
            $('#new-item .txt3').removeClass('slideUp2')
        }

        if(win_top >= 2500){
            $('.content2 .second .txt2-1920').addClass('slideUp2')
            $('.content2 .second .txt2-750').addClass('slideUp2')
            $('.content2 .second .txt2-1024').addClass('slideUp2')
            $('.content2 .second .txt2').addClass('slideUp2')
            $('.content2 .second .bar3').addClass('slideLeft2')
            $('.content2 .second .img4').addClass('fadeIn3')
            $('.content2 .second .img5').addClass('fadeIn')


        } else {
            $('.content2 .second .txt2-1920').removeClass('slideUp2')
            $('.content2 .second .txt2-750').removeClass('slideUp2')
            $('.content2 .second .txt2-1024').removeClass('slideUp2')
            $('.content2 .second .txt2').removeClass('slideUp2')
            $('.content2 .second .bar3').removeClass('slideLeft2')
            $('.content2 .second .img4').removeClass('fadeIn3')
            $('.content2 .second .img5').removeClass('fadeIn')



        }

        if(win_top >= 3400) {
            $('.address .txt').addClass('fadeIn3')
            $('.address .img1').addClass('fadeIn3')
            $('.address .img2').addClass('slideLeft4')

            
        } else {
            $('.address .txt').removeClass('fadeIn3')
            $('.address .img1').removeClass('fadeIn3')
            $('.address .img2').removeClass('slideLeft4')


        }

        if(win_top >= 3200) {
            $('.content3 .bar').addClass('slideLeft')
            $('.content3 .bar2').addClass('slideRight2')
            $('.content3 .img1').addClass('fadeOut')
            $('.content3 p').addClass('fadeOut')
            
        } else {
            $('.content3 .bar').removeClass('slideLeft')
            $('.content3 .bar2').removeClass('slideRight2')
            $('.content3 .img1').removeClass('fadeOut')
            $('.content3 p').removeClass('fadeOut')


        }
        if(win_top >= 3400) {
            $('#gift .gift-title span').addClass('slideRight2')
            $('#gift .gift-title h2').addClass('slideDown2')
            $('#gift .img6').addClass('fadeIn')
            $('#gift .img7').addClass('fadeIn2')
            $('#gift .txt4 p').addClass('slideUp2')
            $('#gift .txt4 a').addClass('slideUp2')

        } else {
            $('#gift .gift-title span').removeClass('slideRight2')
            $('#gift .gift-title h2').removeClass('slideDown2')
            $('#gift .img6').removeClass('fadeIn')
            $('#gift .img7').removeClass('fadeIn2')
            $('#gift .txt4 p').removeClass('slideUp2')
            $('#gift .txt4 a').removeClass('slideUp2')
        }

        if(win_top >= 4400) {
            $('.address2 .img1 .txt').addClass('fadeIn3')
            $('.address2 .img1').addClass('fadeIn3')
            $('.address2 .img2').addClass('slideLeft4')

        } else {
            $('.address2 .img1 .txt').removeClass('fadeIn3')
            $('.address2 .img1').removeClass('fadeIn3')
            $('.address2 .img2').removeClass('slideLeft4')
        }

    })
   
    $('.bath ul li').eq(0).mouseenter(function(){
        $('.bath ul li a img').eq(0).attr('src','img/bath1.png')
        $('.bath ul li .txt').eq(0).fadeOut()
    })
    $('.bath ul li').eq(0).mouseleave(function(){
        $('.bath ul li a img').eq(0).attr('src','img/sub2-bath1.png')
        $('.bath ul li .txt').eq(0).fadeIn()
        
    })
    $('.bath ul li').eq(1).mouseenter(function(){
        $('.bath ul li a img').eq(1).attr('src','img/bath2.png')
        $('.bath ul li .txt').eq(1).fadeOut()
    })
    $('.bath ul li').eq(1).mouseleave(function(){
        $('.bath ul li a img').eq(1).attr('src','img/sub2-bath2.png')
        $('.bath ul li .txt').eq(1).fadeIn()
        
    })
    $('.bath ul li').eq(2).mouseenter(function(){
        $('.bath ul li a img').eq(2).attr('src','img/bath3.png')
        $('.bath ul li .txt').eq(2).fadeOut()
    })
    $('.bath ul li').eq(2).mouseleave(function(){
        $('.bath ul li a img').eq(2).attr('src','img/sub2-bath3.png')
        $('.bath ul li .txt').eq(2).fadeIn()
    })

    



    $('.shower ul li').eq(0).mouseenter(function(){
        $('.shower ul li a img').eq(0).attr('src','img/shower1.png')
        $('.shower ul li .txt').eq(0).fadeOut()
    })
    $('.shower ul li').eq(0).mouseleave(function(){
        $('.shower ul li a img').eq(0).attr('src','img/sub2-shower1.png')
        $('.shower ul li .txt').eq(0).fadeIn()
        
    })
    $('.shower ul li').eq(1).mouseenter(function(){
        $('.shower ul li a img').eq(1).attr('src','img/shower2.png')
        $('.shower ul li .txt').eq(1).fadeOut()
    })
    $('.shower ul li').eq(1).mouseleave(function(){
        $('.shower ul li a img').eq(1).attr('src','img/sub2-shower2.png')
        $('.shower ul li .txt').eq(1).fadeIn()
        
    })
    $('.shower ul li').eq(2).mouseenter(function(){
        $('.shower ul li a img').eq(2).attr('src','img/shower3.png')
        $('.shower ul li .txt').eq(2).fadeOut()
    })
    $('.shower ul li').eq(2).mouseleave(function(){
        $('.shower ul li a img').eq(2).attr('src','img/sub2-shower3.png')
        $('.shower ul li .txt').eq(2).fadeIn()
    })




    $('.body ul li').eq(0).mouseenter(function(){
        $('.body ul li a img').eq(0).attr('src','img/body1.png')
        $('.body ul li .txt').eq(0).fadeOut()
    })
    $('.body ul li').eq(0).mouseleave(function(){
        $('.body ul li a img').eq(0).attr('src','img/sub2-body1.png')
        $('.body ul li .txt').eq(0).fadeIn()
        
    })
    $('.body ul li').eq(1).mouseenter(function(){
        $('.body ul li a img').eq(1).attr('src','img/body2.png')
        $('.body ul li .txt').eq(1).fadeOut()
    })
    $('.body ul li').eq(1).mouseleave(function(){
        $('.body ul li a img').eq(1).attr('src','img/sub2-body2.png')
        $('.body ul li .txt').eq(1).fadeIn()
        
    })
    $('.body ul li').eq(2).mouseenter(function(){
        $('.body ul li a img').eq(2).attr('src','img/body3.png')
        $('.body ul li .txt').eq(2).fadeOut()
    })
    $('.body ul li').eq(2).mouseleave(function(){
        $('.body ul li a img').eq(2).attr('src','img/sub2-body3.png')
        $('.body ul li .txt').eq(2).fadeIn()
    })




    $('.face ul li').eq(0).mouseenter(function(){
        $('.face ul li a img').eq(0).attr('src','img/face1.png')
        $('.face ul li .txt').eq(0).fadeOut()
    })
    $('.face ul li').eq(0).mouseleave(function(){
        $('.face ul li a img').eq(0).attr('src','img/sub2-face1.png')
        $('.face ul li .txt').eq(0).fadeIn()
        
    })
    $('.face ul li').eq(1).mouseenter(function(){
        $('.face ul li a img').eq(1).attr('src','img/face2.png')
        $('.face ul li .txt').eq(1).fadeOut()
    })
    $('.face ul li').eq(1).mouseleave(function(){
        $('.face ul li a img').eq(1).attr('src','img/sub2-face2.png')
        $('.face ul li .txt').eq(1).fadeIn()
        
    })
    $('.face ul li').eq(2).mouseenter(function(){
        $('.face ul li a img').eq(2).attr('src','img/face3.png')
        $('.face ul li .txt').eq(2).fadeOut()
    })
    $('.face ul li').eq(2).mouseleave(function(){
        $('.face ul li a img').eq(2).attr('src','img/sub2-face3.png')
        $('.face ul li .txt').eq(2).fadeIn()
    })

})




/* lush-title */

