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
		System.out.println("TabletDao.selectCueTable()");
		
		return session.selectOne("tablet.selectCueTable", tableNo);			
	}
	
	public List<PlayUserVo> selectPlayUser(TableGamesVo myGameInfo) {
		System.out.println("TabletDao.selectPlayUser()");
		
		return session.selectList("tablet.selectPlayUser",myGameInfo);
	}
	
	public TariffVo selectTariff(int biliardNo) {
		System.out.println("TabletDao.selectTariff()");
		
		return session.selectOne("tablet.selectTariff", biliardNo);
	}
	
	public int updateStartTime(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updateStartTime()");
		
		return session.update("tablet.updateStartTime",tableGameVo);
	}
	
	public int updateIngStatus(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updateIngStatus()");
		
		return session.update("tablet.updateIngStatus",tableGameVo);
	}
	
	public int updatePauseStart(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updatePauseStart()");
		
		return session.update("tablet.updatePauseStart",tableGameVo);
	}
	
	public int updatePauseStatus(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updatePauseStatus()");
		
		return session.update("tablet.updatePauseStatus",tableGameVo);
	}
	
	public int updatePauseStop(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updatePauseStop()");		
		
		return session.update("tablet.updatePauseStop",tableGameVo);
	}	
	
	public int updatePauseTime(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updatePauseTime()");		
		
		return session.update("tablet.updatePauseTime",tableGameVo);
	}
	
	public int updateEndStatus(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updateEndStatus()");
		
		return session.update("tablet.updateEndStatus",tableGameVo);
	}
	
	public int updateEndTime(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updateEndTime()");
		
		return session.update("tablet.updateEndTime",tableGameVo);
	}
	
	public int updateGameTime(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updateGameTime()");		
		
		return session.update("tablet.updateGameTime",tableGameVo);
	}
	
	public int updatePayMoney(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updatePayMoney()");		
		
		return session.update("tablet.updatePayMoney",tableGameVo);
	}
	
	public int updatePlayInfo(PlayUserVo playUserVo) {
		System.out.println("TabletDao.updatePlayInfo()");
		
		return session.update("tablet.updatePlayInfo", playUserVo);
	}
	
	public int updatePlayTime(PlayUserVo playUserVo) {
		System.out.println("TabletDao.updatePlayTime()");
		
		return session.update("tablet.updatePlayTime", playUserVo);				
	}
	
	public PlayUserVo selectPlayforPlayNo(int playNo) {
		System.out.println("TabletDao.selectPlayforPlayNo()");
		
		System.out.println(playNo);
		
		return session.selectOne("tablet.selectPlayforPlayNo", playNo);
	}
	
	public int updateQuitTime(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updateQuitTime()");
		
		return session.update("tablet.updateQuitTime",tableGameVo);
	}
	
	public int updateQuitGameTime(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updateQuitGameTime()");		
		
		return session.update("tablet.updateQuitGameTime",tableGameVo);
	}
	
	public int updateQuickPlayInfo(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.updateQuickPlayInfo()");
		
		return session.update("tablet.updateQuickPlayInfo", tableGameVo);
	}
	
	public TableGamesVo selectGameforGameNo(TableGamesVo tableGameVo) {
		System.out.println("TabletDao.selectGameforGameNo()");
		
		return session.selectOne("tablet.selectGameforGameNo", tableGameVo);
	}
	public List<PlayUserVo> selectPlayRecord(TableGamesVo myGameInfo) {
		System.out.println("TabletDao.selectPlayRecord()");
		
		return session.selectList("tablet.selectPlayRecord",myGameInfo);
	}
	public TableGamesVo selectPauseGameforTableNo(int tableNo) {
		System.out.println("TabletDao.selectPauseGameforTableNo()");
		
		return session.selectOne("tablet.selectPauseGameforTableNo", tableNo);
	}
	
	
}
