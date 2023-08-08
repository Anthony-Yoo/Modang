package com.modang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.CueTableVo;
import com.modang.vo.TableGamesVo;
import com.modang.vo.TariffVo;
import com.modang.vo.TotalVo;

@Repository
public class BiliardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 테이블현황 페이지-------------------------------------------------------------------------------- */
	/* 테이블 현황 - 게임 결제 */
	public int updateIncome(TableGamesVo gamesVo) {
		System.out.println("BiliardDao.updatePaymoney()");
		System.out.println(gamesVo);
		int count = sqlSession.update("biliard.updateIncome", gamesVo);
		System.out.println("게임결제성공:"+count);
		return count;
	}
	
	/* 테이블 현황 - 테이블 추가 */
	public int insertTable(CueTableVo cuetableVo) {
		System.out.println("BiliardDao.insertTable()");
		System.out.println(cuetableVo);
		int count = sqlSession.insert("biliard.insertTable",cuetableVo);
		System.out.println("테이블추가:"+count);
		return count;
	}
	
	/* 테이블 현황 - 하나의 테이블기본정보 가져오기(클릭한) */
	public CueTableVo selectCuetable(int tableNo) {
		System.out.println("BiliardDao.selectCuetable()");
		CueTableVo oneTable= sqlSession.selectOne("biliard.selectOnetable", tableNo);
		System.out.println("dao결과:"+ oneTable);
		
		return oneTable;
	}
	
	/* 테이블 현황-테이블 종류 변경 */
    public int updatetableType(CueTableVo cuetableVo) {
    	System.out.println("BiliardDao.updatetableType()");
    	System.out.println(cuetableVo);
    	int count = sqlSession.update("biliard.updatetableType", cuetableVo);
    	System.out.println(count);
    	
    	return count;
    }
	
	/* 테이블 현황 - 게임정보 가져오기 */
	public List<TableGamesVo> selectGames(int biliardNo) {
		System.out.println("BiliardDao.selectGames()");
		List<TableGamesVo> gamesList = sqlSession.selectList("biliard.selectGamesList",biliardNo);
		
		return gamesList;
	}
	
	/* 테이블 현황 - 테이블별 미정산 리스트 가져오기 */
	public List<TableGamesVo> selectIncaluList(CueTableVo cuetableVo) {
		System.out.println("BiliardDao.selectIncaluList()");
		List<TableGamesVo> incaluList = sqlSession.selectList("biliard.selectIncaluList", cuetableVo);
		
		return incaluList;
	}
	
	/* 테이블 현황 - 상세정보 가져오기 */
	public TableGamesVo selectTable(CueTableVo cuetableVo) {
		System.out.println("BiliardDao.selectTable()");
		System.out.println(cuetableVo);
		
		TableGamesVo gamesVo = sqlSession.selectOne("biliard.selectTableInfo", cuetableVo);
		System.out.println(gamesVo);
		return gamesVo;
	}
	
	/*테이블현황 - 테이블 전체리스트 가져오기*/
	public List<CueTableVo> selectList(int biliardNo) {
		System.out.println("BiliardDao.selectList()");
		System.out.println(biliardNo);
		List<CueTableVo> tableVo = sqlSession.selectList("biliard.selectTableList", biliardNo);
		return tableVo;
		
	}
	/* 테이블 매출 페이지-------------------------------------------------------------------------------- */
	/* 테이블네임 가져오기 */
	public List<CueTableVo> selectTotalSales(int biliardNo) {
		System.out.println("BiliardDao.selectTotalSales()");
		List<CueTableVo> cuetableList = sqlSession.selectList("biliard.selectTotalSales",biliardNo);
		System.out.println(cuetableList);
		
		return cuetableList;
	}
	
	/** 테이블별 전체리스트및 검색 */
	public List<TableGamesVo> selectOneTableSales(TableGamesVo tableGamesVo) {
		System.out.println("BiliardDao.selectOneTableSales()");
		System.out.println("테이블전체검색:"+tableGamesVo);
		List<TableGamesVo> salesList = sqlSession.selectList("biliard.selectOneTableSales", tableGamesVo);
		System.out.println("정보:"+salesList);
		return salesList;
	}
	
	/** 테이블별 전체합계 */
	public TotalVo selectTotalTableSales(TableGamesVo tableGamesVo) {
		System.out.println("BiliardDao.selectTotalTableSales()");
		TotalVo totalVo = sqlSession.selectOne("biliard.selectTotalTableSales", tableGamesVo);
		return totalVo;
	}
	
	
	
	/* 일별매출 페이지--------------------------------------------------------------------------------- */
	public List<TotalVo> selectDaySales(TableGamesVo tableGamesVo) {
		System.out.println("BiliardDao.selectDaySales()");
		System.out.println(tableGamesVo);
		List<TotalVo> totalList = sqlSession.selectList("biliard.selectTotalSalesByDay", tableGamesVo);
		return totalList;
	}
	
	
	/* 요금테이블 페이지--------------------------------------------------------------------------------- */
	/* 요금테이블 - 요금정보가져오기 */
	public TariffVo selectPrice(int biliardNo) {
		System.out.println("BiliardDao.selectPrice()");
		System.out.println(biliardNo);
		TariffVo tariffVo = sqlSession.selectOne("biliard.selectPrice", biliardNo);
		System.out.println("요금: "+tariffVo);
		return tariffVo;
	}
	
	/* 요금테이블 - 요금수정 */
	public int updatePrice(TariffVo tariffVo) {
		System.out.println("BiliardDao.updatePrice()");
		System.out.println(tariffVo);
		
		int count = sqlSession.update("biliard.updatePrice", tariffVo);
		System.out.println("성공여부: "+count);
		return count;
	}

}
