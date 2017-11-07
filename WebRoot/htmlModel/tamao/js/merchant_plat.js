/**
 * Created by Administrator on 2016-08-09.
 */

var showWidth = $(window).width();
var showHeight = $(window).height();
$(".gap").css({
    width: showWidth+"px",
    height: showHeight+"px"
});

//轮播
var i = 0;
var play_pic1Lengh = $(".left_pic .swiper-slide").length;
for( var j = 0; j < play_pic1Lengh; j++){
    var spanHtml = "<span></span>";
    $(".swiper-pagination").append(spanHtml);
}
$(".swiper-slide").eq(0).css({
    display: "block"
});
$(".swiper-pagination span").eq(0).addClass("active");
function play1() {
    if (i < play_pic1Lengh - 1) {
        $(".swiper-slide").eq(i).fadeOut("normal").next().fadeIn();
        i++;
        $(".swiper-pagination span").eq(i).addClass("active").siblings().removeClass("active");
    } else {
        $(".swiper-slide").eq(i).fadeOut("normal");
        $(".swiper-slide").eq(0).fadeIn("normal");
        i = 0;
        $(".swiper-pagination span").eq(0).addClass("active").siblings().removeClass("active");
    }
}
$(".swiper-pagination span").live("click",function(){
    clearInterval(play_move);
    var spanIndex = $(this).index();
    $(".swiper-pagination span").eq(spanIndex).addClass("active").siblings().removeClass("active");
    $(".swiper-slide").eq(i).fadeOut("normal");
    $(".swiper-slide").eq(spanIndex).fadeIn("normal");
    play_move = setInterval(play1,2000);
    i = spanIndex;
});
var play_move = setInterval(play1,2000);

//申请入驻
$(".apply_btn").on("click",function(){
    $(".gap").css({
        display: "block"
    });
    $(".apply_main").css({
        display: "block"
    });
});
$(".cancel_btn").on("click",function(){
    $(".gap").css({
        display: "none"
    });
    $(".apply_main").css({
        display: "none"
    });
});
$(".gap").on("click",function(){
    $(".gap").css({
        display: "none"
    });
    $(".apply_main").css({
        display: "none"
    });
});
$(".apply_now button").on("click",function(){
    $(".gap").css({
        display: "none"
    });
    $(".apply_main").css({
        display: "none"
    });
});


//placeholder IE 兼容
$(document).ready(function(){
    var doc=document,inputs=doc.getElementsByTagName('input'),supportPlaceholder='placeholder'in doc.createElement('input'),placeholder=function(input){var text=input.getAttribute('placeholder'),defaultValue=input.defaultValue;
        if(defaultValue==''){
            input.value=text}
        input.onfocus=function(){
            if(input.value===text){this.value=''}};
        input.onblur=function(){if(input.value===''){this.value=text}}};
    if(!supportPlaceholder){
        for(var i=0,len=inputs.length;i<len;i++){var input=inputs[i],text=input.getAttribute('placeholder');
            if(input.type==='text'&&text){placeholder(input)}}}});


