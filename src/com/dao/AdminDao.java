package com.dao;

import com.base.action.datatables.DataTables;
import com.base.dao.BaseDao;
import com.entity.Admin;

public interface AdminDao extends BaseDao<Admin>{

	/**
	 * 
	 * <p>@Description: 通过账户获取Admin</p>
	 * <p>@param @param name
	 * <p>@param @return</p>   
	 * <p>@return Admin</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-19下午4:27:29</p>
	 */
	public Admin getAdminByName(String name);

	/**
	 * 
	 * <p>@Description: 管理员列表</p>
	 * <p>@param @param dt
	 * <p>@param @return</p>   
	 * <p>@return List<Admin></p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20上午10:04:38</p>
	 */
	public void getAdminList(DataTables dt,String adminAccount);

}
