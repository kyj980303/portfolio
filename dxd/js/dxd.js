$(function(){
    $('.nav .main-menu a').mouseenter(function(){
        $('.sub-menu').show()
    })
    $('.nav').mouseleave(function(){
        $('.sub-menu').hide()
    })
})