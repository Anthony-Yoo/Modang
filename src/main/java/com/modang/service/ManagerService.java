package com.modang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.ManagerDao;
import com.modang.vo.CueTableVo;
import com.modang.vo.TariffVo;

@Service
public class ManagerService {
	
	@Autowired
	private ManagerDao managerDao;	
	
	
	/*테이블현황-테이블 전체리스트 가져오기*/
	public List<CueTableVo> tableList(int no) {
		System.out.println("ManagerService.tableList()");
		
		List<CueTableVo> cueTableList = managerDao.selectList(no);
		
		System.out.println(cueTableList);
		
		return cueTableList;
	}
	
	/* 요금테이블-요금정보 가져오기 */
	public TariffVo getPrice(int no) {
		System.out.println("ManagerService.getPrice()");
		
		TariffVo tariffVo = managerDao.selectPrice(no);
		return tariffVo;
	}
	
	/* 요금테이블-요금수정 */
	public int updatePrice(TariffVo tariffVo) {
		System.out.println("ManagerService.updatePrice()");
		
		int count = managerDao.updatePrice(tariffVo);
		return count;
	}

}
