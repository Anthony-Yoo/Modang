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
	
	/* 내가 신청한 리스트 */
	public List<BoardVo> myApplyList(int userNo){
		System.out.println("AttendUsersDao.myApplyList()");
		List<BoardVo> vo = new ArrayList<BoardVo>();
		vo = sqlSession.selectList("attendUsers.myApplyList", userNo);
		return vo;
	}
	/* 내 글에 신청한 리스트 */
	public List<AttendUsersVo> applyList(int boardNo){
		System.out.println("AttendUsersDao.applyList()");
		List<AttendUsersVo> vo = new ArrayList<AttendUsersVo>();
		vo = sqlSession.selectList("attendUsers.applyList", boardNo);
		System.out.println(vo);
		return vo;
	}
	
	/* 신청한 유저 승인처리 */
	public void approve(AttendUsersVo attendUsersVo) {
		System.out.println("AttendUserDao.approve()");
		int result = sqlSession.update("attendUsers.approve", attendUsersVo);
		System.out.println(result);
	}
	/* 신청글에 대한 승인된 인원 */
	public int agreeCount(int boardNo) {
		System.out.println("AttendUserDao.agreeCount()");
		int agreeCount = sqlSession.selectOne("attendUsers.agreeCount", boardNo);
		return agreeCount;
	}

	/* 승인된 인원 체크 */
	public BoardVo memberCheck(int boardNo) {
		System.out.println("AttendUserDao.memberCheck()");
		BoardVo result = sqlSession.selectOne("attendUsers.memberCheck", boardNo);
		return result;
	}
	
	public void delete(int boardNo) {
		System.out.println("AttendUsersDao.delete()");
		sqlSession.delete("attendUsers.delete",boardNo);
	}
}
