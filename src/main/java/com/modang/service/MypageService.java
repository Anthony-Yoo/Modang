package com.modang.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.MypageDao;
import com.modang.vo.CurrentRecordVo;
import com.modang.vo.RecordUserVo;

@Service
public class MypageService {
	
	@Autowired
	private MypageDao mypageDao;
	
	public Map<String,Object> userRecord(int userNo) {
		System.out.println("MypageService.userRecord()");
		
		/* 나의 정보가져오기 */
		RecordUserVo myUserVo = mypageDao.selectUserNo(userNo);
		System.out.println(myUserVo);
		
		/* 최근 3게임 유져 + 플레이 정보가져오기 */
		List<RecordUserVo> getPlayList = new ArrayList<>();
		getPlayList = mypageDao.selectPlayListRank3(userNo);
		System.out.println(getPlayList);		
		
		/* 전적최초 row파일 가져오기 */
		List<RecordUserVo> getGameList = new ArrayList<>();
		getGameList = mypageDao.selectGameList(userNo);	
		System.out.println(getGameList);
		
		/* 최근 10게임 지표 초기화 */
		System.out.println("=============다음은 최근10경기==============");
		CurrentRecordVo curRecordVo = new CurrentRecordVo();
		int calGameTime = 0;
		int recentHit = 0;
		int count = 0; // 최근 10게임 승리 카운트
		
		/* 최근 10게임 반복 */
		for(int i=0 ; i<10 ; i++ ) {
			calGameTime += getGameList.get(i).getCalGameTime();		
			recentHit += getGameList.get(i).getActiveAverage();
			if (getGameList.get(i).getRecord() == 1) {
				count++;
			};
		};
		
		recentHit = recentHit/10; // 최근10게임 평균타수
		curRecordVo.setRecentHit(recentHit);
		
		int recentTimeAv = calGameTime/10; // 최근10게임 평균시간
		curRecordVo.setRecentTimeAv(recentTimeAv);
		System.out.println((double)count/10.0);
		double recentWinRate =  Math.round(((double)count/10.0) * 100) / 100.0; // 최근10게임 승률
		System.out.println(recentWinRate);
		System.out.println("=============다음은 토탈==============");
		curRecordVo.setRecentWinRate(recentWinRate);
		
		/* 누적 게임 지표 초기화 */
		
		int totalCountGame = 0;			// 누적 게임수
		int totalCountWinGame = 0;		// 누적 승리게임수	
		int totalCountLoseGame = 0;		// 누적 패배게임수
		double totalWinRate = 0;			// 누적 승률
		int totalGameTime = 0;			// 누적 게임시간			
		
		/* 누적 게임 반복 */
		for(RecordUserVo vo : getGameList) {
			totalGameTime += vo.getCalGameTime(); // 누적 게임시간 완료
			if(vo.getRecord()==1) {
				totalCountWinGame++;  // 누적 승리게임수 완료
			}else if(vo.getRecord()==vo.getMemberNum()) {
				totalCountLoseGame++; // 누적 패배게임수 완료
			}			
		}
		
		/* 권장다마 계산 */
		int totalCountNormGame = 0;			// 누적 본인다마 게임수			
		int totalCountLoseNormGame = 0;		// 누적 본인다마 패배게임수
		double totalNormRate = 0;			// 누적 승률
		
		/*
		 * for(RecordUserVo vo : getGameList) { if(vo.getAverage() = ) totalGameTime +=
		 * vo.getCalGameTime(); // 누적 게임시간 완료 if(vo.getRecord()==1) {
		 * totalCountWinGame++; // 누적 승리게임수 완료 }else
		 * if(vo.getRecord()==vo.getMemberNum()) { totalCountLoseGame++; // 누적 패배게임수 완료
		 * } }
		 */
		
		
		curRecordVo.setTotalGameTime(totalGameTime);
		curRecordVo.setTotalCountWinGame(totalCountWinGame);
		curRecordVo.setTotalCountLoseGame(totalCountLoseGame);
		totalCountGame = getGameList.size();//누적게임수 완료
		curRecordVo.setTotalCountGame(totalCountGame);
		System.out.println(totalCountWinGame);
		System.out.println(totalCountGame);
		totalWinRate = Math.round((  ((double)totalCountWinGame) / ((double)totalCountGame) ) * 100) / 100.0; // 누적승률
		System.out.println(totalWinRate);
		
		curRecordVo.setTotalWinRate(totalWinRate);		
		System.out.println(curRecordVo);
		
		
		
		Map<String,Object> resultList = new HashMap<String,Object>();
		resultList.put("myUserVo",myUserVo);
		resultList.put("curRecordVo", curRecordVo);
		resultList.put("getPlayList", getPlayList);
		resultList.put("getGameList", getGameList);
		
		return resultList;		
	}
	
	public List<RecordUserVo> userPlayList(RecordUserVo myPlayVo) {
		System.out.println("MypageService.userPlayList()");
		
		List<RecordUserVo> myPlayList =	mypageDao.selectPlayListforGameNo(myPlayVo);
		
		
		return myPlayList;
	}

}
