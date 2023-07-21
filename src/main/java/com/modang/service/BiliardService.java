package com.modang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.BiliardDao;
import com.modang.dao.ManagerDao;

import com.modang.vo.ManagerVo;
import com.modang.vo.TableGamesVo;
import com.modang.vo.CueTableVo;

import com.modang.vo.TariffVo;

@Service
public class BiliardService {
	
	@Autowired
	private BiliardDao biliardDao;
	
	/* 게임정보 가져오기 */
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
				
		TableGamesVo gamesVo = biliardDao.selectTable(cuetableVo);
		TariffVo tariffVo = biliardDao.selectPrice(biliardNo);
		
		Map<String, Object> tMap = new HashMap<String, Object>();
		tMap.put("gamesVo", gamesVo);
		tMap.put("tariffVo", tariffVo);
		System.out.println(tMap);
		
		return tMap;
	}
	
	/*테이블현황-테이블 전체리스트 가져오기*/
	public List<CueTableVo> tableList(int biliardNo) {
		System.out.println("BiliardService.tableList()");
		
		List<CueTableVo> cueTableList = biliardDao.selectList(biliardNo);
		
		System.out.println(cueTableList);
		
		return cueTableList;
	}
	
	/* 요금테이블-요금정보 가져오기 */
	public TariffVo getPrice(int biliardNo) {
		System.out.println("BiliardService.getPrice()");
		
		TariffVo tariffVo = biliardDao.selectPrice(biliardNo);
		return tariffVo;
	}
	
	/* 요금테이블-요금수정 */
	public int updatePrice(TariffVo tariffVo) {
		System.out.println("BiliardService.updatePrice()");
		
		int count = biliardDao.updatePrice(tariffVo);
		return count;
	}

}
