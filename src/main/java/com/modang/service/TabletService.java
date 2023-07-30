package com.modang.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.TabletDao;
import com.modang.vo.CardMemberVo;
import com.modang.vo.CardUsersVo;
import com.modang.vo.CueTableVo;
import com.modang.vo.FavoriteUsersVo;
import com.modang.vo.ManagerVo;
import com.modang.vo.PlayUserVo;
import com.modang.vo.StaticVo;
import com.modang.vo.TableGamesVo;
import com.modang.vo.TabletUserVo;
import com.modang.vo.TariffVo;

@Service
public class TabletService {
	
	@Autowired
	private TabletDao tabletDao;
	
	public ManagerVo managerLogin(ManagerVo managerVo) {
		System.out.println("TabletService.managerLogin()");
		
		return tabletDao.selectManager(managerVo);
	}
	
	public List<CueTableVo> managerFindTable(ManagerVo managerVo) {
		System.out.println("TabletService.managerFindTable()");
		
		
			
		return tabletDao.selectTableForManager(managerVo);
	}
	
	public TabletUserVo loginGetKey(TabletUserVo userVo) {
		System.out.println("TabletService.loginGetKey()");
		
		//유져 로그인 & Key확인
		TabletUserVo logOnVo = tabletDao.selectUser(userVo);		
		
		//로그인 완료
		if (logOnVo != null) {
			System.out.println("로그인성공!"+logOnVo);
			
			// 30분 넘는 번호 삭제
			tabletDao.deleteTime(StaticVo.NORMAL_TIME);

			// 유효한 키 있는지 검사(있다/없다분개)
			if(logOnVo.getKeyNum() <= 0 ) {
				System.out.println("키없다");
				//키없다.
				//난수 생성
				int keyNum = (int)(Math.random() * 89) + 10;
				System.out.println(keyNum);
				
				//생성난수 검색(있다/없다 분개)
				TabletUserVo searchKeyVo = tabletDao.selectKeyNum(keyNum);
				
				//해당 난수없다
				if (searchKeyVo == null ) { //난수 사용자 없음
					//키테이블 입력
					logOnVo.setKeyNum(keyNum);
					System.out.println(logOnVo);
					tabletDao.insertKeyNum(logOnVo);				
					System.out.println(logOnVo);
				}else {//해당 난수 사용자 있음
					
					while(true) {
						//난수 중복체크 후 없는 난수 생성
						keyNum = (int)(Math.random() * 89) + 10;	
						//검사
						searchKeyVo = tabletDao.selectKeyNum(keyNum);
						if(searchKeyVo == null) { //발급받은 난수 사용자가 없으면
							break;
						}
					}
					logOnVo.setKeyNum(keyNum);
					tabletDao.insertKeyNum(logOnVo);				
					System.out.println(logOnVo);				
				}				
			}else {//로그인하고 키를 가지고 있으면..
				System.out.println("키있다--  30분에 이내 데이터는 1개만 있어야 한다");
			}
			
		}else {//로그인 실패
			System.out.println("로그인 실패--");		
		}		
		return logOnVo;
	}		
	
	public TabletUserVo keyLogin(int keyNum) {
		System.out.println("TabletService.keyLogin()");
		
		tabletDao.deleteTime(StaticVo.NORMAL_TIME);		
		
		return tabletDao.selectKeyNum(keyNum); 
	}
	
	public List<TabletUserVo> userFind(String id) {
		System.out.println("TabletService.userFind()");	
		
		return tabletDao.selectId(id);
	}
	
