package com.modang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.CardMemberVo;
import com.modang.vo.CardUsersVo;
import com.modang.vo.FavoriteUsersVo;
import com.modang.vo.PlayUserVo;
import com.modang.vo.TableGamesVo;
import com.modang.vo.TabletUserVo;

@Repository
public class TabletDao {
	
	@Autowired
	private SqlSession session;
	
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
	
}
