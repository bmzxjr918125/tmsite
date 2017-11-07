package com.admin.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.base.action.BaseAction;
import com.base.action.datatables.DataTables;
import com.config.GeneralConfig;
import com.entity.Admin;
import com.entity.Image;
import com.entity.Notice;
import com.exception.BizException;
import com.service.ImageService;
import com.service.NoticeService;
import com.util.ImageCompressUtil;
import com.util.ImageUtils;
import com.util.RequestUtils;
import com.util.pojo.Answer;

@Controller("adminNewsAction")
@Scope("prototype")
public class AdminNewsAction extends BaseAction{

	/**
	 * <p>@Fields serialVersionUID : TODO</p>
	 */
	private static final long serialVersionUID = 4803483746305505499L;
	
	private JSONObject json;
	
	private NoticeService noticeService;
	private ImageService imageService;
	
	private List<File> newsImage;
  	private List<String> newsImageFileName;
  	private List<String> newsImageContentType;

	/**
	 * 
	 * <p>@Description: 新闻</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:54:34</p>
	 */
	public String Show(){
		
		return "Show";
	}
	
	/**
	 * 
	 * <p>@Description: 新闻数据</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:54:43</p>
	 */
	public String AjaxShow(){
		
		String news_title = RequestUtils.getStrParamter("news_title");
		
		noticeService.getNoticeList(super.getDtJson(), 1, news_title);
		
		DataTables data = super.getDtJson();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略 
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);//设置循环策略为忽略    解决json最头疼的问题 死循环
		jsonConfig.setExcludes(new String[]{"handler","hibernateLazyInitializer"});  
		super.getDtJson().setData(JSONArray.fromObject(data.getData(),jsonConfig));
		
