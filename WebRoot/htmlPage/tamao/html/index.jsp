<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/htmlPage/tamao/html/config.jsp"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>獭猫科技-首页</title>
    <meta name="description" content="獭猫科技,专注母婴平台" />
    <meta name="keywords" content="獭猫科技,母婴，孕婴" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>htmlPage/tamao/css/basicCss/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>htmlPage/tamao/css/index.css"/>
    <link rel="shortcut icon" href="<%=basePath%>htmlPage/tamao/images/favicon.ico" type="image/x-icon" />
</head>
<body>
<div class="blank">
    <!--top-->
    <jsp:include page="head.jsp" /> 
   
    <!--main-->
    <div class="blank_main content">
        <div class="blank_main_left">
            <img class="shu" src="<%=basePath%>htmlPage/tamao/images/u41.png" alt=""/>
            <img class="heng" src="<%=basePath%>htmlPage/tamao/images/u39.png" alt=""/>
        </div>
        <div class="blank_main_right">
            <div class="tamao_logo">
                <img src="<%=basePath%>htmlPage/tamao/images/u43.png" alt=""/>
            </div>
            <div class="download_btn">
                <div class="btn_list alert_btn white" style="margin-left: 12px;" onclick="alert('敬请期待');">
                    <img src="<%=basePath%>htmlPage/tamao/images/u55.png" alt=""/>
                    <span>iPhone</span>
                </div>
                <div class="btn_list alert_btn pink" onclick="alert('敬请期待');">
                    <img src="<%=basePath%>htmlPage/tamao/images/u62.png" alt=""/>
                    <span>Android</span>
                </div>
            </div>
            <div class="erweima">
                <div class="erweima_pic">
                    <img src="<%=basePath%>htmlPage/tamao/images/u50.jpg" alt=""/>
                </div>
                <div class="erweima_word">
                    <span>扫码关注公众号</span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="main">
    <div class="content">
        <div class="feature_list">
            <div class="feature_list_content float_l">
                <div class="feature_pic">
                    <img src="<%=basePath%>htmlPage/tamao/images/u26.png" alt=""/>
                </div>
                <div class="feature_word">
                    <span class="orange_font">买就补</span>
                </div>
                <div class="feature_dic">
                    <span class="orange_font">购物即获得商品订单总额一定比例的等额分期补贴，并在1000天内将补贴金额返还至钱包中</span>
                </div>
            </div>
            <div class="feature_list_content float_r">
                <img src="<%=basePath%>htmlPage/tamao/images/u66.png" alt=""/>
            </div>
        </div>
        <div class="feature_list">
            <div class="feature_list_content float_r">
                <div class="feature_pic">
                    <img src="<%=basePath%>htmlPage/tamao/images/u21.png" alt=""/>
                </div>
                <div class="feature_word">
                    <span class="pink_font">享服务</span>
                </div>
                <div class="feature_dic">
                    <span class="pink_font">獭猫宝提供授权店铺店员一对一贴心服务，为会员提供最全面的店面服务，上门服务</span>
                </div>
            </div>
            <div class="feature_list_content float_l">
                <img src="<%=basePath%>htmlPage/tamao/images/u68.png" alt=""/>
            </div>
        </div>
        <div class="feature_list">
            <div class="feature_list_content float_l">
                <div class="feature_pic">
                    <img src="<%=basePath%>htmlPage/tamao/images/u35.png" alt=""/>
                </div>
                <div class="feature_word">
                    <span class="blue_font">换海淘</span>
                </div>
                <div class="feature_dic">
                    <span class="blue_font">商品订单总额一定比例的海淘授信，海淘授信可用于兑换獭猫宝海淘区的任意等额商品</span>
                </div>
            </div>
            <div class="feature_list_content float_r">
                <img src="<%=basePath%>htmlPage/tamao/images/u70.png" alt=""/>
            </div>
        </div>
    </div>
</div>

<!--foot-->
<jsp:include page="foot.jsp" /> 

<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/basicJs/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/basicJs/common.js"></script>
<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/index.js"></script>
</body>
</html>
