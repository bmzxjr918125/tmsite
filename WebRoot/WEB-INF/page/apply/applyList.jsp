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
					<h3>申请列表</h3>
				</div>
				<!--查询内容-->
				<div class="tableoptions">
					<span style="font-size: 14px;">联系电话：</span>&nbsp;
					<input class="searchinput" type="text" id="phone" style="width: 200px;"/>
					
					<a class="query_button btn btn_orange btn_search radius120" id="operator_query_button" style="cursor: pointer;margin-left: 50px;" >
						<span>查询</span>
					</a>
					
				</div>

				<!--列表内容-->
				<table cellpadding="0" cellspacing="0" border="0" class="stdtable stdtablecb" id="operatorAjaxShow_Table">
					<thead>
						<tr>
							<th class="head1"><input type="checkbox" class="checkall"/></th>
							<th class="head1">申请人</th>
							<th class="head1">联系电话</th>
							<th class="head1">申请区域</th>
							<th class="head1">状态</th>
							<th class="head1">发布时间</th>
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
				"data" : "phone",
				"className" : "center",
				"orderable":false
			},
			{
				"data" : "area",
				"className" : "center",
				"orderable":false
			},
			{
				"data" : "status",
				"className" : "center",
				"orderable":false,
				"render" : function(data, type, full) {
					return applyStatus(data);
				}
			},
			{
				"data" : "createDate",
				"render" : function(data, type, full) {
					return data != null ? UnixToDate(
							data.time, true, null)
							: "-.-.-";
				},
				"className" : "center",
				"orderable" : true
			},
			{
				"data":null,
		    	"render":function(data,type,full){
		    		
		    		var content = "<a class='stdbtn orange' style='font-size: 12px;' onclick='deleteApply("+ full.id +")'>删除</a>";
		    		if (data.status != -1 && data.status == 0) {
		    			content = content + "&nbsp;&nbsp;<a class='stdbtn orange' style='font-size: 12px;' onclick='handleApply("+ full.id +",1)'>同意</a>";
					}
		    		if (data.status != 1 && data.status == 0) {
		    			content = content + "&nbsp;&nbsp;<a class='stdbtn orange' style='font-size: 12px;' onclick='handleApply("+ full.id +",-1)'>拒绝</a>";
		    		}
		    		
		    		return  content;
		    	},
		    	"orderable":false,"className":"center"
			}
		];
		var order = [ [ 5, "desc" ] ];
		var options = {
			"dom" : "rt<'table_bottom'lip><'clear'>"
		};
		oTable = DataTablePack.serverTable(table, "admin/applyAjaxShow", reqData, columns, order, options);
		
	});
	
	jQuery("#operator_query_button").click(function() {
		reqData["phone"] = jQuery("#phone").val();
		oTable.fnDraw();
	});
	
	
	/**
	* 删除
	*/
	function deleteApply(id){
		
		jConfirm("<span style='color:red;font-size:16px;margin-left:50px;'>确定是否删除渠道申请，删除后将不能恢复？</span>","删除渠道申请", function(r){
			
			if (r) {
				
				var url = "admin/applyDeleteApply?applyId=" + id;
				
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
	* 下架，上架
	*/
	function handleApply(id,status){
		
		var html1 = "";
		var html2 = "";
		
		if (status == -1) {
			html1 = "确定是否拒绝渠道申请？";
			html2 = "拒绝渠道申请";
		}else if (status == 1) {
			html1 = "确定是否同意渠道申请？";
			html2 = "同意渠道申请";
		}
		
		jConfirm("<span style='color:red;font-size:16px;margin-left:50px;'>"+html1+"</span>",html2, function(r){
			
			if (r) {
				
				var url = "admin/applyHandleApply?applyId=" + id + "&status=" + status;
				
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
