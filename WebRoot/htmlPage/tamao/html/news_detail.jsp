<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/htmlPage/tamao/html/config.jsp"%>

<!DOCTYPE html>
<html>
<head lang="en">
     <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>獭猫科技-关于</title>
   <meta name="description" content="獭猫科技,专注母婴平台" />
    <meta name="keywords" content="獭猫科技,母婴，孕婴" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>htmlPage/tamao/css/basicCss/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>htmlPage/tamao/css/about_tamao.css"/>
    <link rel="shortcut icon" href="<%=basePath%>htmlPage/tamao/images/favicon.ico" type="image/x-icon" />
    <style type="text/css">
    	.show_list_pic h2 {
		    color: #ff66cc;
		    cursor: pointer;
		    font-size: 22px;
		    font-weight: normal;
		    line-height: 80px;
		    text-align: center;
		    
		}
		.news_images{
			margin:5px auto;
			width: 240px;
			height: 160px;
		}
		.about_show{
		    width: auto;
		    min-height: 900px;
		    float: none;
		    background-color: #ffffff;
		}
		.show_list_dic{
		    width: 95%;
		    margin: 0 auto;
		}
    </style>
</head>

<body>
<!--top-->
<jsp:include page="head.jsp" />
<!--main-->
<div class="main">
    <div class="content">
        
        <div class="about_show" style="min-height:685px;">
            <div class="show_list">
                <div class="show_list_pic" style="height: 80px;">
					<h2 class="alert_btn">${json.title}</h2>
                </div>
                <div class="show_list_dic">
                    <p>${json.content}</p>
                </div>
                <div class="show_list_dic">
                	<c:forEach items="${json.imageList}" var="image">
                		<img alt="xxxx" class="news_images" src="<%=imagePath%>${image.url}">
                	</c:forEach>
                </div>
            </div>
        </div>
        
    </div>
</div>


<!--foot-->
<jsp:include page="foot.jsp" />
<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/basicJs/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/basicJs/common.js"></script>
<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/about_tamao.js"></script>
</body>
</html>
