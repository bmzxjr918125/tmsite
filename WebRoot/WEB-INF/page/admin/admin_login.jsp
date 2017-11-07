<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>獭猫后台登陆</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="后台管理员登录">

	<link rel="stylesheet" href="<%=basePath%>css/style.default.css" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>js/plugins/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/plugins/jquery-ui-1.8.16.custom.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/plugins/jquery.cookie.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/plugins/jquery.uniform.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/custom/general.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/custom/index.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.md5.js"></script>
	<script type="text/javascript">
		function validate(){
			if(jQuery('#username').val() == '' && jQuery('#password').val() == '') {
				jQuery('.nousername').fadeIn();
				jQuery('.nopassword').hide();
				return false;
			}
			if(jQuery('#username').val() != '' && jQuery('#password').val() == '') {
				jQuery('.nopassword').fadeIn().find('.userlogged h4, .userlogged a span').text(jQuery('#username').val());
				jQuery('.nousername,.username').hide();
				return false;;
			}
			jQuery('#password').val(jQuery.md5(jQuery.md5(jQuery('#password').val()).toUpperCase()).toUpperCase());
		}
	</script>
  </head>

	<body class="loginpage">
	    <div class="loginbox">
	    	<div class="loginboxinner">
	            <div class="logo">
	            	<h1 class="logo">Lutrababy.Website.<span>Admin</span></h1>
					<span class="slogan">后台管理系统</span>
	            </div><!--logo-->

	            <br clear="all" /><br />
	            <c:if test="${empty sessionScope.message}">
	            	<div class="nousername">
						<div class="loginmsg">用户名不能为空.</div>
		            </div><!--nousername-->
	            </c:if>
	            <c:if test="${!empty sessionScope.message}">
	            	<div class="nousername" style="display: block;">
						<div class="loginmsg">${sessionScope.message}</div>
		            </div><!--nousername-->
	            </c:if>
	            <div class="nopassword">
					<div class="loginmsg">密码不能为空.</div>
	                <div class="loginf">
	                    <div class="thumb"><img alt="" src="<%=basePath%>images/thumbs/avatar1.png" /></div>
	                    <div class="userlogged">
	                        <h4></h4>
	                      <!--   <a href="index.html">Not <span></span>?</a>  -->
	                    </div>
	                </div><!--loginf-->
	            </div><!--nopassword-->

	            <form id="login" action="<%=basePath%>admin/adminLoginin" method="POST" onsubmit="validate()">

	                <div class="username">
	                	<div class="usernameinner">
	                    	<input type="text" name="username" id="username" />
	                    </div>
	                </div>

	                <div class="password">
	                	<div class="passwordinner">
	                    	<input type="password" name="password" id="password" />
	                    </div>
	                </div>
	                <button>登录</button>
	               <!--  <div class="keep"><input type="checkbox" /> 记住密码</div> -->
	            </form>
	        </div>
	    </div>
	</body>
</html>
