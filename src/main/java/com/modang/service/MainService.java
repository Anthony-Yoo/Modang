package com.modang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.MainDao;

@Service
public class MainService {
	
	@Autowired
	private MainDao mainDao;
	
	public void insert(int no) {
		System.out.println("MainService.insert()");
		
		mainDao.insert(no);
		
	}

}
