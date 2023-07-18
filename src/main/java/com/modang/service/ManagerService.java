package com.modang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.ManagerDao;
import com.modang.vo.ManagerVo;

@Service
public class ManagerService {
	
	@Autowired
	private ManagerDao managerDao;
	
	/*회원가입*/
	public void join(ManagerVo managerVO) {
		System.out.println("managerService.join");
		//매니저 정보 삽입
		managerDao.insertManager(managerVO);
		//요금테이블(tariff) 정보 삽입

		//매장이미지 정보 삽입
		
	}
	/*로그인*/
	public ManagerVo login(ManagerVo managerVO) {
		System.out.println("managerService.login");
		ManagerVo loginManager= managerDao.selectManager(managerVO);
		System.out.println(loginManager);
		return loginManager;
	}
	


}
