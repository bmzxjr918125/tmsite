<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/htmlPage/tamao/html/config.jsp"%>

<!DOCTYPE html>
<html>
<head lang="en">
 <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>獭猫科技-日常</title>
    <meta name="description" content="獭猫科技,专注母婴平台" />
    <meta name="keywords" content="獭猫科技,母婴，孕婴" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>htmlPage/tamao/css/basicCss/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>htmlPage/tamao/css/tamao_everyday.css"/>
    <link rel="shortcut icon" href="<%=basePath%>htmlPage/tamao/images/favicon.ico" type="image/x-icon" />
    <style type="text/css">
    	.demobox{
    		color: #999999;
    		font-size: 16px;
    		line-height: 57px;
    		height:57px;
    		overflow:hidden;
    		display:block;
   		}
   		#pagecontent{
   			position:relative;
   		}
   		
		#page_main{
			position:absolute;
			right:0;
			bottom:0;
		}
    </style>
</head>
<body>
<!--top-->
<jsp:include page="head.jsp" />
<!--main-->
<div class="main">
    <div class="content" style="min-height:860px;" id="pagecontent">
        <div class="news_content" id="news_content">
            
            <%--<c:forEach items="${json.newsList}" var="news">
            	<div class="news_list">
	                <div class="news_list_left">
	                    <img src="<%=imagePath%>${news.url}" alt=""/>
	                </div>
	                <div class="news_list_right">
	                    <div class="news_head">
	                        <h2 class="alert_btn">${news.title}</h2>
	                    </div>
	                    <div class="news_dic">
	                        <p>${news.content}</p>
	                    </div>
	                    <div class="news_label">
	                        <div class="news_date">
	                            <img src="<%=basePath%>htmlPage/tamao/images/u190.png" alt=""/>
	                            <span>${news.createDate}</span>
	                        </div>
	                        <div class="news_rep">
	                            <img src="<%=basePath%>htmlPage/tamao/images/u192.png" alt=""/>
	                            <span>獭猫</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </c:forEach>--%>
            
        </div>
        <div class="page">
            <div class="page_main" id="page_main">
            <%--<div class="page_prev">
                    <a class="pink_font" href="javascript:;">上一页</a>
                </div>
                <div class="page_num">
                    <a href="javascript:;">1</a>
                    <a href="javascript:;">2</a>
                    <a href="javascript:;">3</a>
                    <a href="javascript:;">4</a>
                    <a href="javascript:;">...</a>
                    <a href="javascript:;">4000</a>
                </div>
                <div class="page_next">
                    <a class="pink_font" href="javascript:;">下一页</a>
                </div>--%>
            </div>
        </div>
    </div>
</div>


<!--foot-->
<jsp:include page="foot.jsp" />
<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/basicJs/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/basicJs/common.js"></script>
<script type="text/javascript" src="<%=basePath%>htmlPage/tamao/js/tamao_everyday.js"></script>
</body>
</html>
