package com.modang.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.AttendUsersVo;
import com.modang.vo.BoardVo;

@Repository
public class AttendUsersDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 게시판 신청하기 버튼 데이터 등록 */
	public void apply(AttendUsersVo vo) {
		System.out.println("AttendUserDao.apply()");
		System.out.println(vo);
		sqlSession.insert("attendUsers.insert", vo);
	}
	
	/* 이미 신청이 되어 있는지 체크 */
	public AttendUsersVo applyCheck(AttendUsersVo vo) {
		System.out.println("AttendUsersDao.applyCheck()");
		AttendUsersVo result = sqlSession.selectOne("attendUsers.applyCheck", vo);
		System.out.println(result);
		return result;
	}
	
	public List<BoardVo> myApplyList(int userNo){
		System.out.println("AttendUsersDao.myApplyList()");
		List<BoardVo> vo = new ArrayList<BoardVo>();
		vo = sqlSession.selectList("attendUsers.myApplyList", userNo);
		return vo;
	}
	
	public List<AttendUsersVo> applyList(int boardNo){
		System.out.println("AttendUsersDao.applyList()");
		List<AttendUsersVo> vo = new ArrayList<AttendUsersVo>();
		vo = sqlSession.selectList("attendUsers.applyList", boardNo);
		System.out.println(vo);
		return vo;
	}
	
}
