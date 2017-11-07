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
	
	<style type="text/css">
		.uploader{
           display: none;
	    }
	     .imagefield img{
	           margin-top: 5px;
	           margin-bottom: 5px;
	           border-style:dashed;
	           border-color: gray;
	           border-width:1px;
	           width: 100px;
	           height: 100px;
	           cursor: pointer;
	    }
	     .imagefield {
	           margin-right: 25px;
	    }
	     .p_image{
	            background: #fff none repeat scroll 0 0;
			    border-left: 1px solid #ddd;
			    display: block;
			    margin-left: 220px;
			    padding: 20px;
	    }
	     .p_image img{
	           cursor: pointer;
	    }
	     .image_add_btn{
	           margin: 5px;
	           border-style:dashed;
	           border-color: gray;
	           border-width:1px;
	           width: 100px;
	           height: 100px;
	    }
	     .image_delete_btn{
	          color: #ff4800 ;
	          font-size: 18px;
	          position: absolute;
	          cursor: pointer;
	    }
	
	 .guigeimagefield img{
	           width: 35px;
	           height: 35px;
	           cursor: pointer;
	           vertical-align:middle;
	    }
	  .guige_delete_btn{
	           margin: 5px;
	          position: relative;
	          color: #000;
	          font-size: 10px;
	          background-color:#ff4800 ; 
	           border-radius:3px;
	           font-size: 14px;
	           color:#fff;
	           cursor: pointer;
	            width: 100px;
	           height: 100px;
	            padding-top: 5px;
	           padding-bottom: 5px;
	           padding-left:15px;
	           padding-right: 15px;
	    }
	    
	  .guige_add_btn{
	           margin: 5px;
	           width: 100px;
	           height: 100px;
	           padding-top: 5px;
	           padding-bottom: 5px;
	           padding-left:15px;
	           padding-right: 15px;
	           background-color:#78ce07; 
	           border-radius:3px;
	           font-size: 14px;
	           color:#fff;
	           cursor: pointer;
	    }   
	  .piliang_add_btn{
	           margin: 5px;
	           width: 100px;
	           height: 100px;
	           padding-top: 5px;
	           padding-bottom: 5px;
	           padding-left:15px;
	           padding-right: 15px;
	           background-color:#78ce07; 
	           border-radius:3px;
	           font-size: 14px;
	           color:#fff;
	           cursor: pointer;
	    }   
	
		.guige_table {
		  border:solid #ccc;
		   border-width:1px 0px 0px 1px;
		}
		.guige_table td{
		   border:solid #ccc;
		    border-width:0px 1px 1px 0px;
		    padding-top: 10px;
		    padding-bottom: 10px;
		}
		.salePrice,.saleCode{
		   background: #fcfcfc none repeat scroll 0 0;
		    border: 1px solid #ccc;
		    border-radius: 2px;
		    box-shadow: 0 1px 3px #ddd inset;
		    color: #666;
		    padding: 8px 5px;
		    vertical-align: middle;
		    width: 50%;
		}
	</style>
	
