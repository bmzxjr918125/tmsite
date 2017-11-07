package com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.base.action.datatables.DataTables;
import com.dao.OperatorApplyDao;
import com.entity.OperatorApply;
import com.service.OperatorApplyService;

@Service("operatorApplyService")
public class OperatorApplyServiceImpl implements OperatorApplyService{

	private OperatorApplyDao operatorApplyDao;
	
	public void save(OperatorApply apply) {
		// TODO Auto-generated method stub
		operatorApplyDao.save(apply);
	}

	public void deleteById(int id) {
		// TODO Auto-generated method stub
		operatorApplyDao.deleteById(id);
	}

	public void update(OperatorApply apply) {
		// TODO Auto-generated method stub
		operatorApplyDao.update(apply);
	}

	public OperatorApply getById(int id) {
		// TODO Auto-generated method stub
		return operatorApplyDao.get(id);
	}

	public void getApplyList(DataTables dtJson,String phone){
		
		operatorApplyDao.getApplyList(dtJson,phone);
	}
	
	public OperatorApplyDao getOperatorApplyDao() {
		return operatorApplyDao;
	}

	@Resource(name = "operatorApplyDao")
	public void setOperatorApplyDao(OperatorApplyDao operatorApplyDao) {
		this.operatorApplyDao = operatorApplyDao;
	}

}
