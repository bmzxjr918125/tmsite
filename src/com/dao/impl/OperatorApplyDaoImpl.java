package com.dao.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.base.action.datatables.DataTables;
import com.base.dao.BaseDaoImpl;
import com.dao.OperatorApplyDao;
import com.entity.OperatorApply;

@Repository("operatorApplyDao")
public class OperatorApplyDaoImpl extends BaseDaoImpl<OperatorApply> implements OperatorApplyDao{

	public void getApplyList(DataTables dtJson, String phone) {
		
		String hql = "from OperatorApply";
		
		if (!StringUtils.isEmpty(phone)) {
			
			hql = hql + " where phone like'%"+ phone +"%'";
		}
		
		super.findByPage(hql, dtJson);
	}

}
