package com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.LutrababyDao;
import com.entity.Lutrababy;
import com.service.LutrababyService;

@Service("lutrababyService")
public class LutrababyServiceImpl implements LutrababyService{

	private LutrababyDao lutrababyDao;
	
	public void save(Lutrababy lutrababy) {
		// TODO Auto-generated method stub
		lutrababyDao.save(lutrababy);
	}

	public void update(Lutrababy lutrababy) {
		// TODO Auto-generated method stub
		lutrababyDao.update(lutrababy);
	}

	public Lutrababy getById(int id) {
		// TODO Auto-generated method stub
		return lutrababyDao.get(id);
	}

	public LutrababyDao getLutrababyDao() {
		return lutrababyDao;
	}

	@Resource(name = "lutrababyDao")
	public void setLutrababyDao(LutrababyDao lutrababyDao) {
		this.lutrababyDao = lutrababyDao;
	}

}
