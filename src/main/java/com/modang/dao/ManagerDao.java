package com.modang.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.TariffVo;

@Repository
public class ManagerDao {
	
	@Autowired
	private SqlSession session;
	
	/* 요금테이블-요금정보가져오기 */
	public TariffVo selectPrice(int no) {
		System.out.println("ManagerDao.selectPrice()");
		System.out.println(no);
		TariffVo tariffVo = session.selectOne("manager.selectPrice", no);
		System.out.println("요금: "+tariffVo);
		return tariffVo;
	}
	
	public int updatePrice(TariffVo tariffVo) {
		System.out.println("ManagerDao.updatePrice()");
		System.out.println(tariffVo);
		
		int count = session.update("manager.updatePrice", tariffVo);
		System.out.println(count);
		return count;
	}

}
