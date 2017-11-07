package com.service;

import com.base.action.datatables.DataTables;
import com.entity.Admin;

public interface AdminService {

	/**
	 * 
	 * <p>@Description: 保存</p>
	 * <p>@param @param admin</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-19下午4:35:05</p>
	 */
	public void save(Admin admin);
	
	/**
	 * 
	 * <p>@Description: 更新</p>
	 * <p>@param @param admin</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-19下午4:35:16</p>
	 */
	public void update(Admin admin);
	
	/**
	 * 
	 * <p>@Description: 通过账户获取Admin</p>
	 * <p>@param @param name
	 * <p>@param @return</p>   
	 * <p>@return Admin</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-19下午4:25:41</p>
	 */
	public Admin getAdminByName(String name);

	/**
	 * 
	 * <p>@Description: 管理员列表</p>
	 * <p>@param @param dt
	 * <p>@param @param currentPage
	 * <p>@param @param PageNumber
	 * <p>@param @return</p>   
	 * <p>@return List<Admin></p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20上午10:02:50</p>
	 */
	public void getAdminList(DataTables dtJson,String adminAccount);
	
	/**
	 * 
	 * <p>@Description: 通过id获取</p>
	 * <p>@param @param id
	 * <p>@param @return</p>   
	 * <p>@return Admin</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午3:04:40</p>
	 */
	public Admin getById(int id);
	
	/**
	 * 
	 * <p>@Description: 通过ID删除</p>
	 * <p>@param @param id</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午3:14:22</p>
	 */
	public void deleteById(int id);
	
	
	
	
	
	
	
	
	
}
