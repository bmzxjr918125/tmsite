package com.html.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import com.base.action.BaseAction;
import com.config.GeneralConfig;
import com.entity.Image;
import com.entity.Lutrababy;
import com.entity.Notice;
import com.service.ImageService;
import com.service.LutrababyService;
import com.service.NoticeService;
import com.util.RequestUtils;
import com.util.pojo.Answer;

/**
 * <p>ClassName: WebSiteAction</p>
 * <p>@Description: 网站前端</p>
 * <p>@author BianMingZhou</p>
 * <p>@date 2016-8-13上午11:09:53</p>
 */
@Controller("webSiteAction")
@Scope("prototype")
public class WebSiteAction extends BaseAction {
	
	private static final long serialVersionUID = -1891253587030064783L;
	protected static final Logger log = Logger.getLogger(WebSiteAction.class);
	
	private JSONObject json;
	
	private ImageService imageService;
	private NoticeService noticeService;
	private LutrababyService lutrababyService;
	
	/**
	 * 
	 * <p>@Description: 首页</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24上午11:00:30</p>
	 */
	public String IndexShow(){

		return "IndexShow";
	}
	
	/**
	 * 
	 * <p>@Description: 关于</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24上午11:00:38</p>
	 */
	public String AboutShow(){
		
		json = new JSONObject();
		
		Image image = imageService.getLutrababyImage();
		json.put("image", image);
		
		Lutrababy lutrababy = lutrababyService.getById(1);
		if (null != lutrababy) {
			
			json.put("introduce", HtmlUtils.htmlUnescape(lutrababy.getIntroduce()));
			json.put("contact", HtmlUtils.htmlUnescape(lutrababy.getContact()));
			json.put("service_terms", HtmlUtils.htmlUnescape(lutrababy.getService_terms()));
			json.put("legal_terms", HtmlUtils.htmlUnescape(lutrababy.getLegal_terms()));
		}
		
		return "AboutShow";
	}
	
	/**
	 * 
	 * <p>@Description: 日常</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24上午11:00:53</p>
	 */
	public String DayShow(){
		
		return "DayShow";
	}
	
	/**
	 * 
	 * <p>@Description: 新闻</p>
	 * <p>@param @throws IOException</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午3:50:16</p>
	 */
	public String AjaxGetNews() throws IOException{
		
		
		json = new JSONObject();
		
		int currentPage = RequestUtils.getIntParamter("currentPage");
		int pageNumber = GeneralConfig.HTML_SHOWNUMBER;
		int totalCount = noticeService.getTotalCount();
		int totalPage = countPage(totalCount);
		json.put("totalPage",totalPage);
		json.put("pageNumber", pageNumber);
		json.put("currentPage", currentPage);
		
		List<Notice> newsList = noticeService.getHtmlNews((currentPage-1)*pageNumber, pageNumber);
		if (null != newsList && newsList.size() > 0) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			List<Object> list = new ArrayList<Object>();
			Map<Object, Object> map = null;
			for (Notice notice : newsList) {
				
				map = new HashMap<Object, Object>();
				map.put("id", notice.getId());
				map.put("title", notice.getTitle());
				map.put("content", HtmlUtils.htmlUnescape(notice.getContent()));
				map.put("createDate", sdf.format(notice.getUpdateDate()));
				
				Image image = imageService.getNewsFirstImage(notice.getId());
				if (null != image) {
					
					map.put("url", image.getUrl());
				}
				
				list.add(map);
			}
			json.put("response", "success");
			json.put("newsList", list);
		}
		
		this.answer=new Answer(json);
        
