package com.modang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.BiliardDao;
import com.modang.dao.ManagerDao;
import com.modang.dao.TabletDao;
import com.modang.vo.ManagerVo;
import com.modang.vo.TableGamesVo;
import com.modang.vo.CueTableVo;

import com.modang.vo.TariffVo;
import com.modang.vo.TotalVo;

@Service
public class BiliardService {
	
	@Autowired
	private BiliardDao biliardDao;
	
	@Autowired
	private TabletDao tableDao;
	
	/* 테이블현황 페이지-------------------------------------------------------------------------------- */
	/* 테이블 현황 - 게임 결제 */
	public int payMent(TableGamesVo gamesVo) {
		System.out.println("BiliardService.payMent()");
		int count = biliardDao.updateIncome(gamesVo);
		return count;
	}
	
	/* 테이블 현황 - 테이블 추가 */
	public int addTable(CueTableVo cuetableVo) {
		System.out.println("BiliardService.addTable()");
		
		int count = biliardDao.insertTable(cuetableVo);
		return count;
	}
	
	/* 테이블 현황 - 테이블 종류 변경 */
	public int tableTypeModify(CueTableVo cuetableVo) {
		System.out.println("BiliardService.tableTypeModify()");
		
		int count = biliardDao.updatetableType(cuetableVo);
		return count;
	}
	
	/* 테이블 현황 - 게임정보 가져오기(미정산리스트만) */
	public void getIncaluList() {
		System.out.println("BiliardService.getIncaluList()");
		
	}
	
	/* 테이블 현황 - 게임정보 가져오기 */
	public List<TableGamesVo> getGames(int biliardNo) {
		System.out.println("BiliardService.getGames()");
		List<TableGamesVo> gamesList = biliardDao.selectGames(biliardNo);
		System.out.println(gamesList);
		
		return gamesList;
	}
	
	/* 테이블 현황 - 상세정보 가져오기 */
	public Map<String, Object> tableInfo(CueTableVo cuetableVo) {
		System.out.println("BiliardService.tableInfo()");
		int biliardNo = cuetableVo.getBiliardNo();
		int tableNo = cuetableVo.getTableNo();
				
		TableGamesVo gamesVo = biliardDao.selectTable(cuetableVo); //큐테이블정보로 게임정보 가져오기
		TariffVo tariffVo = biliardDao.selectPrice(biliardNo);     //요금정보 가져오기
		CueTableVo oneTable = biliardDao.selectCuetable(tableNo);  //테이블 기본정보
		List<TableGamesVo> incaluList = biliardDao.selectIncaluList(cuetableVo);     //테이블 미정산 리스트 가져오기            
		
		if(gamesVo!=null) { //게임정보가 있을때 게임유저정보를 가져오기
		gamesVo.setPlayUserList(tableDao.selectPlayUser(gamesVo)); //게임유저정보
		 
		}
	//	List<CueTableVo> cueTableList = biliardDao.selectList(biliardNo);
		
		Map<String, Object> tMap = new HashMap<String, Object>();
		
		tMap.put("gamesVo", gamesVo);
		tMap.put("tariffVo", tariffVo);
		tMap.put("oneTable", oneTable);
		tMap.put("incaluList", incaluList);
		System.out.println(tMap);
		
		return tMap;
	}
	
	/*테이블 현황 - 테이블 전체리스트 가져오기*/
	public List<CueTableVo> tableList(int biliardNo) {
		System.out.println("BiliardService.tableList()");
		
		List<CueTableVo> cueTableList = biliardDao.selectList(biliardNo);
		System.out.println(cueTableList);
		
		return cueTableList;
	}
	
	/* 테이블 매출 페이지-------------------------------------------------------------------------------- */
	/* 테이블네임 가져오기 */
	public List<CueTableVo> tablesalesList(int biliardNo) {
		System.out.println("BiliardService.tablesalesList()");
		List<CueTableVo> cuetableList = biliardDao.selectList(biliardNo);
		
		return cuetableList;
	}
	
	/* 테이블 매출 검색 */
	public Map<String, Object> searchTable(TableGamesVo tableGamesVo) {
		System.out.println("BiliardService.searchTable()");
		
		List<TableGamesVo> salesList = biliardDao.selectOneTableSales(tableGamesVo);
		
		TotalVo totalVo = biliardDao.selectTotalTableSales(tableGamesVo);
		
		Map<String, Object> tableSaleMap = new HashMap<String, Object>();
		tableSaleMap.put("salesList", salesList);
		tableSaleMap.put("totalVo", totalVo);
		
		return tableSaleMap;
	}
	/* 일별 매출 페이지-------------------------------------------------------------------------------- */
	
	public List<TotalVo> daySales(TableGamesVo tableGamesVo) {
		System.out.println("BiliardService.daySales()");
		
		List<TotalVo> totalList = biliardDao.selectDaySales(tableGamesVo);
		/* biliardDao.selectTotalSalesByDay(tableGamesVo); */
		return totalList;
	}
	
	
	
	
	
	/* 요금테이블 페이지--------------------------------------------------------------------------------- */
	/* 요금테이블 - 요금정보 가져오기 */
	public TariffVo getPrice(int biliardNo) {
		System.out.println("BiliardService.getPrice()");
		
		TariffVo tariffVo = biliardDao.selectPrice(biliardNo);
		return tariffVo;
	}
	
	/* 요금테이블 - 요금수정 */
	public int updatePrice(TariffVo tariffVo) {
		System.out.println("BiliardService.updatePrice()");
		
		int count = biliardDao.updatePrice(tariffVo);
		return count;
	}
	


}
