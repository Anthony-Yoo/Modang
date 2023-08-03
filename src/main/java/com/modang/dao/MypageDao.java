package com.modang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
}
