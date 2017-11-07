package com.dao.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.base.action.datatables.DataTables;
import com.base.dao.BaseDaoImpl;
import com.dao.AdminDao;
import com.entity.Admin;

@Repository("adminDao")
public class AdminDaoImpl extends BaseDaoImpl<Admin> implements AdminDao{

	public Admin getAdminByName(String name) {
		String hql = " from Admin where username='"+ name +"' and status=1";
		return (Admin) this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql).uniqueResult();
	}
	
	public void getAdminList(DataTables dtJson,String adminAccount){
		
		String hql = "from Admin";
		
		if (!StringUtils.isEmpty(adminAccount)) {
			
			hql = hql + " where username like'%"+ adminAccount +"%'";
		}
		
		super.findByPage(hql.toString(), dtJson);
	}

}
