package com.modang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.ManagerDao;

@Service
public class ManagerService {
	
	@Autowired
	private ManagerDao managerDao;

}
