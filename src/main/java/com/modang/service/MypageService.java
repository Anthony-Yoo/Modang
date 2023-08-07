package com.modang.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.MypageDao;
import com.modang.vo.CurrentRecordVo;
import com.modang.vo.FavoriteUsersVo;
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
		int size = getGameList.size();
		
		/* 최근 10게임 반복 */	
		if ( size > 10) {
			size = 10;					
		};
		for(int i=0 ; i< size ; i++ ) {
		
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
		//본인다마 경기 지표 계산
		int totalCountNormGame = 0;			// 누적 본인다마 게임수	
		int totalCountWinNormGame = 0;			// 누적 본인다마 승리게임수	
		int totalCountLoseNormGame = 0;		// 누적 본인다마 패배게임수		
		double totalNormRate = 0;			// 누적 본인다마 안물린승률
						
		
		/* 누적 게임 반복 */
		//본인다마로 경기
		for(RecordUserVo vo : getGameList) {
			
			if(vo.getCurrentAverage()==vo.getAverage()) {			
				totalCountNormGame++; // 누적 본인다마 게임수 완료
				
				if(vo.getRecord()==1) {
					totalCountWinNormGame++;  // 누적 승리게임수 완료
					
				}else if(vo.getRecord()==vo.getMemberNum()) {
					totalCountLoseNormGame++; // 누적 패배게임수 완료
				}
			}
		}
		System.out.println("누적 본인다마 게임수 :" + totalCountNormGame);
		System.out.println("누적 승리게임수 :" + totalCountWinNormGame);
		System.out.println("누적 패배게임수 :" + totalCountLoseNormGame);
		
		int totalCountCommonNormGame = totalCountNormGame - totalCountLoseNormGame; // 누적 본인다마 안물린 게임수
		totalNormRate = Math.round(( ((double)totalCountCommonNormGame) / ((double)totalCountNormGame) ) * 100) / 100.0;
		System.out.println("누적 본인다마 안물린승률 :" + totalNormRate); 
		int totalNormRatePercent =  (int)(totalNormRate * 100);	// 누적 본인다마 안물린승률 100분위
		int recommStatus = 0; //권장다마 상태
		
		
		System.out.println("누적 본인다마 안물린승률 100분위 :" + totalNormRatePercent);		
		if(totalCountNormGame >=10) {//본인다마로 10게임 이상일때
			
			if(totalNormRate>0.8) {//안물린승률이 0.8이상일때
				recommStatus = 2;
				
			}else if(totalNormRate<0.2) {//안물린승률이 0.2이하일때
				recommStatus = 0;

			}else {
				recommStatus = 1;

			}			
		}else {
			recommStatus =3;
		}
		
		/* 누적게임 기록 */
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
		
		/* 본인다마 누적게임 기록 */
		//권장다마 데이터 전달
		curRecordVo.setRecommStatus(recommStatus);
		curRecordVo.setTotalNormRatePercent(totalNormRatePercent);	
		
		
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
		int recommStatus = 0; // 권장다마상태
		for (RecordUserVo vo :  myPlayList) {
			if(vo.getTotalCountGame() >=10) {//본인다마로 10게임 이상일때
				
				if(vo.getTotalCommRate()>0.8) {//안물린승률이 0.8이상일때
					recommStatus = 2;
					vo.setRecommStatus(recommStatus);
					
				}else if(vo.getTotalCommRate()<0.2) {//안물린승률이 0.2이하일때
					recommStatus = 0;
					vo.setRecommStatus(recommStatus);
				}else {
					recommStatus = 1;
					vo.setRecommStatus(recommStatus);
				}			
			}else {
				recommStatus =3;
				vo.setRecommStatus(recommStatus);
			}		
			
		}
		
		return myPlayList;
	}

	public List<RecordUserVo> friendList(int userNo) {
		System.out.println("MypageService.friendList()");
		
		//친구리스트 userNo 확보
		List<RecordUserVo> friendList = mypageDao.selectFriendList(userNo);
		
		for(RecordUserVo vo : friendList) {
			int getUserNo = vo.getUserNo(); //플레이리스트 유져넘버
			int recommStatus = 0; // 권장다마상태
			
			//최근 10경기 승 패 확인
			RecordUserVo friendRecord = mypageDao.selectRecordWinLose(getUserNo);
			vo.setWinCnt(friendRecord.getWinCnt());//최근 10경기 승리경기수 vo에 넣기
			vo.setLoseCnt(friendRecord.getLoseCnt());//최근 10경기 패배 경기수 vo에 넣기	
			if(vo.getTotalCountGame() >=10) {//본인다마로 10게임 이상일때
				
				if(vo.getTotalCommRate()>0.8) {//안물린승률이 0.8이상일때
					recommStatus = 2;
					vo.setRecommStatus(recommStatus);
					
				}else if(vo.getTotalCommRate()<0.2) { //안물린승률이 0.2이하일때
					recommStatus = 0;
					vo.setRecommStatus(recommStatus);
				}else {
					recommStatus = 1;
					vo.setRecommStatus(recommStatus);
				}			
			}else {
				recommStatus =3;
				vo.setRecommStatus(recommStatus);
			}		
		}			
		return friendList;
	}
	
	public RecordUserVo friendInsert(FavoriteUsersVo favoriteVo) {
		System.out.println("MypageService.friendInsert()");
		
		int recommStatus = 0; // 권장다마상태
		mypageDao.insertFriend(favoriteVo);		
		
		int favoriteNo = favoriteVo.getFavoriteNo();
		System.out.println("즐겨찾기 정보 :" + favoriteVo);
			
		RecordUserVo friendInfo = mypageDao.selectFriendInfo(favoriteNo); // 즐겨찾기 친구 찾기	
		System.out.println(friendInfo);
		int userNo = friendInfo.getUserNo();
		RecordUserVo friendRecord = mypageDao.selectRecordWinLose(userNo);
		friendInfo.setWinCnt(friendRecord.getWinCnt()); 
		friendInfo.setLoseCnt(friendRecord.getLoseCnt());
		 
		
		if(friendInfo.getTotalCountGame() >=10) {//본인다마로 10게임 이상일때
			
			if(friendInfo.getTotalCommRate()>0.8) {//안물린승률이 0.8이상일때
				recommStatus = 2;
				friendInfo.setRecommStatus(recommStatus);
				
			}else if(friendInfo.getTotalCommRate()<0.2) { //안물린승률이 0.2이하일때
				recommStatus = 0;
				friendInfo.setRecommStatus(recommStatus);
			}else {
				recommStatus = 1;
				friendInfo.setRecommStatus(recommStatus);
			}			
		}else {
			recommStatus =3;
			friendInfo.setRecommStatus(recommStatus);
		}
		
		return friendInfo;
	}
	
	public int friendDelete(int favoriteNo) {
		System.out.println("MypageService.friendDelete()");		
		
		return mypageDao.deleteFriend(favoriteNo);
	}
	
}
