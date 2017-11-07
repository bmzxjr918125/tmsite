<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
</head>
<body>
<!--top-->
<jsp:include page="head.jsp" />
<!--main-->
<div class="main">
    <div class="content">
        <div class="blank">
            <div class="blank_list">
                <span class="active">公司介绍</span>
            </div>
            <div class="blank_list alert_btn">
                <span>联系我们</span>
            </div>
            <div class="blank_list alert_btn">
                <span>服务条款</span>
            </div>
            <div class="blank_list alert_btn">
                <span>法律条款</span>
            </div>
        </div>
        <div class="about_show">
        	
            <div class="show_list">
                <div class="show_list_pic">
                    <img src="<%=imagePath%>${json.image.url}" alt=""/>
                </div>
                <div class="show_list_dic">
                    <p>${json.introduce}</p>
                </div>
            </div>
            
            <div class="show_list">
                <div class="show_list_pic">
                    <img src="<%=imagePath%>${json.image.url}" alt=""/>
                </div>
                <div class="show_list_dic">
                    <p>${json.contact}</p>
                </div>
            </div>
            
            <div class="show_list">
                <div class="show_list_pic">
                    <img src="<%=imagePath%>${json.image.url}" alt=""/>
                </div>
                <div class="show_list_dic">
                    <p>${json.service_terms}</p>
                </div>
            </div>
            
            <div class="show_list">
                <div class="show_list_pic">
                    <img src="<%=imagePath%>${json.image.url}" alt=""/>
                </div>
                <div class="show_list_dic">
                    <p>${json.legal_terms}</p>
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