	public List<CardUsersVo> myMember(int userNo) {
		System.out.println("TabletService.myMember()");
		 
		List<CardUsersVo> cardList = tabletDao.selectCardUsers(userNo);
		System.out.println(cardList);
		List<CardMemberVo> memberList = new ArrayList<CardMemberVo>();
		List<FavoriteUsersVo> favoriteList = new ArrayList<FavoriteUsersVo>();
		for(int i=0;i<cardList.size();i++) {
			int cardNo = cardList.get(i).getCardNo();
			memberList = tabletDao.selectCardMember(cardNo);
			favoriteList = tabletDao.selectFavorite(userNo);
			cardList.get(i).setMemberList(memberList);
			cardList.get(i).setFavoriteList(favoriteList);
		}	
		
		return cardList;		
	}
	
	public int createGame(TableGamesVo tableGame) {
		System.out.println("TabletService.createGame()");
		
		
		//게임넘버 인서트 및 찾기
		tabletDao.insertGame(tableGame);
		tableGame.setSetNo(tableGame.getGameNo()); 
		System.out.println(tableGame);
		//플레이넘버 인서트 및 찾기		
		int gameNo = tableGame.getGameNo();
		List<PlayUserVo> playUserList = new ArrayList<PlayUserVo>();
		playUserList = tableGame.getPlayUserList();
		for (PlayUserVo vo : playUserList) {
			vo.setGameNo(gameNo);
			tabletDao.insertPlay(vo);
		}
		System.out.println(playUserList);
		tableGame.setPlayUserList(playUserList);		
		System.out.println(tableGame);		
		
		return gameNo;
	}
		
	public TableGamesVo playFind(int tableNo) {
		System.out.println("TabletService.playFind()");		
		
		//게임정보 찾기
		TableGamesVo myGameInfo = tabletDao.selectGameforTableNo(tableNo);
		System.out.println(myGameInfo);
		//당구장번호찾기 & 테이블 종류찾기
		CueTableVo tableInfo = tabletDao.selectCueTable(tableNo);
		System.out.println(tableInfo);
		//요금표 찾기
		TariffVo tariffInfo = tabletDao.selectTariff(tableInfo);
		System.out.println(tariffInfo);
		//테이블에 맞는 요금찾기
		int tableFee = 0;
		int minFee = 0;
		int tableType = tableInfo.getTableType();
		switch(tableType) {
			case 0 :  	tableFee = tariffInfo.getBtablefee();
						minFee = tariffInfo.getBminfee();
						break;
			case 1 :	tableFee = tariffInfo.getMtablefee();
						minFee = tariffInfo.getMminfee();
						break;
			case 2 :	tableFee = tariffInfo.getPtablefee();
						minFee = tariffInfo.getPminfee();
						break;
			default : 	tableFee = 0;
						minFee = 0;
						break;
		}
		// 요금을 플레이유져에 넣기			
		myGameInfo.setTableFee(tableFee);
		myGameInfo.setMinFee(minFee);
		//게임VO에 Play리스트 넣기		
		myGameInfo.setPlayUserList(tabletDao.selectPlayUser(myGameInfo));
		//게임Vo에 table 넣기
		myGameInfo.setTableInfo(tableInfo);
		
		return myGameInfo;
	}
	
	public TableGamesVo startGame(TableGamesVo tableGameVo) {
		System.out.println("TabletService.startGame()");	
		
		tabletDao.updateStartTime(tableGameVo);
		tabletDao.updateIngStatus(tableGameVo);
		
		int tableNo = tableGameVo.getTableNo();
		System.out.println(tableNo);
		
		TableGamesVo myGameInfo = tabletDao.selectGameforTableNo(tableNo);
		
		
		return myGameInfo;
	}
	
	public TableGamesVo pauseGame(TableGamesVo tableGameVo) {
		System.out.println("TabletService.pauseGame()");
		
		tabletDao.updatePauseStart(tableGameVo);
		tabletDao.updatePauseStatus(tableGameVo);
		
		int tableNo = tableGameVo.getTableNo();
		System.out.println(tableNo);
		
		TableGamesVo myGameInfo = tabletDao.selectGameforTableNo(tableNo);		
		
		return myGameInfo;
	}
	
