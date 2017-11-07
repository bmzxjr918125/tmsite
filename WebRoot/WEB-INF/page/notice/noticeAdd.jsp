<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--公共头文件引入-->
<%@ include file="/WEB-INF/page/Include/include.inc.new.jsp"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>獭猫后台管理系统</title>
	<script type="text/javascript" src="<%=basePath%>ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="<%=basePath%>ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>ueditor/lang/zh-cn/zh-cn.js"></script>

</head>
<script type="text/javascript">
	UE.getEditor('editor',{
		//initialFrameWidth :800,//设置编辑器宽度
		initialFrameHeight:800,//设置编辑器高度
		scaleEnabled:true
	});
</script>
<body class="withvernav">
	<div class="bodywrapper">
		<!--topheader引入-->
		<jsp:include page="/WEB-INF/page/Include/topheader.jsp" />
	   	<!--header引入-->
	   	<jsp:include page="/WEB-INF/page/Include/header.jsp" />
	   	<!--vaernav2iconmenu引入-->
	   	<jsp:include page="/WEB-INF/page/Include/vernav2iconmenu.jsp" />
	   
		<!--右部类容--> 
	    <div class="centercontent">
			<div id="contentwrapper" class="contentwrapper">
				<div id="validation" class="subcontent">
					<ul class="breadcrumbs">
		            	<li><a onclick="history.go(-1);" href="javascript:void(0)">返回</a></li>
		                <li>新增</li>
		         	</ul>
		        
		           	<div class="contenttitle2">
		            	<h3>新增</h3>
		           	</div>
		
					<form class="stdform stdform2"  id="webSiteTrendAddForm" method="post" action="admin/noticeSaveNotice">
						<p>
							<label>标题<span class="inputrequiredflag">*</span></label>
	                  		<span class="field"><input type="text" name="notice_title"  class="smallinput" /></span> 
						</p>
						<p>
							<label>内容<span class="inputrequiredflag">*</span></label>
							<span class="field">
			                	<textarea id="editor" style="height: 500px;" name="notice_content" required></textarea>
			            	</span>
						</p>
	                    <p class="stdformbutton">
	                    	<button class="submit radius2">确定</button>
	                    	<input class="reset radius2" type="reset" onclick="location.href='admin/noticeShow'" value="取消">
						</p> 
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="js/validateMethod.js"></script>
<script type="text/javascript" src="js/method.js"></script>
<script type="text/javascript" src="js/pack/datatables-pack.js"></script>
<script type="text/javascript" src="js/inputValidate.js"></script>
<script type="text/javascript" src="js/EnumExChange.js"></script>
<script type="text/javascript">

   //表单验证
   jQuery("#webSiteTrendAddForm").validate({
		rules: {
	       "notice_title":{    
		       required: true    
	       },  
	        "notice_content":{    
		       required: true    
	       }
		},
		messages: {
			"notice_title":{
				required:"请填写公告标题",
			},
			"notice_content":{
				required:"请填写公告内容",
			}
		
		/*lastname: "Please enter your last name",
			email: "Please enter a valid email address",
			location: "Please enter your location"*/
		}
	});
	
   
</script>

</html>
