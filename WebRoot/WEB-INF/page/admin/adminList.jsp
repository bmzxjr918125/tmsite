<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--公共头文件引入-->
<%@ include file="/WEB-INF/page/Include/include.inc.new.jsp"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>獭猫后台管理系统</title>
<style type="text/css">
	.orange {
	    background-position: 0 -190px;
	    border-color: #fb9337;
	    color: #fff;
	    width: 150px;
	}
	.popup_prompt {
    background: #f7f7f7 none repeat scroll 0 0;
    border: 1px solid #ccc;
    border-radius: 2px;
    box-shadow: 1px 1px 2px #eee inset;
    color: #666;
    margin: 5px 0;
    padding: 7px 5px;
	}}

	#admin_type {
	    background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	    border: medium none;
	    height: 31px;
	    opacity: 0;
	    position: absolute;
	}
	
	#admin_type {
	    border: 1px solid #fff;
	    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
	    font-size: 12px;
	    width: 85%;
	}
	
	#admin_type {
	    background: #fcfcfc none repeat scroll 0 0;
	    border: 1px solid #ccc;
	    border-radius: 2px;
	    box-shadow: 1px 1px 2px #ddd inset;
	    color: #666;
	    min-width: 40%;
	    padding: 5px 2px;
	}
</style>
</head>

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
				<div class="contenttitle2">
					<h3>管理员列表</h3>
				</div>
				<!--查询内容-->
				<div class="tableoptions">
					<span style="font-size: 14px;">管理员账号：</span>&nbsp;
					<input class="searchinput" type="text" id="adminAccount" style="width: 200px;"/>
					
					<a class="query_button btn btn_orange btn_search radius120" id="operator_query_button" style="cursor: pointer;margin-left: 50px;" >
						<span>查询</span>
					</a>
					
					<a class="query_button btn btn_orange btn_home radius120" id="admin_insert_button" style="cursor: pointer;margin-left: 50px;" >
						<span>新增</span>
					</a>
				</div>

				<!--列表内容-->
				<table cellpadding="0" cellspacing="0" border="0" class="stdtable stdtablecb" id="operatorAjaxShow_Table">
					<thead>
						<tr>
							<th class="head1"><input type="checkbox" class="checkall"/></th>
							<th class="head1">账号</th>
							<th class="head1">类型</th>
							<th class="head1">状态</th>
							<th class="head1">创建时间</th>
							<th class="head1">近一次登录</th>
							<th class="head1">操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
