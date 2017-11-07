package com.admin.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.base.action.BaseAction;
import com.config.GeneralConfig;
import com.entity.Admin;
import com.entity.Image;
import com.entity.Lutrababy;
import com.exception.BizException;
import com.service.ImageService;
import com.service.LutrababyService;
import com.util.ImageCompressUtil;
import com.util.ImageUtils;
import com.util.RequestUtils;

@Controller("adminLutrababyAction")
@Scope("prototype")
public class AdminLutrababyAction extends BaseAction{

	/**
	 * <p>@Fields serialVersionUID : TODO</p>
	 */
	private static final long serialVersionUID = -4258919944806326286L;
	
	private JSONObject json;
	
	private LutrababyService lutrababyService;
	private ImageService imageService;
	
	private List<File> noticeImage;
  	private List<String> noticeImageFileName;
  	private List<String> noticeImageContentType;
  	
  	private List<File> lutraImage;
  	private List<String> lutraImageFileName;
  	private List<String> lutraImageContentType;
	
	/**
	 * 
	 * <p>@Description: 网站信息</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-25上午10:40:58</p>
	 */
	public String Show(){
		
		json = new JSONObject();
		
		Lutrababy lutrababy = lutrababyService.getById(1);
		
		json.put("id", lutrababy.getId());
		json.put("introduce", lutrababy.getIntroduce());
		json.put("contact", lutrababy.getContact());
		json.put("service_terms", lutrababy.getService_terms());
		json.put("legal_terms", lutrababy.getLegal_terms());
		
		Image image = imageService.getLutrababyImage();
		if (null != image) {
			json.put("imgId", image.getId());
			json.put("url", image.getUrl());
		}else {
			json.put("imgId", 0);
		}
		
		List<Image> imageList = imageService.getImageList(2);
		if (null != imageList && imageList.size() > 0) {
			
			List<Object> list = new ArrayList<Object>();
			Map<Object, Object> map = null;
			for (Image img : imageList) {
				
				map = new HashMap<Object, Object>();
				map.put("id", img.getId());
				map.put("url", img.getUrl());
				
				list.add(map);
			}
			json.put("imageList", list);
		}
		
		return "Show";
	}
	
