<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <style>
     .menunone{
        display:none;
      }
   </style>

    <div class="vernav2 iconmenu">
        <input type="hidden" id="hidden_admin_powers" value="${session.adminInfo.powers}" />
    	<!--首页-->
    	<ul id="left1" class="menunone">
    		
            <li><a href="#infoul" class="gallery">网站信息管理</a>
                <span class="arrow"></span>
                <ul id="infoul">
                    <li id="infoli1" class="power_1"><a href="admin/lutraShow">网站信息</a></li>
                </ul>
            </li>
            
            <c:if test="${session.adminInfo.type eq 0}">
	            <li><a href="#operatorul" class="elements">渠道申请管理</a>
	                <span class="arrow"></span>
	            	<ul id="operatorul">
	               		<li id="operatorli" class="power_2"><a href="admin/applyShow" >渠道申请管理</a></li>
	                </ul>
	            </li>
            </c:if>

            <li><a href="#newsul" class="elements">新闻管理</a>
                <span class="arrow"></span>
            	<ul id="newsul">
               		<li id="newsli" class="power_3"><a href="admin/newsShow" >新闻管理</a></li>
                </ul>
            </li>
            
            <li><a href="#noticeul" class="elements">公告管理</a>
                <span class="arrow"></span>
            	<ul id="noticeul">
                    <li id="noticeli" class="power_4"><a href="admin/noticeShow">公告管理</a></li> 
                </ul>
            </li>
            
            <c:if test="${session.adminInfo.type eq 0}">
	            <li><a href="#adminul" class="elements">用户管理</a>
	                <span class="arrow"></span>
	            	<ul id="adminul">
	               		<li id="adminli" class="power_5"><a href="admin/adminGetAdminList" >用户管理</a></li>
	                </ul>
	            </li>
            </c:if>
        </ul>
     
        <a class="togglemenu"></a>
        <br /><br />
    </div><!--leftmenu-->
	<script type="text/javascript" src="js/method.js"></script>
