package com.service;

import java.util.List;

import com.entity.Image;

public interface ImageService {

	/**
	 * 
	 * <p>@Description: 保存</p>
	 * <p>@param @param image</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-21下午2:57:01</p>
	 */
	public void save(Image image);
	
	/**
	 * 
	 * <p>@Description: 删除</p>
	 * <p>@param @param id</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-21下午2:57:34</p>
	 */
	public void deleteById(int id);
	
	/**
	 * 
	 * <p>@Description: 删除新闻图片</p>
	 * <p>@param @param newsId</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-21下午4:22:25</p>
	 */
	public void deleteByNewsId(int newsId);
	
	/**
	 * 
	 * <p>@Description: 更新</p>
	 * <p>@param @param image</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-21下午2:58:03</p>
	 */
	public void update(Image image);
	
	/**
	 * 
	 * <p>@Description: 图片列表</p>
	 * <p>@param @param type
	 * <p>@param @return</p>   
	 * <p>@return List<Image></p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-21下午3:11:44</p>
	 */
	public List<Image> getImageList(int type);

	/**
	 * 
	 * <p>@Description: TODO</p>
	 * <p>@param @param noticeId
	 * <p>@param @return</p>   
	 * <p>@return List<Image></p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-21下午3:36:26</p>
	 */
	public List<Image> getImageByNoticeId(int noticeId);
	
	/**
	 * 
	 * <p>@Description: TODO</p>
	 * <p>@param @return</p>   
	 * <p>@return Image</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午2:39:19</p>
	 */
	public Image getLutrababyImage();
	
	/**
	 * 
	 * <p>@Description: 新闻第一张图片</p>
	 * <p>@param @param id
	 * <p>@param @return</p>   
	 * <p>@return Image</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午3:23:23</p>
	 */
	public Image getNewsFirstImage(int newsId);
}
