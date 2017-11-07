package com.dao;

import java.util.List;

import com.base.action.datatables.DataTables;
import com.base.dao.BaseDao;
import com.entity.Notice;

public interface NoticeDao extends BaseDao<Notice>{

	/**
	 * 
	 * <p>@Description: 新闻公告</p>
	 * <p>@param @param dtJson
	 * <p>@param @param type</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:11:27</p>
	 */
	public void getNoticeList(DataTables dtJson, int type,String title);

	/**
	 * 
	 * <p>@Description: HTML端公告</p>
	 * <p>@param @return</p>   
	 * <p>@return List<Notice></p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24上午11:06:09</p>
	 */
	public List<Notice> getHtmlNotice();

	/**
	 * 
	 * <p>@Description: HTMl端 新闻</p>
	 * <p>@param @param first
	 * <p>@param @param pageNumber
	 * <p>@param @return</p>   
	 * <p>@return List<Notice></p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午3:00:20</p>
	 */
	public List<Notice> getHtmlNews(int first, int pageNumber);

	/**
	 * 
	 * <p>@Description: TODO</p>
	 * <p>@param @return</p>   
	 * <p>@return int</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24下午4:37:18</p>
	 */
	public int getTotalCount();

}
