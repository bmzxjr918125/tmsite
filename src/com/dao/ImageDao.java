package com.dao;

import java.util.List;

import com.base.dao.BaseDao;
import com.entity.Image;

public interface ImageDao extends BaseDao<Image>{

	/**
	 * 
	 * <p>@Description: 根据类型获取图片</p>
	 * <p>@param @param type
	 * <p>@param @return</p>   
	 * <p>@return List<Image></p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-21下午3:12:33</p>
	 */
	public List<Image> getImageList(int type);

	/**
	 * 
	 * <p>@Description: 根据id获取图片</p>
	 * <p>@param @param noticeId
	 * <p>@param @return</p>   
	 * <p>@return List<Image></p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-21下午3:36:53</p>
	 */
	public List<Image> getImageByNoticeId(int noticeId);

	/**
	 * 
	 * <p>@Description: 删除新闻图片</p>
	 * <p>@param @param newsId</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-21下午4:22:58</p>
	 */
	public void deleteByNewsId(int newsId);

	/**
	 * 
	 * <p>@Description: 公司图片</p>
	 * <p>@param @return</p>   
	 * <p>@return Image</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午2:39:58</p>
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
