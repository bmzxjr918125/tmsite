/**
 * Created by Administrator on 2016-08-09.
 */

	function delHtmlTag(str){
		return str.replace(/<[^>]+>/g,"");//去掉所有的html标记
	}

function newsGetList(pageNumber,currentPage){
	
      var url = "website/webSiteAjaxGetNews?currentPage=" + currentPage;
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : url,
			data : "",
			dataType : "json",
			success : function(json) {
				if (json.response =="success") {
				    
				    if(json.newsList != null && json.newsList.length > 0){
				    	
				    	var content = "";
				    	for(var i = 0; i < json.newsList.length; i++){
				    		
				    		var contentstr = delHtmlTag(json.newsList[i].content);
				    		
				    		var html = "<div class='news_list'>"+
				    				   "<div class='news_list_left'>"+
				    				   "<img src='http://120.24.248.68:8081/"+json.newsList[i].url+"' alt=''/>"+
				    				   "</div><div class='news_list_right'>"+
				    				   "<div class='news_head'>"+
				    				   "<a href='website/webSiteGetNewsDetail?newsId="+json.newsList[i].id+"'><h2 class='alert_btn'>"+json.newsList[i].title+"</h2></a>"+
				    				   "</div><div class='news_dic'>"+
				    				   "<span class='demobox'>"+ contentstr +"</span></div>"+
				    				   "<div class='news_label'>"+
				    				   "<div class='news_date'>"+
				    				   "<img src='htmlPage/tamao/images/u190.png' alt=''/>"+
				    				   "<span>"+json.newsList[i].createDate+"</span>"+
				    				   "</div><div class='news_rep'>"+
				    				   "<img src='htmlPage/tamao/images/u192.png' alt=''/>"+
				    				   "<span>獭猫</span></div></div></div></div>";
				    		
					         content = content + html; 
				    	}
				    	$("#news_content").html("");
				    	$("#news_content").append(content);
				      
				    	//页标 
				    	var per = (currentPage-1) > 0 ? (currentPage-1) : 1;
				    	var next = (currentPage+1) < json.totalPage ? (currentPage+1):json.totalPage;
				      
				    	var pagecontent = "<div class='page_prev'><a class='pink_font'" +
				    			" onclick='newsGetList("+pageNumber+","+per+")' href='javascript:;'>上一页</a></div>";
				      
				    	pagecontent = pagecontent + "<div class='page_num'>";
				    	if(json.totalPage < 6){
				    		
				    		for(var i = 1; i < json.totalPage + 1; i++){
				    			
				    			if(json.currentPage == i){
				    				pagecontent = pagecontent + "<a style='background-color: #f2f2f2;border: 1px solid #f2f2f2;color: #ff66cc;' href='javascript:;'>"+i+"</a>";
				    			}else{
				    				pagecontent = pagecontent + "<a onclick='newsGetList("+pageNumber+","+i+")' href='javascript:;'>"+i+"</a>";
				    			}
				    		}
				    		
				    	} else {
				    		
				    		var f = 0;
				    		if((json.currentPage-1) > 0){
				    			f = json.currentPage-1;
				    		}else{
				    			f=json.currentPage;
				    		}
				    		var e = 0;    
				    		if((json.totalPage - json.currentPage) > 4){
				    			
				    			e= json.currentPage + 3;
					            for(var i=f;i<e;i++){
					            	
						            if(json.currentPage == i){
						                pagecontent = pagecontent+"<a style='background-color: #f2f2f2;border: 1px solid #f2f2f2;color: #ff66cc;' href='javascript:;'>"+i+"</a>";
							        }else{
							             pagecontent = pagecontent+"<a onclick='newsGetList("+pageNumber+","+i+")' href='javascript:;'>"+i+"</a>";
							        }
					            }
				    		}else{
				    			
				    			for(var i=json.totalPage-5;i<json.totalPage+1;i++){
				    				if(json.currentPage == i){
				    					pagecontent = pagecontent+"<a style='background-color: #f2f2f2;border: 1px solid #f2f2f2;color: #ff66cc;' href='javascript:;'>"+i+"</a>";
				    				}else{
				    					pagecontent = pagecontent+"<a onclick='newsGetList("+pageNumber+","+i+")' href='javascript:;'>"+i+"</a>";
				    				}
				    			}
					       }
				    	}
				    	pagecontent = pagecontent + "</div>";
				    	
				    	pagecontent = pagecontent + "<div class='page_next'><a class='pink_font' " +
				      		"onclick='newsGetList("+pageNumber+","+next+")' href='javascript:;'>下一页</a></div>";
						  
				    	$("#page_main").html("");
				    	$("#page_main").append(pagecontent);	
				      
				    }else{
				        if(!(currentPage>1)){
				            $("#page_main").html("<div style='text-align:center;margin-top:80px;'><span style='color: rgb(153, 153, 153);'>当前内容空空如也~~!</span></div>");
				        }
				    }
				} else {
					alert(json.msg);
				}
			}
		});
   }

	newsGetList(4,1);











