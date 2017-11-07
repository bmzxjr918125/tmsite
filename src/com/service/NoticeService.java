package com.service;

import java.util.List;

import com.base.action.datatables.DataTables;
import com.entity.Notice;

public interface NoticeService {

	/**
	 * 
	 * <p>@Description: 保存</p>
	 * <p>@param @param notice</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:56:31</p>
	 */
	public void save(Notice notice);
	
	/**
	 * 
	 * <p>@Description: 删除</p>
	 * <p>@param @param id</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:56:48</p>
	 */
	public void deleteById(int id);
	
	/**
	 * 
	 * <p>@Description: 更新</p>
	 * <p>@param @param notice</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:57:03</p>
	 */
	public void update(Notice notice);
	
	/**
	 * 
	 * <p>@Description: 通过ID获取</p>
	 * <p>@param @param id
	 * <p>@param @return</p>   
	 * <p>@return Notice</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:57:26</p>
	 */
	public Notice getById(int id);
	
	/**
	 * 
	 * <p>@Description: 新闻公告列表</p>
	 * <p>@param @param dtJson
	 * <p>@param @param type</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:10:19</p>
	 */
	public void getNoticeList(DataTables dtJson,int type,String title);
	
	/**
	 * 
	 * <p>@Description: html端公告</p>
	 * <p>@param @return</p>   
	 * <p>@return List<Notice></p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午2:59:01</p>
	 */
	public List<Notice> getHtmlNotice();

	/**
	 * 
	 * <p>@Description: html端新闻</p>
	 * <p>@param @param i
	 * <p>@param @param pageNumber
	 * <p>@param @return</p>   
	 * <p>@return List<Notice></p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午2:59:13</p>
	 */
	public List<Notice> getHtmlNews(int i, int pageNumber);

	/**
	 * 
	 * <p>@Description: TODO</p>
	 * <p>@param @return</p>   
	 * <p>@return int</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午4:17:42</p>
	 */
	public int getTotalCount();
}
