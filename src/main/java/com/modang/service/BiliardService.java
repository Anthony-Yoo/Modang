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

@Service
public class BiliardService {
	
	@Autowired
	private BiliardDao biliardDao;
	
	@Autowired
	private TabletDao tableDao;
	
	/* 테이블현황 페이지-------------------------------------------------------------------------------- */
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
				
		TableGamesVo gamesVo = biliardDao.selectTable(cuetableVo);
		TariffVo tariffVo = biliardDao.selectPrice(biliardNo);
		CueTableVo oneTable = biliardDao.selectCuetable(tableNo);
		if(gamesVo!=null) {
			gamesVo.setPlayUserList(tableDao.selectPlayUser(gamesVo));
		}
		List<CueTableVo> cueTableList = biliardDao.selectList(biliardNo);
		
		Map<String, Object> tMap = new HashMap<String, Object>();
		
		tMap.put("gamesVo", gamesVo);
		tMap.put("tariffVo", tariffVo);
		tMap.put("oneTable", oneTable);
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
	
	/* 관리자 설정 페이지-------------------------------------------------------------------------------- */
	/* 관리자 설정 - 당구장 정보 불러오기 */
	public void getbiliardInfo(ManagerVo loginManager) {
		System.out.println("BiliardService.getbiliardInfo()");
		
	}

}
