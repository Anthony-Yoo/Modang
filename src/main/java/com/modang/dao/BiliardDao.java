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
	
	/* 테이블 현황-테이블 종류 변경 */
    public void updatetableType(CueTableVo cuetableVo) {
    	System.out.println("BiliardDao.updatetableType()");
    	System.out.println(cuetableVo);
    	int count = sqlSession.update("biliard.updatetableType", cuetableVo);
    	System.out.println(count);
    }
	
	/* 게임정보 가져오기 */
	public List<TableGamesVo> selectGames(int biliardNo) {
		System.out.println("BiliardDao.selectGames()");
		List<TableGamesVo> gamesList = sqlSession.selectList("biliard.selectGamesList",biliardNo);
		
		return gamesList;
	}
	
	/* 테이블 현황 - 상세정보 가져오기 */
	public TableGamesVo selectTable(CueTableVo cuetableVo) {
		System.out.println("BiliardDao.selectTable()");
		System.out.println(cuetableVo);
		
		TableGamesVo gamesVo = sqlSession.selectOne("biliard.selectTableInfo", cuetableVo);
		System.out.println(gamesVo);
		return gamesVo;
	}
	
	/*테이블현황-테이블 전체리스트 가져오기*/
	public List<CueTableVo> selectList(int biliardNo) {
		System.out.println("BiliardDao.selectList()");
		System.out.println(biliardNo);
		List<CueTableVo> tableVo = sqlSession.selectList("biliard.selectTableList", biliardNo);
		return tableVo;
		
	}
	
	/* 요금테이블-요금정보가져오기 */
	public TariffVo selectPrice(int biliardNo) {
		System.out.println("BiliardDao.selectPrice()");
		System.out.println(biliardNo);
		TariffVo tariffVo = sqlSession.selectOne("biliard.selectPrice", biliardNo);
		System.out.println("요금: "+tariffVo);
		return tariffVo;
	}
	
	/* 요금테이블-요금수정 */
	public int updatePrice(TariffVo tariffVo) {
		System.out.println("BiliardDao.updatePrice()");
		System.out.println(tariffVo);
		
		int count = sqlSession.update("biliard.updatePrice", tariffVo);
		System.out.println("성공여부: "+count);
		return count;
	}

}
