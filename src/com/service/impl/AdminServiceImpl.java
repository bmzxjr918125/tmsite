package com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.base.action.datatables.DataTables;
import com.dao.AdminDao;
import com.entity.Admin;
import com.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	private AdminDao adminDao;
	
	public Admin getAdminByName(String name) {
		
		return adminDao.getAdminByName(name);
	}

	public void save(Admin admin) {
		// TODO Auto-generated method stub
		adminDao.save(admin);
	}

	public void update(Admin admin) {
		// TODO Auto-generated method stub
		adminDao.update(admin);
	}
	
	public void getAdminList(DataTables dtJson,String adminAccount){
		
		adminDao.getAdminList(dtJson,adminAccount);
	}
	
	public Admin getById(int id){
		
		return adminDao.get(id);
	}
	
	public void deleteById(int id){
		
		adminDao.deleteById(id);
	}
	
	
	public AdminDao getAdminDao() {
		return adminDao;
	}

	@Resource(name = "adminDao")
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

}