		return "AjaxShow";
	}
	
	/**
	 * 
	 * <p>@Description: 添加新闻</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:54:54</p>
	 */
	public String AddNews(){
		
		return "AddNews";
	}
	
	/**
	 * 
	 * <p>@Description: 保存新闻</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:55:04</p>
	 */
	public String SaveNews(){
		
		String title = RequestUtils.getStrParamter("news_title");
		String content = RequestUtils.getStrParamter("news_content");
		
		if (StringUtils.isEmpty(title)) {
			
			throw new BizException("请填写标题");
		}
		
		if (StringUtils.isEmpty(content)) {
			
			throw new BizException("请填写内容");
		}
		
		Admin admin = (Admin) request.getSession().getAttribute("adminInfo");
		if (null == admin) {
			
			throw new BizException("请重新登录");
		}
		
		Notice notice = new Notice();
		notice.setAdmin(admin);
		notice.setContent(content);
		notice.setTitle(title);
		notice.setCreateDate(new Date());
		notice.setUpdateDate(new Date());
		notice.setStatus(1);
		notice.setType(1);
		
		noticeService.save(notice);
		
		File file = null;
		long fileSize = 0;
		
		if (null != newsImage && newsImage.size() > 0){
			
			for (int i = 0; i < newsImage.size(); i++) {
				
				file = this.getNewsImage().get(i);
				fileSize = file.length();
			}
			
			if (fileSize > GeneralConfig.IMAGE_SIZE) {
				
				throw new BizException("上传图片过大！");
			}
			
			String imagePath = "";
			String ext = "";
			for (int i = 0; i < newsImage.size(); i++) {
				
				ext = this.newsImageFileName.get(i).substring(
						this.newsImageFileName.get(i).lastIndexOf("."),
						this.newsImageFileName.get(i).length());
				file = this.getNewsImage().get(i);
				
				try {
					
					String imageName = ImageUtils.createUploadFileName(ext);
					
					// 数据库储存文件路径"stygImages/"+ImageUtils.createUploadFileName(ext)
					FileUtils.copyFile(file, new File(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC
							+ imageName));
					
					//转换为jpg格式
					imageName = ImageCompressUtil.convertImage2TypeJPG(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC
							+ imageName,imageName);
					
					//压缩转换后的jpg 大于100kb时需压缩
					File jpgFile=new File(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC
							+ imageName);
					
					for (int h = 0; h < 4; h++) {
						
						if (jpgFile.length() > GeneralConfig.JPG_IMAGE_SIZE) {
							
							ImageCompressUtil.imageCompress(ImageUtils.uploadNoticeImagePath + 
									GeneralConfig.DIR_LOC,imageName, imageName, 
									(float) 0.5,(float) (1 - 0.1 * h), 0, 0);
							
						} else {
							
							break;
						}
					}
					
					imagePath = ImageUtils.noticeImagePath + imageName;
					
					Image image = new Image();
					image.setType(1);
					image.setUrl(imagePath);
					image.setCreateDate(new Date());
					image.setNotice(notice);
					
					imageService.save(image);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return "SaveNews";
	}

	/**
	 * 
	 * <p>@Description: 修改</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午5:17:44</p>
	 */
	public String UpdateNews(){
		
		int newsId = RequestUtils.getIntParamter("newsId");
		
		Notice notice = noticeService.getById(newsId);
		if (null == notice) {
			
			throw new BizException("新闻不存在");
		}
		
		json = new JSONObject();
		
		json.put("notice", notice);
		
		List<Image> lists = imageService.getImageByNoticeId(newsId);
		if (null != lists && lists.size() > 0) {
			
			List<Object> list = new ArrayList<Object>();
			Map<Object, Object> map = null;
			for (Image image : lists) {
				
				map = new HashMap<Object, Object>();
				map.put("id", image.getId());
				map.put("type", image.getType());
				map.put("noticeId", image.getNotice().getId());
				map.put("url", image.getUrl());
				
				list.add(map);
			}
			json.put("imageList", list);
		}
		
		return "UpdateNews";
	}
	
	/**
	 * 
	 * <p>@Description: 修改后保存</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午5:20:19</p>
	 */
	public String UpdateSaveNews(){
		
		int newsId = RequestUtils.getIntParamter("newsId");
		String title = RequestUtils.getStrParamter("news_title");
		String content = RequestUtils.getStrParamter("news_content");
		String deletenewsIds = RequestUtils.getStrParamter("deletenewsIds");
		
		if (StringUtils.isEmpty(title)) {
			
			throw new BizException("请填写标题");
		}
		
		if (StringUtils.isEmpty(content)) {
			
			throw new BizException("请填写内容");
		}
		
		Admin admin = (Admin) request.getSession().getAttribute("adminInfo");
		if (null == admin) {
			
			throw new BizException("请重新登录");
		}
		
		Notice notice = noticeService.getById(newsId);
		if (null == notice) {
			
			throw new BizException("公告不存在");
		}
		
		notice.setAdmin(admin);
		notice.setContent(content);
		notice.setTitle(title);
		notice.setUpdateDate(new Date());
		
		noticeService.update(notice);
		
		if (!StringUtils.isEmpty(deletenewsIds)) {
			
			String[] ids = deletenewsIds.split(",");
			for (int i = 0; i < ids.length; i++) {
				
				imageService.deleteById(Integer.parseInt(ids[i]));
			}
		}
		
		File file = null;
		long fileSize = 0;
		
		if (null != newsImage && newsImage.size() > 0) {
			
			for (int i = 0; i < newsImage.size(); i++) {
				
				file = this.getNewsImage().get(i);
				fileSize = file.length();
			}
			
			if (fileSize > GeneralConfig.IMAGE_SIZE) {
				
				throw new BizException("上传图片过大！");
			}
			
			String imagePath = "";
			String ext = "";
			for (int i = 0; i < newsImage.size(); i++) {
				
				ext = this.newsImageFileName.get(i).substring(
						this.newsImageFileName.get(i).lastIndexOf("."),
						this.newsImageFileName.get(i).length());
				file = this.getNewsImage().get(i);
				
				try {
					
					String imageName = ImageUtils.createUploadFileName(ext);
					
					// 数据库储存文件路径"stygImages/"+ImageUtils.createUploadFileName(ext)
					FileUtils.copyFile(file, new File(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC
							+ imageName));
					
					//转换为jpg格式
					imageName = ImageCompressUtil.convertImage2TypeJPG(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC
							+ imageName,imageName);
					
					//压缩转换后的jpg 大于100kb时需压缩
					File jpgFile=new File(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC
							+ imageName);
					
					for (int h = 0; h < 4; h++) {
						
						if (jpgFile.length() > GeneralConfig.JPG_IMAGE_SIZE) {
							
							ImageCompressUtil.imageCompress(ImageUtils.uploadNoticeImagePath + 
									GeneralConfig.DIR_LOC,imageName, imageName, 
									(float) 0.5,(float) (1 - 0.1 * h), 0, 0);
							
						} else {
							
							break;
						}
					}
					
					imagePath = ImageUtils.noticeImagePath + imageName;
					
					Image image = new Image();
					image.setType(1);
					image.setUrl(imagePath);
					image.setCreateDate(new Date());
					image.setNotice(notice);
					
					imageService.save(image);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return "UpdateSaveNews";
	}
	
	/**
	 * 
	 * <p>@Description: 删除</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午5:44:23</p>
	 */
	public String DeleteNews(){
		
		int newsId = RequestUtils.getIntParamter("newsId");
		
		Notice notice = noticeService.getById(newsId);
		if (null == notice) {
			
			throw new BizException("新闻不存在");
		}
		
		imageService.deleteByNewsId(newsId);
		
		noticeService.deleteById(newsId);
		
		this.answer = new Answer(Answer.SUCCESS,Answer.SUCCESS_CODE,"操作成功");
		return super.ANSWER;
	}
	
	/**
	 * 
	 * <p>@Description: 下架或者上架</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午5:45:28</p>
	 */
	public String CloseNews(){
		
		int newsId = RequestUtils.getIntParamter("newsId");
		int status = RequestUtils.getIntParamter("status");
		
		Notice notice = noticeService.getById(newsId);
		if (null == notice) {
			
			throw new BizException("新闻不存在");
		}
		
		notice.setStatus(status);
		noticeService.update(notice);
		
		this.answer = new Answer(Answer.SUCCESS,Answer.SUCCESS_CODE,"操作成功");
		return super.ANSWER;
	}
	
	
	
	public NoticeService getNoticeService() {
		return noticeService;
	}

	@Resource(name = "noticeService")
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	public JSONObject getJson() {
		return json;
	}

	public void setJson(JSONObject json) {
		this.json = json;
	}

	public ImageService getImageService() {
		return imageService;
	}

	@Resource(name = "imageService")
	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	public List<File> getNewsImage() {
		return newsImage;
	}

	public void setNewsImage(List<File> newsImage) {
		this.newsImage = newsImage;
	}

	public List<String> getNewsImageFileName() {
		return newsImageFileName;
	}

	public void setNewsImageFileName(List<String> newsImageFileName) {
		this.newsImageFileName = newsImageFileName;
	}

	public List<String> getNewsImageContentType() {
		return newsImageContentType;
	}

	public void setNewsImageContentType(List<String> newsImageContentType) {
		this.newsImageContentType = newsImageContentType;
	}
	
}
