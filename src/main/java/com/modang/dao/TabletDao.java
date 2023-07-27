package com.modang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.CardMemberVo;
import com.modang.vo.CardUsersVo;
import com.modang.vo.CueTableVo;
import com.modang.vo.FavoriteUsersVo;
import com.modang.vo.ManagerVo;
import com.modang.vo.PlayUserVo;
import com.modang.vo.TableGamesVo;
import com.modang.vo.TabletUserVo;
import com.modang.vo.TariffVo;

@Repository
public class TabletDao {
	
	@Autowired
	private SqlSession session;
	
	public ManagerVo selectManager(ManagerVo managerVo) {
		System.out.println("TabletDao.selectManager()");
		return session.selectOne("tablet.selectManager", managerVo);
	}
	
	public List<CueTableVo> selectTableForManager(ManagerVo managerVo) {
		System.out.println("TabletDao.selectTableForManager()");
		System.out.println(managerVo);
		
		return session.selectList("tablet.selectTableForManager", managerVo);				
	}	
	
	public TabletUserVo selectUser(TabletUserVo userVo) {
		System.out.println("TabletDao.selectUser()");
		
		return session.selectOne("tablet.selectUser", userVo);
	}
	
	/*
	 * public LoginKeyVo selectUserKey(TabletUserVo userVo) {
	 * System.out.println("TabletDao.selectUserKey()");
	 * 
	 * return session.selectOne("tablet.selectUserKey", userVo);
	 * 
	 * }
	 */
	public int insertKeyNum(TabletUserVo userVo) {
		System.out.println("TabletDao.insertKeyNum()");
		
		return session.insert("tablet.insertKeyNum", userVo);
		
	}
	public TabletUserVo selectKeyNum(int keyNum) {
		System.out.println("TabletDao.selectKeyNum()");
		
		return session.selectOne("tablet.selectKeyNum", keyNum);		
	}
	
	public int deleteTime(int normalTime) {
		System.out.println("TabletDao.deleteTime()");
				
		return session.delete("tablet.deleteTime", normalTime);
	}
	
	public List<TabletUserVo> selectId(String id) {
		System.out.println("TabletDao.selectId()");
		System.out.println(id);
		
		return session.selectList("tablet.selectId", id);		
	}
	
	public List<CardUsersVo> selectCardUsers(int userNo) {
		System.out.println("TabletDao.selectCardUsers()");		
		
		return session.selectList("tablet.selectCardUsers", userNo);
	}

	public List<CardMemberVo> selectCardMember(int cardNo) {
		System.out.println("TabletDao.selectCardMember()");
		
		return session.selectList("tablet.selectCardMember", cardNo);	
	}
	
	public List<FavoriteUsersVo> selectFavorite(int userNo) {
		System.out.println("TabletDao.selectFavorite()");
		
		return session.selectList("tablet.selectFavorite", userNo);
	}
	
	public int insertGame(TableGamesVo tableGame) {
		System.out.println("TabletDao.insertGame()");
		
		return session.insert("tablet.insertGame", tableGame);		
	}
	
	public int insertPlay(PlayUserVo playUser) {
		System.out.println("TabletDao.insertPlay()");
		
		return session.insert("tablet.insertPlay", playUser);
	}
	
	public TableGamesVo selectGameforTableNo(int tableNo) {
		System.out.println("TabletDao.selectGameforTableNo()");
		
		return session.selectOne("tablet.selectGameforTableNo", tableNo);
	}
	
	
	public CueTableVo selectCueTable(int tableNo) {
		System.out.println("TabletDao.selectbiliard()");
		
		return session.selectOne("tablet.selectCueTable", tableNo);			
	}
	
	public List<PlayUserVo> selectPlayUser(TableGamesVo myGameInfo) {
		System.out.println("TabletDao.selectPlayUser()");
		
		return session.selectList("tablet.selectPlayUser",myGameInfo);
	}
	
	public TariffVo selectTariff(CueTableVo tableInfo) {
		System.out.println("TabletDao.selectTariff()");
		
		return session.selectOne("tablet.selectTariff", tableInfo);
	}
	
	public void updateTbStatus() {
		System.out.println("TabletDao.updateTbStatus");
		
		session.update("tablet.updateTbStatus");
	}
	
	
	
}
