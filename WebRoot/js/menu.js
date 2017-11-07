/**
 * 控制上 左部菜单选中
 */
/*$.cookie('the_cookie'); // 读取 cookie
$.cookie('the_cookie', 'the_value'); // 存储 cookie
$.cookie('the_cookie', 'the_value', { expires: 7 }); // 存储一个带7天期限的 cookie
$.cookie('the_cookie', '', { expires: -1 }); // 删除 cookie
*/
//当前控制面板选中项
//var current_left_ul,current_left_li,current_top_li;
//$.cookie('current_left_ul', 'the_value');
	//顶部点击绑定

      jQuery(document).ready(function(){
		  jQuery(".headermenu").find("li").live("click",function(){
      		clickTopMenu(this,jQuery(this).attr("leftid"));
      	});
      	//左侧点击绑定
      	jQuery(".iconmenu").find("ul li ul li").live("click",function(){
      		clickLeftMenu(this);

      	});
	    chioceMenu();
		hiddenAllMenu();
	});

/**
 * 左部菜单点击
 * @param obj
 */
function clickLeftMenu(obj){

	var current_left_li=jQuery(obj).attr("id");
	jQuery.cookie('current_left_li',current_left_li);

}
/**
 * 顶部菜单点击
 * @param obj
 */
function clickTopMenu(obj,leftid){

	var current_top_li=jQuery(obj).attr("id");
	jQuery.cookie('current_top_li',current_top_li);
	jQuery.cookie('current_left_ul',leftid);
	//清除左侧cookie
	jQuery.cookie('current_left_li', '', { expires: -1 });
	chioceMenu();
}
/**
 * 选中菜单
 */
function chioceMenu(){

	//上部菜单
	var current_top_li=jQuery.cookie('current_top_li');
	jQuery(".headermenu").find(".current").removeClass();
	if(typeof current_top_li=='undefined' || current_top_li==null){
		jQuery(".headermenu").find("li").eq(0).addClass("current");
	}else{
		jQuery("#"+current_top_li).addClass("current");
	}

	//左侧菜单
	var current_left_ul=jQuery.cookie('current_left_ul');
	var current_left_li=jQuery.cookie('current_left_li');

	jQuery(".iconmenu").find("ul").addClass("menunone");
	if(typeof current_left_ul!='undefined' && current_left_ul!=null){
		jQuery("#"+current_left_ul).attr("class","");
	}else{
		jQuery(".iconmenu").find("ul").eq(0).attr("class","");
	}
	if(typeof current_left_li!='undefined' && current_left_li!=null){

		jQuery("#"+current_left_li).addClass("current");
		jQuery("#"+current_left_li).parent().parent().addClass("current");
	}
}

function hiddenAllMenu(){
	var power = jQuery('#hidden_admin_powers').val();
	if(power != ''){
		jQuery('.iconmenu li').hide();
		jQuery('.headermenu li').hide();
		var powers = power.split(',');
		jQuery.each(powers,function(i,item){
			if(item != ""){
				//alert(item+"|"+jQuery('.iconmenu li').find('.power_'+item).html());
				jQuery('.iconmenu li').find('.power_'+item).show();
				jQuery('.iconmenu li').find('.power_'+item).parents('li').show();
				var uls = jQuery('.iconmenu li').find('.power_'+item).parent().parent().parent();
				//alert(uls.attr('id'));
				var leftId = jQuery(uls).attr('id');
				if(leftId == 'left4'){
					jQuery('#headermenuli4').show();
				}else if(leftId == 'left3'){
					jQuery('#headermenuli3').show();
				}else if(leftId == 'left2'){
					jQuery('#headermenuli2').show();
				}else if(leftId == 'left1'){
					jQuery('#headermenuli1').show();
				}else if(leftId == 'left5'){
					jQuery('#headermenuli5').show();
				}else if(leftId == 'left6'){
					jQuery('#headermenuli6').show();
				}
				/*var lilist=jQuery(".headermenu").find("li");
				for(var i=0;i<lilist.length;i++){
					if(!jQuery(lilist.eq(i)).is(":hidden")){
						lilist.eq(i).click();
						break;
					}
				}*/
			}
		});
	}
}
