<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

   <div class="topheader">
        <div class="left">
            <h1 class="logo">獭&nbsp;<span>猫</span></h1>
            <span class="slogan">网站后台管理系统</span>
            
            <div class="search">
            	<form action="" method="post">
                	<input type="text" name="keyword" id="keyword"  disabled="disabled" placeholder="请输入" />
                    <button class="submitbutton"></button>
                </form>
            </div><!--search-->
            
            <br clear="all" />
            
        </div><!--left-->
        
        <div class="right">
        
            <div class="userinfo">
            	<img src="images/thumbs/avatar.png" alt="" />
                <span>${sessionScope.adminInfo.username}</span>
            </div><!--userinfo-->
            
            <div class="userinfodrop">
            	<div class="avatar">
                	<a href="javascript:;"><img src="images/thumbs/avatarbig.png" alt="" /></a>
                    <div class="changetheme">
                    	切换主题: <br />
                    	<a class="default"></a>
                        <a class="blueline"></a>
                        <a class="greenline"></a>
                        <a class="contrast"></a>
                        <a style="display: none;" class="custombg"></a>
                    </div>
                </div><!--avatar-->
                <div class="userdata">
                	<h4>${sessionScope.adminInfo.username}</h4>
                    <ul>
                    	<!-- <li><a href="editprofile.html">编辑资料</a></li> -->
                        <li style="padding-top: 35px"><a href="tmg/adminUpdate?id=${sessionScope.adminInfo.id}" >登录密码修改</a></li>
                        <!-- <li><a href="help.html">帮助</a></li> --> 
                        <li style="padding-top: 15px;"><a href="admin/adminLogout" >退出</a></li>
                    </ul>
                </div><!--userdata-->
            </div><!--userinfodrop-->
        </div><!--right-->
    </div><!--topheader-->