	/**
	 * 
	 * <p>@Description: 保存网站信息</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-25上午11:23:54</p>
	 */
	public String Savelutrababy(){
		
		String introduce = RequestUtils.getStrParamter("lutra_introduce");
		String contact = RequestUtils.getStrParamter("lutra_contact");
		String serviceterms = RequestUtils.getStrParamter("lutra_serviceterms");
		String legalterms = RequestUtils.getStrParamter("lutra_legalterms");
		String deletelutraIds = RequestUtils.getStrParamter("deletelutraIds");
		String deletenoticeIds = RequestUtils.getStrParamter("deletenoticeIds");
		
		if (StringUtils.isEmpty(introduce)) {
			
			throw new BizException("请填写公司简介");
		}
		
		if (StringUtils.isEmpty(contact)) {
			
			throw new BizException("请填写联系方式");
		}
		
		if (StringUtils.isEmpty(serviceterms)) {
			
			throw new BizException("请填写服务条款");
		}
		
		if (StringUtils.isEmpty(legalterms)) {
			
			throw new BizException("请填写法律条款");
		}
		
		Admin admin = (Admin) request.getSession().getAttribute("adminInfo");
		if (null == admin) {
			
			throw new BizException("请重新登录");
		}
		
		Lutrababy lutrababy = lutrababyService.getById(1);
		lutrababy.setContact(contact);
		lutrababy.setIntroduce(introduce);
		lutrababy.setService_terms(serviceterms);
		lutrababy.setLegal_terms(legalterms);
		lutrababyService.update(lutrababy);
		
		if (!StringUtils.isEmpty(deletelutraIds)) {
			
			String[] ids = deletelutraIds.split(",");
			for (int i = 0; i < ids.length; i++) {
				
				imageService.deleteById(Integer.parseInt(ids[i]));
			}
		}
		
		if (!StringUtils.isEmpty(deletenoticeIds)) {
			
			String[] ids = deletenoticeIds.split(",");
			for (int i = 0; i < ids.length; i++) {
				
				imageService.deleteById(Integer.parseInt(ids[i]));
			}
		}
		
		// 公告页图片
		File nfile = null;
		long nfileSize = 0;
		
		if (null != noticeImage && noticeImage.size() > 0) {
			
			for (int i = 0; i < noticeImage.size(); i++) {
				
				nfile = this.getNoticeImage().get(i);
				nfileSize = nfile.length();
			}
			
			if (nfileSize > GeneralConfig.IMAGE_SIZE_2) {
				
				throw new BizException("上传图片过大！");
			}
			
			String imagePath = "";
			String ext = "";
			for (int i = 0; i < noticeImage.size(); i++) {
				
				ext = this.noticeImageFileName.get(i).substring(
						this.noticeImageFileName.get(i).lastIndexOf("."),
						this.noticeImageFileName.get(i).length());
				nfile = this.getNoticeImage().get(i);
				
				try {
					
					String imageName = ImageUtils.createUploadFileName(ext);
					
					// 数据库储存文件路径"stygImages/"+ImageUtils.createUploadFileName(ext)
					FileUtils.copyFile(nfile, new File(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC
							+ imageName));
					
					//转换为jpg格式
					imageName = ImageCompressUtil.convertImage2TypeJPG(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC
							+ imageName,imageName);
					
					//压缩转换后的jpg 大于100kb时需压缩
					//File jpgFile = new File(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC + imageName);
					
					/*for (int h = 0; h < 4; h++) {
						
						if (jpgFile.length() > GeneralConfig.JPG_IMAGE_SIZE) {
							
							ImageCompressUtil.imageCompress(ImageUtils.uploadNoticeImagePath + 
									GeneralConfig.DIR_LOC,imageName, imageName, 
									(float) 0.5,(float) (1 - 0.1 * h), 0, 0);
							
						} else {
							
							break;
						}
					}*/
					
					imagePath = ImageUtils.noticeImagePath + imageName;
					
					Image image = new Image();
					image.setType(2);
					image.setUrl(imagePath);
					image.setCreateDate(new Date());
					image.setLutrababy(lutrababy);
					
					imageService.save(image);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		// 公司简介图片
		File lfile = null;
		long lfileSize = 0;
		
		if (null != lutraImage && lutraImage.size() > 0) {
			
			for (int i = 0; i < lutraImage.size(); i++) {
				
				lfile = this.getLutraImage().get(i);
				lfileSize = lfile.length();
			}
			
			if (lfileSize > GeneralConfig.IMAGE_SIZE) {
				
				throw new BizException("上传图片过大！");
			}
			
			String imagePath = "";
			String ext = "";
			for (int i = 0; i < lutraImage.size(); i++) {
				
				ext = this.lutraImageFileName.get(i).substring(
						this.lutraImageFileName.get(i).lastIndexOf("."),
						this.lutraImageFileName.get(i).length());
				lfile = this.getLutraImage().get(i);
				
				try {
					
					String imageName = ImageUtils.createUploadFileName(ext);
					
					// 数据库储存文件路径"stygImages/"+ImageUtils.createUploadFileName(ext)
					FileUtils.copyFile(lfile, new File(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC
							+ imageName));
					
					//转换为jpg格式
					imageName = ImageCompressUtil.convertImage2TypeJPG(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC
							+ imageName,imageName);
					
					//压缩转换后的jpg 大于100kb时需压缩
					/*File jpgFile = new File(ImageUtils.uploadNoticeImagePath + GeneralConfig.DIR_LOC
							+ imageName);
					
					for (int h = 0; h < 4; h++) {
						
						if (jpgFile.length() > GeneralConfig.JPG_IMAGE_SIZE) {
							
							ImageCompressUtil.imageCompress(ImageUtils.uploadNoticeImagePath + 
									GeneralConfig.DIR_LOC,imageName, imageName, 
									(float) 0.5,(float) (1 - 0.1 * h), 0, 0);
							
						} else {
							
							break;
						}
					}*/
					
					imagePath = ImageUtils.noticeImagePath + imageName;
					
					Image image = new Image();
					image.setType(3);
					image.setUrl(imagePath);
					image.setCreateDate(new Date());
					image.setLutrababy(lutrababy);
					
					imageService.save(image);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return "Savelutrababy";
	}

	public JSONObject getJson() {
		return json;
	}

	public void setJson(JSONObject json) {
		this.json = json;
	}

	public LutrababyService getLutrababyService() {
		return lutrababyService;
	}

	@Resource(name = "lutrababyService")
	public void setLutrababyService(LutrababyService lutrababyService) {
		this.lutrababyService = lutrababyService;
	}

	public ImageService getImageService() {
		return imageService;
	}

	@Resource(name = "imageService")
	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	public List<File> getNoticeImage() {
		return noticeImage;
	}

	public void setNoticeImage(List<File> noticeImage) {
		this.noticeImage = noticeImage;
	}

	public List<String> getNoticeImageFileName() {
		return noticeImageFileName;
	}

	public void setNoticeImageFileName(List<String> noticeImageFileName) {
		this.noticeImageFileName = noticeImageFileName;
	}

	public List<String> getNoticeImageContentType() {
		return noticeImageContentType;
	}

	public void setNoticeImageContentType(List<String> noticeImageContentType) {
		this.noticeImageContentType = noticeImageContentType;
	}

	public List<File> getLutraImage() {
		return lutraImage;
	}

	public void setLutraImage(List<File> lutraImage) {
		this.lutraImage = lutraImage;
	}

	public List<String> getLutraImageFileName() {
		return lutraImageFileName;
	}

	public void setLutraImageFileName(List<String> lutraImageFileName) {
		this.lutraImageFileName = lutraImageFileName;
	}

	public List<String> getLutraImageContentType() {
		return lutraImageContentType;
	}

	public void setLutraImageContentType(List<String> lutraImageContentType) {
		this.lutraImageContentType = lutraImageContentType;
	}
	
}
