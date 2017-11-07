/**
 * Created by Administrator on 2016-08-09.
 */

$(".blank_list").on("click",function(){
    var showIndex = $(this).index();
    $(".blank_list span").removeClass("active");
    $(this).find("span").addClass("active");
    $(".show_list").css({
        display: "none"
    });
    $(".show_list").eq(showIndex).css({
        display: "block"
    });
});