	public TableGamesVo playStatus(TableGamesVo tableGameVo) {
		System.out.println("TabletService.playStatus()");
				
		int tableNo = tableGameVo.getTableNo();
		System.out.println(tableNo);
		
		TableGamesVo myGameInfo = tabletDao.selectGameforTableNo(tableNo);		
		
		return myGameInfo;
	}
	
	public TableGamesVo reStartGame(TableGamesVo tableGameVo) {
		System.out.println("TabletService.reStartGame()");
		
		tabletDao.updatePauseStop(tableGameVo);
		tabletDao.updatePauseTime(tableGameVo);
		tabletDao.updateIngStatus(tableGameVo);
		
		int tableNo = tableGameVo.getTableNo();
		System.out.println(tableNo);
		
		TableGamesVo myGameInfo = tabletDao.selectGameforTableNo(tableNo);
		System.out.println(myGameInfo);
		
		return myGameInfo;
	}
	
	public TableGamesVo endGame(TableGamesVo tableGameVo) {
		System.out.println("TabletService.endGame()");
		
		tabletDao.updateEndStatus(tableGameVo);
		tabletDao.updateEndTime(tableGameVo);
		tabletDao.updateGameTime(tableGameVo);
		
		int tableNo =tableGameVo.getTableNo();
		System.out.println(tableNo);
		
		///////////////////////////////////////////////////////////////////////////////
		//*요금표찾기*/////////////
		////////////////////////////////////////////////////////////////////////////
		
		//게임정보 찾기
			tableGameVo = tabletDao.selectGameforTableNo(tableNo);
			System.out.println(tableGameVo);
		//당구장번호찾기 & 테이블 종류찾기
			CueTableVo tableInfo = tabletDao.selectCueTable(tableNo);
			System.out.println(tableInfo);
		//요금표 찾기
			TariffVo tariffInfo = tabletDao.selectTariff(tableInfo);
			System.out.println(tariffInfo);
		//테이블에 맞는 요금찾기
			int tableFee = 0;
			int minFee = 0;
			int tableType = tableInfo.getTableType();
			switch(tableType) {
				case 0 :  	tableFee = tariffInfo.getBtablefee();
							minFee = tariffInfo.getBminfee();
							break;
				case 1 :	tableFee = tariffInfo.getMtablefee();
							minFee = tariffInfo.getMminfee();
							break;
				case 2 :	tableFee = tariffInfo.getPtablefee();
							minFee = tariffInfo.getPminfee();
							break;
				default : 	tableFee = 0;
							minFee = 0;
							break;
			}
			// 요금을 플레이유져에 넣기			
			tableGameVo.setTableFee(tableFee);
			tableGameVo.setMinFee(minFee);			
		////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////
		
		int gameSeconds = tableGameVo.getGameTime();
		int gameMin = (int)Math.round(gameSeconds/60);
		int ceilMin = (int)(Math.ceil(gameMin/10)*10);
		int useFee = 0;
		if (ceilMin <= 30) {
			useFee = tableFee;// 기본요금
		}else {
			useFee = tableFee + ((ceilMin-30)/10) * minFee;//기본요금 +((올림한경기시간-30)/10) * 10분당 요금
		}
		System.out.println(useFee);
		tableGameVo.setPayMoney(useFee);		
		tabletDao.updatePayMoney(tableGameVo);	
		
		TableGamesVo myGameInfo = tabletDao.selectGameforTableNo(tableNo);
		System.out.println(myGameInfo);
		
		return myGameInfo;
	}
	
	public PlayUserVo updatePlayInfo(PlayUserVo playUserVo) {
		System.out.println("TabletService.updatePlayInfo()");
		
		int playNo = playUserVo.getPlayNo();
		
		tabletDao.updatePlayInfo(playUserVo);
		tabletDao.updatePlayTime(playUserVo);	
		
		PlayUserVo myPlayInfo = tabletDao.selectPlayforPlayNo(playNo);
		
		return myPlayInfo;
	}
}