</body>
</html>
<script type="text/javascript" src="js/method.js"></script>
<script type="text/javascript" src="js/pack/datatables-pack.js"></script>
<script type="text/javascript" src="js/inputValidate.js"></script>
<script type="text/javascript" src="js/EnumExChange.js"></script>
<script type="text/javascript">
	
	var reqData = { };
	var oTable = null;
	
	jQuery(document).ready(function(){
		
		var table = jQuery("#operatorAjaxShow_Table");
		var columns = [
		               {
			       	    	"data":"id",
			       	    	"render":function(data,type,full){
			       	    		var content = "<div class='checker'><span>";
			       	    			content += "<input class='check' type='checkbox' value='"+data+"'>";
			       	    			content += "</span></div>";
			       	    		return content;
			       	    	},
			       	    	"orderable":false,
			       			"className":"center"
			       	   },
			{
				"data" : "username",
				"className" : "center",
				"orderable":false
			},
			{
				"data" : "type",
				"className" : "center",
				"orderable":false,
				"render" : function(data, type, full) {
					return adminType(data);
				}
			},
			{
				"data" : "status",
				"className" : "center",
				"orderable":false,
				"render" : function(data, type, full) {
					return adminStatus(data);
				}
			},
			{
				"data" : "creatDate",
				"render" : function(data, type, full) {
					return data != null ? UnixToDate(
							data.time, true, null)
							: "-.-.-";
				},
				"className" : "center",
				"orderable" : true
			},
			{
				"data" : "lastLoginDate",
				"render" : function(data, type, full) {
					return data != null ? UnixToDate(
							data.time, true, null)
							: "-.-.-";
				},
				"className" : "center",
				"orderable" : true
			},{
				"data":null,
		    	"render":function(data,type,full){
		    		
		    		//<a class='stdbtn orange' style='font-size: 12px;' onclick='cancellation("+ full.id +")'>注销</a>
		    		var content = "";
		    		
		    		if(full.status == 1 && full.type != 0){
		    			content = content + "&nbsp;&nbsp;<a class='stdbtn orange' style='font-size: 12px;' onclick='freezeAdmin("+ full.id +",-1)'>冻结</a>";
		    		}else if(full.status == -1){
		    			content = content + "&nbsp;&nbsp;<a class='stdbtn orange' style='font-size: 12px;' onclick='freezeAdmin("+ full.id +",1)'>解冻</a>";
					}
		    		
		    		return  content;
		    	},
		    	"orderable":false,"className":"center"
			}
		];
		var order = [ [ 4, "desc" ] ];
		var options = {
			"dom" : "rt<'table_bottom'lip><'clear'>"
		};
		oTable = DataTablePack.serverTable(table, "admin/adminAjaxGetAdminList", reqData, columns, order, options);
		
	});
	
	jQuery("#operator_query_button").click(function() {
		reqData["adminAccount"] = jQuery("#adminAccount").val();
		oTable.fnDraw();
	});
	
	/**
	* 新增
	*/
	jQuery('#admin_insert_button').click(function(){
		var html = 	"账号：<input class='popup_prompt' id='admin_account' placeholder='登录账号' maxlength='12'/><br/>"+
					"类型：<select id='admin_type'>"+
					"<option value='0'>超级管理员</option>"+
					"<option value='1'>管理员</option>"+
					"</select><br/>"+
		            "密码：<input type='password' class='popup_prompt' id='admin_pwd' placeholder='登录密码' maxlength='12'/><br/>";
		
		jBmzAlert(html, "新增管理员", function(r) {
			if (r) {
				var admin_account = jQuery( "#admin_account").val();
				var admin_type = jQuery( "#admin_type").val();
				var admin_pwd = jQuery( "#admin_pwd").val();
				if (admin_account == "") {
					jAlertErrorMsg("账号不能为空");
					return false;
				} else if (admin_pwd == "") {
					jAlertErrorMsg("密码不能为空");
					return false;
				}else {
					var url = "admin/adminSaveAdmin?admin_account=" + admin_account + 
							"&admin_type=" + admin_type +
							"&admin_pwd=" + admin_pwd;
					
					jQuery.axse(url, null, "请求发送中...",function(data){
						
	            	   if(data.response=="success"){
	            		   jAlertSuccessMsg(data.msg);
	            		   jAlertHide();
	            		   oTable.fnDraw();
	            	   }else{
	            		   jAlertErrorMsg(data.msg);
	            	   }
	                },
	                function(data){
	                	jAlertErrorMsg("请求错误");
	            	});
				}
			}
		});
	});
	
	/**
	* 注销
	*/
	function cancellation(id){
		
		jConfirm("<span style='color:red;font-size:16px;margin-left:50px;'>确定是否注销管理员，注销后将不能恢复？</span>","注销管理员", function(r){
			
			if (r) {
				
				var url = "admin/adminCancellationAdmin?adminId=" + id;
				
				jQuery.axse(url, null, "请求发送中...", function(data) {
					if (data.response == "success") {
						jAlertSuccessMsg(data.msg);
						jAlertHide();
						oTable.fnDraw();
					} else {
						jAlertErrorMsg(data.msg);
					}
				}, function(data) {
					jAlertErrorMsg("请求错误");
				});
			}
		});
	}
	
	/**
	* 冻结或者解冻
	*/
	function freezeAdmin(id,status){
		
		var html1 = "";
		var html2 = "";
		
		if (status == -1) {
			html1 = "确定是否冻结管理员？";
			html2 = "冻结管理员";
		}else if (status == 1) {
			html1 = "确定是否解冻管理员？";
			html2 = "解冻管理员";
		}
		
		jConfirm("<span style='color:red;font-size:16px;margin-left:50px;'>"+html1+"</span>",html2, function(r){
			
			if (r) {
				
				var url = "admin/adminFreezeAdmin?adminId=" + id + "&status=" + status;
				
				jQuery.axse(url, null, "请求发送中...", function(data) {
					if (data.response == "success") {
						jAlertSuccessMsg(data.msg);
						jAlertHide();
						oTable.fnDraw();
					} else {
						jAlertErrorMsg(data.msg);
					}
				}, function(data) {
					jAlertErrorMsg("请求错误");
				});
			}
		});
	}
	
	
	
	
	
</script>
