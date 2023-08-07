package com.modang.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.CardMemberVo;
import com.modang.vo.CardUsersVo;
import com.modang.vo.FavoriteUsersVo;
import com.modang.vo.RecordUserVo;

@Repository
public class MypageDao {
	
	@Autowired
	private SqlSession session; 
	
	public RecordUserVo selectUserNo(int userNo) {
		System.out.println("MypageDao.selectUserNo()");
		
		return session.selectOne("mypage.selectUserNo", userNo);
	}
	
	public List<RecordUserVo> selectPlayListRank3(int userNo) {
		System.out.println("MypageDao.selectPlayListRank3()");
		
		return session.selectList("mypage.selectPlayListRank3",userNo);
	}
	
	public List<RecordUserVo> selectGameList(int userNo) {
		System.out.println("MypageDao.selectGameList()");
		
		return session.selectList("mypage.selectGameList", userNo);		
	}
	
	public List<RecordUserVo> selectPlayListforGameNo(RecordUserVo myPlayVo) {
		System.out.println("MypageDao.selectPlayListforGameNo()");
		
		return session.selectList("mypage.selectPlayListforGameNo", myPlayVo);
	}
	
	public RecordUserVo selectRecordWinLose(int userNo) {
		System.out.println("MypageDao.selectRecordWinLose()");
		
		return session.selectOne("mypage.selectRecordWinLose", userNo);
	}
	
	public List<RecordUserVo> selectFriendList(int userNo) {
		System.out.println("MypageDao.selectFriendList()");
		
		return session.selectList("mypage.selectFriendList", userNo);
	}
	public int insertFriend(FavoriteUsersVo favoriteVo) {
		System.out.println("MypageDao.insertFriend()");
		
		return session.insert("mypage.insertFriend", favoriteVo);
	}
	
	public RecordUserVo selectFriendInfo(int favoriteNo) {
		System.out.println("MypageDao.selectFriendInfo()");
		
		return session.selectOne("mypage.selectFriendInfo", favoriteNo);
	}
	
	public int deleteFriend(int favoriteNo) {
		System.out.println("MypageDao.deleteFriend()");
		
		return session.delete("mypage.deleteFriend", favoriteNo);
	}
	
	public int insertCarduser(CardUsersVo cardVo) {
		System.out.println("MypageDao.insertCarduser()");
		
		return session.insert("mypage.insertCarduser", cardVo);
	}
	
	public int insertCardMember(CardMemberVo memberVo) {
		System.out.println("MypageDao.insertCardMember()");
		
		return session.insert("mypage.insertCardMember", memberVo);
	}
	
	public List<CardUsersVo> selectCardList(int userNo) {
		System.out.println("MypageDao.selectCardList()");
		
		return session.selectList("mypage.selectCardList", userNo);				
	}
}
