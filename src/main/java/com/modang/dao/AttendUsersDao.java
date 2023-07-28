package com.modang.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.AttendUsersVo;

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
	
	public AttendUsersVo applyCheck(AttendUsersVo vo) {
		System.out.println("AttendUsersDao.applyCheck()");
		AttendUsersVo result = sqlSession.selectOne("attendUsers.applyCheck", vo);
		System.out.println(result);
		return result;
	}
}
