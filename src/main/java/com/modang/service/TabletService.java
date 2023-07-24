package com.modang.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.TabletDao;
import com.modang.vo.CardMemberVo;
import com.modang.vo.CardUsersVo;
import com.modang.vo.FavoriteUsersVo;
import com.modang.vo.PlayUserVo;
import com.modang.vo.StaticVo;
import com.modang.vo.TableGamesVo;
import com.modang.vo.TabletUserVo;

@Service
public class TabletService {
	
	@Autowired
	private TabletDao tabletDao;
	
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
	
}