        return super.ANSWER; 
	}
	
	/**
	 * 
	 * <p>@Description: 新闻详情</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午5:39:49</p>
	 */
	public String GetNewsDetail(){
		
		json = new JSONObject();
		int newsId = RequestUtils.getIntParamter("newsId");
		
		Notice notice = noticeService.getById(newsId);
		if (null != notice) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			json.put("title", notice.getTitle());
			json.put("content", HtmlUtils.htmlUnescape(notice.getContent()));
			json.put("createDate", sdf.format(notice.getUpdateDate()));
			
			List<Image> imageList = imageService.getImageByNoticeId(newsId);
			if (null != imageList && imageList.size() > 0) {
				
				List<Object> list = new ArrayList<Object>();
				Map<Object, Object> map = null;
				for (Image image : imageList) {
					
					map = new HashMap<Object, Object>();
					map.put("url", image.getUrl());
					
					list.add(map);
				}
				json.put("imageList", list);
			}
			
		}
		 return "GetNewsDetail";
	}
	
	/**
     * 
     * <p>@Description: 新闻详情</p>
     * <p>@param @return</p>   
     * <p>@return String</p> 
     * <p>@throws</p>
     * <p>@author TangTianBao</p>
     * <p>@date 2016-10-24下午5:39:49</p>
     */
    public String GetNewsDetailAjax(){
        
        json = new JSONObject();
        int newsId = RequestUtils.getIntParamter("newsId");
        
        Notice notice = noticeService.getById(newsId);
        if (null != notice) {
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            
            json.put("title", notice.getTitle());
            json.put("content", HtmlUtils.htmlUnescape(notice.getContent()));
            json.put("createDate", sdf.format(notice.getUpdateDate()));
            
            List<Image> imageList = imageService.getImageByNoticeId(newsId);
            if (null != imageList && imageList.size() > 0) {
                
                List<Object> list = new ArrayList<Object>();
                Map<Object, Object> map = null;
                for (Image image : imageList) {
                    
                    map = new HashMap<Object, Object>();
                    map.put("url", image.getUrl());
                    
                    list.add(map);
                }
                json.put("imageList", list);
            }
            
        }
        
        this.answer=new Answer(json);
        
        return super.ANSWER; 
    }
	
	/**
	 * 
	 * <p>@Description: 计算多少页</p>
	 * <p>@param @param totalCount
	 * <p>@param @return</p>   
	 * <p>@return int</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午4:16:16</p>
	 */
	public int countPage(int totalCount) {
		int countPage = (int) (totalCount % GeneralConfig.HTML_SHOWNUMBER == 0 ? totalCount
				/ GeneralConfig.HTML_SHOWNUMBER
				: (totalCount / GeneralConfig.HTML_SHOWNUMBER) + 1);
		return countPage;
	}
	
	/**
	 * 
	 * <p>@Description: 商家平台</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24上午11:01:03</p>
	 */
	public String PlatShow(){
		
		json = new JSONObject();
		
		List<Image> imageList = imageService.getImageList(2);
		if (null != imageList && imageList.size() > 0) {
			
			List<Object> list = new ArrayList<Object>();
			Map<Object, Object> map = null;
			for (Image image : imageList) {
				
				map = new HashMap<Object, Object>();
				map.put("url", image.getUrl());
				
				list.add(map);
			}
			json.put("imageList", list);
		}
		
		List<Notice> noticeList = noticeService.getHtmlNotice();
		if (null != noticeList && noticeList.size() > 0) {
			
			List<Object> list = new ArrayList<Object>();
			Map<Object, Object> map = null;
			for (Notice notice : noticeList) {
				
				map = new HashMap<Object, Object>();
				map.put("id", notice.getId());
				map.put("title", notice.getTitle());
				
				list.add(map);
			}
			json.put("noticeList", list);
		}
		
		return "PlatShow";
	}

	/**
	 * 
	 * <p>@Description: 公告详情</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午1:55:56</p>
	 */
	public String GetNoticeDetail(){
		
		json = new JSONObject();
		int noticeId = RequestUtils.getIntParamter("noticeId");
		
		Notice notice = noticeService.getById(noticeId);
		if (null != notice) {
			
			json.put("title", notice.getTitle());
			json.put("content", HtmlUtils.htmlUnescape(notice.getContent()));
		}
		
		return "GetNoticeDetail";
	}
	
	
	
	public JSONObject getJson() {
		return json;
	}

	public void setJson(JSONObject json) {
		this.json = json;
	}

	public NoticeService getNoticeService() {
		return noticeService;
	}

	@Resource(name = "noticeService")
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	public ImageService getImageService() {
		return imageService;
	}

	@Resource(name = "imageService")
	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	public LutrababyService getLutrababyService() {
		return lutrababyService;
	}

	@Resource(name = "lutrababyService")
	public void setLutrababyService(LutrababyService lutrababyService) {
		this.lutrababyService = lutrababyService;
	}

}
