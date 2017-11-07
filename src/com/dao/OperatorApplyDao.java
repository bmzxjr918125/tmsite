package com.dao;

import com.base.action.datatables.DataTables;
import com.base.dao.BaseDao;
import com.entity.OperatorApply;

public interface OperatorApplyDao extends BaseDao<OperatorApply>{

	public void getApplyList(DataTables dtJson, String phone);

	
}
