package com.service;

import com.entity.Lutrababy;

public interface LutrababyService {

	public void save(Lutrababy lutrababy);
	
	public void update(Lutrababy lutrababy);
	
	public Lutrababy getById(int id);
}
