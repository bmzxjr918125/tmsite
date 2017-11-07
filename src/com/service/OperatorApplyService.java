package com.service;

import com.base.action.datatables.DataTables;
import com.entity.OperatorApply;

public interface OperatorApplyService {

	public void save(OperatorApply apply);
	
	public void deleteById(int id);
	
	public void update(OperatorApply apply);
	
	public OperatorApply getById(int id);
	
	public void getApplyList(DataTables dtJson,String phone);
}
