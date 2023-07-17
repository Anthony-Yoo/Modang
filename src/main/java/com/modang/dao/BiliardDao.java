package com.modang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.modang.vo.ManagerVo;

import com.modang.vo.CueTableVo;
import com.modang.vo.TableGamesVo;

import com.modang.vo.TariffVo;

@Repository
public class BiliardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*테이블현황-테이블 전체리스트 가져오기*/
	public List<CueTableVo> selectList(int no) {
		System.out.println("BiliardDao.selectList()");
		System.out.println(no);
		List<CueTableVo> tableVo = sqlSession.selectList("biliard.selectTableList", no);
		return tableVo;
		
	}
	
	/* 요금테이블-요금정보가져오기 */
	public TariffVo selectPrice(int no) {
		System.out.println("BiliardDao.selectPrice()");
		System.out.println(no);
		TariffVo tariffVo = sqlSession.selectOne("biliard.selectPrice", no);
		System.out.println("요금: "+tariffVo);
		return tariffVo;
	}
	
	/* 요금테이블-요금수정 */
	public int updatePrice(TariffVo tariffVo) {
		System.out.println("BiliardDao.updatePrice()");
		System.out.println(tariffVo);
		
		int count = sqlSession.update("biliard.updatePrice", tariffVo);
		System.out.println(count);
		return count;
	}

}