</head>
<script type="text/javascript">
	UE.getEditor('editor',{
		initialFrameWidth :780,//设置编辑器宽度
		initialFrameHeight:400,//设置编辑器高度
		scaleEnabled:true
	});
	
	UE.getEditor('sditor',{
		//initialFrameWidth :800,//设置编辑器宽度
		initialFrameHeight:400,//设置编辑器高度
		scaleEnabled:true
	});
	
	UE.getEditor('cditor',{
		//initialFrameWidth :800,//设置编辑器宽度
		initialFrameHeight:400,//设置编辑器高度
		scaleEnabled:true
	});
	
	UE.getEditor('lditor',{
		//initialFrameWidth :800,//设置编辑器宽度
		initialFrameHeight:400,//设置编辑器高度
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
		            	<li><a href="javascript:void(0)">返回</a></li>
		                <li>编辑</li>
		         	</ul>
		        
		           	<div class="contenttitle2">
		            	<h3>编辑</h3>
		           	</div>
		
					<form class="stdform stdform2"  id="webSiteNewsAddForm" method="post" action="admin/lutraSavelutrababy" enctype="multipart/form-data">
						<input type="hidden" value="${json.id}" name="lutrababyId"/>
						
		                <p>
		                	<label>公告页图片<span class="inputrequiredflag">*</span>
		                		<small>上传最多四张新闻图片.大小请不要超过1MB.<span style="color:#ff9900 ">图片尺寸750*420</span></small></label>
		                	</label>
		                    <span class="p_image">
		                    	<c:forEach items="${json.imageList}" var="img" varStatus="st">
			                    	<span  class="imagefield">
			                    		<input style="display: none;" type="file" name="noticeImage" id="noticefile${img.id}"  multipleaccept="image/*" onchange="handleFiles('notice',this,${img.id})"/>
								        <img id="noticeimg${img.id}" src="<%=imagePath%>${img.url}"/><!-- onclick="upImage('notice',${img.id})" -->
									    <strong class="image_delete_btn" onclick="deleteFile('notice',this,${img.id})"  title="删除">x</strong>
			                    	</span>
		                    	</c:forEach>
		                    	<img class="image_add_btn" id="notice_add_btn" src="images/add_image_btn.png" onclick="addFileInput(this,'notice');"/>
		                    </span>
		                </p>
		                
		                <p>
		                	<label>公司简介图片<span class="inputrequiredflag">*</span>
		                		<small><span style="color:#ff9900 ">图片尺寸750*420</span></small></label>
		                	</label>
		                    <span class="p_image">
		                    	<c:if test="${json.imgId eq 0}">
		                    		<span  class="imagefield">
			                    		<input style="display: none;"  type="file" name="lutraImage" id="lutrafile1"  multipleaccept="image/*" onchange="handleFiles('lutra',this,1)" />
								        <img id="lutraimg1" src="<%=imagePath%>${json.url}" onclick="upImage('lutra',1)"/>
			                    	</span>
		                    	</c:if>
		                    	<c:if test="${json.imgId ne 0}">
		                    		<span  class="imagefield">
			                    		<input style="display: none;"  type="file" name="lutraImage" id="lutrafile${json.imgId}"  multipleaccept="image/*" onchange="handleFiles('lutra',this,${json.imgId})" />
								        <img id="lutraimg${json.imgId}" src="<%=imagePath%>${json.url}" onclick="upImage('lutra',${json.imgId})"/>
			                    	</span>
		                    	</c:if>
		                    </span>
		                </p>
		                
		                <input type="hidden" value=""  name="deletelutraIds" id="deletelutraIds"/>
		                <input type="hidden" value=""  name="deletenoticeIds" id="deletenoticeIds"/>
		                
						<p>
							<label>公司简介<span class="inputrequiredflag">*</span></label>
							<span class="field">
			                	<textarea id="editor" style="height: 500px;" name="lutra_introduce" required>${json.introduce}</textarea>
			            	</span>
						</p>
						
						<p>
							<label>联系我们<span class="inputrequiredflag">*</span></label>
	                  		<span class="field">
	                  			<textarea id="cditor" style="height: 500px;" name="lutra_contact" required>${json.contact}</textarea>
                  			</span> 
						</p>
						
						<p>
							<label>服务条款<span class="inputrequiredflag">*</span></label>
							<span class="field">
			                	<textarea id="sditor" style="height: 500px;" name="lutra_serviceterms" required>${json.service_terms}</textarea>
			            	</span>
						</p>
						
						<p>
							<label>法律条款<span class="inputrequiredflag">*</span></label>
							<span class="field">
			                	<textarea id="lditor" style="height: 500px;" name="lutra_legalterms" required>${json.legal_terms}</textarea>
			            	</span>
						</p>
						
	                    <p class="stdformbutton">
	                    	<button class="submit radius2">确定</button>
	                    	<input class="reset radius2" type="reset" onclick="location.href='admin/lutraShow'" value="取消">
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
   jQuery("#webSiteNewsAddForm").validate({
		rules: {
	       "lutra_introduce":{    
		       required: true    
	       },  
	        "lutra_contact":{    
		       required: true    
	       }
		},
		messages: {
			"lutra_introduce":{
				required:"请填写公司简介",
			},
			"lutra_contact":{
				required:"请填写联系方式",
			}
		
		/*lastname: "Please enter your last name",
			email: "Please enter a valid email address",
			location: "Please enter your location"*/
		}
	});
   
	jQuery(function(){
		//jQuery("#notice_add_btn").click();
	});
   
	var flag = 1;
	//添加图片上传框
	function addFileInput(obj,qianzui){
		
		var currentNum=jQuery(obj).parent().find(".imagefield").size();
		
		if(currentNum < 4){
		    var span="<span  class='imagefield'>"+
						        "<input style='visibility:hidden;width:10px;'  type='file' name='"+qianzui+"Image' id='"+qianzui+"file"+flag+"'  multipleaccept='image/*' onchange='handleFiles(\""+qianzui+"\",this,"+flag+")' />"+
						      "<img id='"+qianzui+"img"+flag+"' src='images/add_image_default.png' onclick='upImage(\""+qianzui+"\","+flag+")'/>"+
							 "<strong class='image_delete_btn' onclick='deleteFile(\""+qianzui+"\",this,"+flag+")'  title='删除'>x</strong>"+
						   "</span>";
			jQuery(obj).before(span);
		   flag++;
	   }else{
		   
		   jAlertErrorMsg("最多添加四张图片哦！");
	   }
	}
	
	//移除
	function deleteFile(qianzui,obj,id){
		
		if(id != 0){
			jQuery("#delete"+qianzui+"Ids").val(jQuery("#delete"+qianzui+"Ids").val()+id+",");
		}
	  
		if(jQuery(obj).parent().parent().find(".imagefield").size()==1){
			jQuery("#"+qianzui+"_add_btn").click();
		}
		jQuery(obj).parent().remove();
	}
	
	window.URL = window.URL || window.webkitURL;
	
	//选择图片
	function upImage(qianzui,imagenum){
		
		if(imagenum != 0 && qianzui == "lutra"){
			jQuery("#delete"+qianzui+"Ids").val(jQuery("#delete"+qianzui+"Ids").val()+imagenum+",");
		}
		
		jQuery("#"+qianzui+"file" + imagenum).click();
	}
  
	//预览图片
	function handleFiles(qianzui,obj, imagenum) {
       
		var files = obj.files, img = new Image();
		var fileid="#"+qianzui+"img" + imagenum;
		var type=jQuery(obj).val().substring( jQuery(obj).val().lastIndexOf(".") + 1).toLowerCase();
		if( !(type=="jpg" || type=="jpeg" || type== "png" ) ){
			jQuery(obj).val("");
			 jAlertErrorMsg("请上传正确格式图片");
			return false;
		}
		
		if (window.URL) {
			if (files[0].size > 4194304) {
				alert("图片大小请不要超过4M");
				return false;
			}
			jQuery(fileid).attr("src",window.URL.createObjectURL(files[0]));
			jQuery(fileid).onload = function(e) {
				window.URL.revokeObjectURL(this.src); //图片加载后，释放object URL
			};

		} else if (window.FileReader) {
			var reader = new FileReader();
			reader.readAsDataURL(files[0]);
			reader.onload = function(e) {
				if (e.total > 4194304) {
					alert("图片大小请不要超过4M");
					return false;
				}
				jQuery(fileid).attr("src", this.result);
			};
		} else {
			//ie
			obj.select();
			obj.blur();
			var nfile = document.selection.createRange().text;
			document.selection.empty();
			jQuery(fileid).attr("src", this.nfile);
			jQuery(fileid).onload = function() {
				if (jQuery(fileid).fileSize > 4194304) {
					alert("图片大小请不要超过4M");
					return false;
				}
			};

		}
	}
	
   
</script>

</html>
