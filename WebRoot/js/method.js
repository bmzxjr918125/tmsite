var xmlHttpRequest = null;
 //判断是否IE
if(window.ActiveXObject){
//如果是IE
xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
} else if(window.XMLHttpRequest){
//非IE
xmlHttpRequest = new XMLHttpRequest();
}

   /**
    * AJAX清除answer的session
    */
   function clearAnswer(){//
	  if(null!= xmlHttpRequest){		
			xmlHttpRequest.open("GET", "tmg/adminclearAnswer", true);
			xmlHttpRequest.onreadystatechange =  function (){
				if(xmlHttpRequest.readyState == 4){
					if(xmlHttpRequest.status == 200){
					//alert("session清除成功！");
						// alert(12312);
						var state=xmlHttpRequest.responseText;
						//alert(state);
						
					}
				}
			};
			xmlHttpRequest.send(null);	
			}}

   /**              
    * 时间戳转换日期              
    * @param <int> unixTime    待时间戳(秒)              
    * @param <bool> isFull    返回完整时间(Y-m-d 或者 Y-m-d H:i:s)              
    * @param <int>  timeZone   时区              
    */
    function UnixToDate(unixTime, isFull, timeZone) {
    	if(unixTime==null){
    		return "";
    	}else{
    	
      // if (typeof (timeZone) == 'number')
      // {
           unixTime = parseInt(unixTime) + 28800000;//东8区时间偏移量为28800000毫秒
      // }
       var time = new Date(unixTime);
       var ymdhis = "";
       ymdhis += time.getUTCFullYear() + "-";
       ymdhis += (time.getUTCMonth()+1) + "-";
       ymdhis += time.getUTCDate();
       if (isFull == true)
       {
           ymdhis += " " + time.getUTCHours() + ":";
           ymdhis += time.getUTCMinutes() + ":";
           ymdhis += time.getUTCSeconds();
       }
       return ymdhis;
   	
    	}
   }
    
    
   /**
    * AJAX删除药品图片
    * @param obj 
    * @param imagePath 图片路径
    * @param medicineId 药品Id
    */
    	function deleteMedicineImage(obj,imagePath,medicineId){
    		var imageSize=jQuery("#currentImagesize").val();
    		if(imageSize==1){
    			jAlert("当前为最后一张图片不能删除，可以先进行添加再删除该图！","提示");
    			return false;
    		}
    		jConfirm("删除图片将不可逆，确定删除？","系统提示",function(result){
    			if(!result){
    				return false;
    			}else{
    	    		 if(null!= xmlHttpRequest){		
    	    				xmlHttpRequest.open("GET", "tmg/medicineDeleteImage?id="+medicineId+"&imagePath="+imagePath, true);
    	    				xmlHttpRequest.onreadystatechange =  function (){
    	    					if(xmlHttpRequest.readyState == 4){
    	    						if(xmlHttpRequest.status == 200){
    	    							var state=xmlHttpRequest.responseText;
    	    							if(state==0){
    	    								obj.parentNode.parentNode.removeChild(obj.parentNode);
    	    							
    	    									document.getElementById("currentImagesize").value=imageSize-1;
    	    								
    	    							}else{
    	    							  jAlert("删除异常，请刷新重试！","提示");	
    	    							}
    	    						}
    	    					}
    	    				};
    	    				xmlHttpRequest.send(null);	
    	    				}
    			}
    		});
    	
    	
    		
    		
    	}
    	
    	/**
    	 * AJAX删除药品信息
    	 * ch:table中所有的复选框
    	 */
    	function deleteMedicine(ids){
    		  var result=false;
           jConfirm("确定删除这些药品信息，删除将不可逆！","系统提示",function(r){
        	   if(!r){
        		   return false;
        	   }else{
           		if(null!= xmlHttpRequest){		
           			xmlHttpRequest.open("GET", "tmg/medicineDelete?ids="+ids,false);//false表示同步
           			xmlHttpRequest.onreadystatechange =  function (){
           				if(xmlHttpRequest.readyState == 4){
           					if(xmlHttpRequest.status == 200){
           						var state1=xmlHttpRequest.responseText;
           						 var state = eval("(" + state1 + ")");
           						 
           						if(state.isSuccess==0){
           							result=true;

        							var ch = jQuery('#medicinetable').find('tbody input[type=checkbox]');	
        							
        							ch.each(function(){
           								if(jQuery(this).is(':checked')) {
           									jQuery(this).parents('tr').fadeOut(function(){
           										jQuery(this).remove();								//remove row when animation is finished
           									});
           								}
           							});
           							
           						}else{
           							jAlert("删除异常，->"+state.name+"<-该药品正在被部分商家使用，不能删除！","提示");	
           							result=false;
           						}
           					}
           				}
           			};
           			
           			xmlHttpRequest.send(null);	
           		} 
           		return result;
        	   }
           });
    	}
    
    
    
    	/**
    	 * AJAX删除保健品图片
    	 * @param obj 
    	 * @param imagePath 图片路径
    	 * @param medicineId 药品Id
    	 */
    	function deleteHealthcareImage(obj,imagePath,healthcareId){
    		var imageSize=jQuery("#currentImagesize").val();
    		if(imageSize==1){
    			jAlert("当前为最后一张图片不能删除，可以先进行添加再删除该图！","提示");
    			return false;
    		}
    	jConfirm("删除图片将不可逆，确定删除？","系统提示",function(result){
    		if(!result){
    			return false;
    		}else{
    			if(null!= xmlHttpRequest){		
        			xmlHttpRequest.open("GET", "tmg/healthcareDeleteImage?id="+healthcareId+"&imagePath="+imagePath, true);
        			xmlHttpRequest.onreadystatechange =  function (){
        				if(xmlHttpRequest.readyState == 4){
        					if(xmlHttpRequest.status == 200){
        						var state=xmlHttpRequest.responseText;
        						if(state==0){
        							obj.parentNode.parentNode.removeChild(obj.parentNode);
        							
        							document.getElementById("currentImagesize").value=imageSize-1;
        							
        						}else{
        							alert("删除异常，请刷新重试！");	
        						}
        					}
        				}
        			};
        			xmlHttpRequest.send(null);	
        		}
    		}
    	});
    	}
     
    	/**
    	 * AJAX删除保健品信息
    	 */
    	function deleteHealthcare(ids){
    		  var result=false;
            jConfirm("确定删除这些保健品信息，删除将不可逆！","系统提示",function(r){
            	if(!r){
            		
            	}else{
            		if(null!= xmlHttpRequest){		
            			xmlHttpRequest.open("GET", "tmg/healthcareDelete?ids="+ids,false);//false表示同步
            			xmlHttpRequest.onreadystatechange =  function (){
            				if(xmlHttpRequest.readyState == 4){
            					if(xmlHttpRequest.status == 200){
            						
            						var state1=xmlHttpRequest.responseText;
            						 var state = eval("(" + state1 + ")");
            						if(state.isSuccess==0){
            							result=true;
            						
            							var ch = jQuery('#healthcaretable').find('tbody input[type=checkbox]');	
            							
            							ch.each(function(){
               								if(jQuery(this).is(':checked')) {
               									jQuery(this).parents('tr').fadeOut(function(){
               										jQuery(this).remove();								//remove row when animation is finished
               									});
               								}
               							});
            						
            						}else{
            							
            							jAlert("删除异常，->"+state.name+"<-该保健品正在被部分商家使用，不能删除！","提示");	
            							result=false;
            						}
            					}
            				}
            			};
            			
            			xmlHttpRequest.send(null);	
            		}
            		return result;
            	}
            });
    	}
    	
    	
    
    	/**
    	 * AJAX导出系统数据库数据
    	 */
    	function databankDaochu(){
    		
    		jConfirm('导出数据需花费一点点时间，请耐心等待！', '系统提示',function(result){
    			if(!result){
    				return false;
    			}else{
    				if(null!= xmlHttpRequest){	
    	    			
    	    			xmlHttpRequest.open("GET", "tmg/sysInfodaochu",true);//false表示同步
    	    			xmlHttpRequest.onreadystatechange =  function (){
    	    				if(xmlHttpRequest.readyState == 4){
    	    					if(xmlHttpRequest.status == 200){
    	    						var state=xmlHttpRequest.responseText;
    	    						if(state==0){
    	    							window.location.href="tmg/sysInfoxiazai.action";
    	    						}else{
    	    							jAlert("导出异常，请联系管理员！","提示");	
    	    						}
    	    					}
    	    				}
    	    			};
    	    			
    	    			xmlHttpRequest.send(null);	
    	    		}
    			}
    		});
    		
    		
    	}
    	
    	/**
    	 * 删除启动图片
    	 */
    function 	clientSplashDelete(id){
    	 jConfirm("确定删除，删除将不可逆！","系统提示",function(r){
         	if(!r){
         		
         	}else{
         		if(null!= xmlHttpRequest){		
         			xmlHttpRequest.open("GET", "tmg/clientSplashDelete?id="+id,true);//false表示同步
         			xmlHttpRequest.onreadystatechange =  function (){
         				if(xmlHttpRequest.readyState == 4){
         					if(xmlHttpRequest.status == 200){
         						
         						var state1=xmlHttpRequest.responseText;
         						 var state = eval("(" + state1 + ")");
         						if(state.isSuccess==0){
         							location.href="tmg/clientSplashShow";
         						}else{
         							jAlert("删除异常！","提示");	
         						}
         					}
         				}
         			};
         			
         			xmlHttpRequest.send(null);	
         		}
         	}
         });
    	
    	
    }
    
    

	
	/**
	 * 数据加载或页面跳转等待的遮挡层  打开（gif图片）
	 */
	function loadWait(msg) {
		if(msg==null){
			msg="加载中. . .";
		}
		//alert("调用loadWait");
		/*$(".loadWait").remove();
		var divcss = "style='width:100%;height:100%;position:fixed;background-color:#000;opacity:0.3;top: 0;left: 0;text-align:center;z-index:900;'";
		var div = "<div id='loadWaitId' class='loadWait' align='center' " + divcss
				+ "><img  src='apppage/images/loading.gif'  alt='' /></div>";
		var loadWait = $(".loadWait");
			$("body").append(div);
		$(".loadWait img").css("margin-top", $(".loadWait").height() / 3);
		$(".loadWait").css("display", "block");*/
		$(".loadWait").remove();
		var divcss = "style='width:100%;height:100%;position:fixed;background-color:#000;opacity:0.3;top: 0;left: 0;text-align:center;z-index:900;'";
		var div = "<div id='loadWaitId' class='loadWait' align='center' " + divcss+">" +
					 "<div class='load-container load8'>"+
					    "<div class='loader'></div>"+
					    "<div>"+msg+"</div>"+
				     "</div>" +
			      "</div>";
		//var loadWait = $(".loadWait");
		$("body").append(div);
		$(".load-container").css("margin-top", $(".loadWait").height() /2);
		$(".loadWait").css("display", "block");
		//alert(1);
	}
	/**
	 * 数据加载或页面跳转等待的遮挡层  打开(文字提示)
	 */
	function loadWait_Span(msg) {
		//alert("调用loadWait");
		$(".loadWait").remove();
		var divcss = "style='width:100%;height:100%;position:fixed;background-color:#000;opacity:0.3;top:0;left: 0;z-index:900;'";
		var div = "<div id='loadWaitId' class='loadWait' align='center' " + divcss
		+ "><div style='position:fixed;top:45%;width: 100%;text-align:center;'><span height=''>"+msg+"</span></div></div>";
		var loadWait = $(".loadWait");
		$("body").append(div);
		$(".loadWait").css("display", "block");
		$(".loadWait span").css("color","white");

		//alert(1);
	}
	/**
	 * 数据加载或页面跳转等待的遮挡层  关闭
	 */
	function removeLoadWait() {
		setTimeout(function(){
			$(".loadWait").remove();
		},200);

	}
    	
	/** 
	 * 将数值四舍五入(保留2位小数)后格式化成金额形式 
	 * 
	 * @param num 数值(Number或者String) 
	 * @return 金额格式的字符串,如'1,234,567.45' 
	 * @type String 
	 */  
	function formatCurrency(num) {  
	    num = num.toString().replace(/\$|\,/g,'');  
	    if(isNaN(num))  
	        num = "0";  
	    sign = (num == (num = Math.abs(num)));  
	    num = Math.floor(num*100+0.50000000001);  
	    cents = num%100;  
	    num = Math.floor(num/100).toString();  
	    if(cents<10)  
	    cents = "0" + cents;  
	    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
	    num = num.substring(0,num.length-(4*i+3))+','+  
	    num.substring(num.length-(4*i+3));  
	    return (((sign)?'':'-') + num + '.' + cents);  
	} 
	
	
	
	/**
	 * ajax封装 url 发送请求的地址 data 发送到服务器的数据，数组存储，如：{"date": new Date().getTime(),
	 * "state": 1} dataType 预期服务器返回的数据类型，常用的如：xml、html、json、text successfn
	 * 成功回调函数 errorfn 失败回调函数
	 */
	jQuery.axse = function(url, data,loadMsg,successfn, errorfn) {
		data = (data == null || data == "" || typeof (data) == "undefined") ? {
			"date" : new Date().getTime()
		} : data;
		if( loadMsg != null){
			loadWait(loadMsg);
		}
		
		jQuery.ajax({
			type : "post",
			data : data,
			url : url,
			dataType : "json",
			success : function(d) {
				removeLoadWait();
				successfn(d);
			},
			error : function(e) {
				removeLoadWait();
				errorfn(e);
			}
		});
	};
	/***************************************
	 * 封装ajax调用实例
	 **************************************/
/*	jQuery(function(){
		jQuery.ax(
	                "http://127.0.0.1:8080/tmms/tmu/apiv1/clientUserApiResetMemberPwd",
	                null,
	                null,
	                null,
	                null, 
	                function(data){
	                    alert(data.msg);
	                }, 
	                function(data){
	                	alert(data.msg);
	                }
	            );
	            
	            jQuery.axs("http://127.0.0.1:8080/tmms/tmu/apiv1/clientUserApiResetMemberPwd", null,"asdas", function(a){
	            	alert(a.msg);
	            });
	        
	            jQuery.axse("http://127.0.0.1:8080/tmms/tmu/apiv1/clientUserApiResetMemberPwd",
	                null, 
	                "asda",
	                function(data){
	            	alert(data.msg);
	                },
	                function(data){
	                	alert(data.msg);
	            });
	        });*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	