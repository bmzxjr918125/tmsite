<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/htmlPage/tamao/html/config.jsp"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>獭猫科技-商家</title>
    <meta name="description" content="獭猫科技,专注母婴平台" />
    <meta name="keywords" content="獭猫科技,母婴，孕婴" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>htmlPage/tamao/css/basicCss/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>htmlPage/tamao/css/merchant_plat.css"/>
    <link rel="shortcut icon" href="<%=basePath%>htmlPage/tamao/images/favicon.ico" type="image/x-icon" />
</head>
<body>
<!--top-->
<jsp:include page="head.jsp" />
<!--main-->
<div class="main">
    <div class="content">
        <div class="top_news">
            <div class="left_pic">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                    	
                    	<c:forEach items="${json.imageList}" var="image">
                    		<div class="swiper-slide">
	                            <img src="<%=imagePath%>${image.url}" alt=""/>
	                        </div>
                    	</c:forEach>
                        
                    </div>
                </div>
                <!-- Add Pagination -->
                <div class="btn_gap"></div>
                <div class="btn_content">
                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <div class="right_blank">
                <div class="right_bar">
                    <div class="bar_head">
                        <img src="<%=basePath%>htmlPage/tamao/images/u345.png" alt=""/>
                        <h2>獭猫公告</h2>
                    </div>
                    <div class="bar_content">
                    	
                    	<c:forEach items="${json.noticeList}" var="notice">
                    		<div class="bar_list">
	                            <a class="alert_btn" href="website/webSiteGetNoticeDetail?noticeId=${notice.id}">${notice.title}</a>
	                        </div>
                    	</c:forEach>
                        
                    </div>
                </div>
                <div class="manege_btn">
                    <button  class="orange alert_btn" onclick="javascript:window.open('http://manage.lutrababy.com/operator/operatorLogin','_blank')">渠道商管理端</button>
                    <button class="blue alert_btn" onclick="javascript:window.open('http://manage.lutrababy.com/merchant/merchantLogin','_blank')">店铺管理端</button>
                </div>
            </div>
        </div>
        <div class="step">
            <div class="step_list">
                <div class="step_head">
                    <img src="<%=basePath%>htmlPage/tamao/images/u335.png" alt=""/>
                    <span>獭猫商家入驻流程</span>
                </div>
                <div class="step_pic">
                    <img src="<%=basePath%>htmlPage/tamao/images/u373.png" alt=""/>
                </div>
            </div>
            <div class="step_list step2">
                <div class="step_head" >
                    <img src="<%=basePath%>htmlPage/tamao/images/u335.png" alt=""/>
                    <span>獭猫渠道入驻流程</span>
                    <button class="apply_btn">申请入驻</button>
                </div>
                <div class="step_pic">
                    <img src="<%=basePath%>htmlPage/tamao/images/u375.png" alt=""/>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="gap"></div>
<!--申请入驻-->
<div class="apply_main">
    <div class="join_apply">
        <div class="apply_head">
            <h2>渠道申请入驻</h2>
        </div>
        <div class="cancel_btn">
            <img src="<%=basePath%>htmlPage/tamao/images/u359.png" alt=""/>
        </div>
        <div class="apply_inp">
            <div class="inp_list">
                <div class="inp_list_left">
                    <span>申请人姓名：</span>
                </div>
                <div class="inp_list_right">
                    <input type="text" id="apply_name" placeholder="输入申请人姓名"/>
                </div>
            </div>
            <div class="inp_list">
                <div class="inp_list_left">
                    <span>联系方式：</span>
                </div>
                <div class="inp_list_right">
                    <input type="text" id="apply_phone" placeholder="输入申请人联系方式"/>
                </div>
            </div>
            <div class="inp_list">
                <div class="inp_list_left">
                    <span>所在地区：</span>
                </div>
                <div class="inp_list_right">
                    <input type="text" id="apply_area" placeholder="输入渠道所在区域"/>
                </div>
            </div>
        </div>
        <div class="apply_now" onclick="operatorApply();">
            <button class="pink alert_btn">立即申请</button>
        </div>
    </div>
</div>

<!--foot-->
<jsp:include page="foot.jsp" />
<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/basicJs/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/basicJs/common.js"></script>
<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/merchant_plat.js"></script>
</body>
</html>
