package com.modang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.ManagerDao;
import com.modang.vo.ManagerVo;
import com.modang.vo.TariffVo;

@Service
public class ManagerService {
	
	@Autowired
	private ManagerDao managerDao;
	
	/*회원가입*/
	public void join(ManagerVo managerVO) {
		System.out.println("managerService.join");
		managerDao.insertManager(managerVO);
	}
	/*로그인*/
	public void login(ManagerVo managerVO) {
		System.out.println("managerService.login");
		managerDao.selectManager(managerVO);
	}
	
	/* 요금테이블-요금정보 가져오기 */
	public TariffVo getPrice(int no) {
		System.out.println("ManagerService.getPrice()");
		
		TariffVo tariffVo = managerDao.selectPrice(no);
		return tariffVo;
	}
	
	public int updatePrice(TariffVo tariffVo) {
		System.out.println("ManagerService.updatePrice()");
		
		int count = managerDao.updatePrice(tariffVo);
		return count;
	}

}
