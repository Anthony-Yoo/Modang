package com.modang.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession session;
	
	//회원가입 정보 입력
	public int insertUser(UserVo userVo) {
		System.out.println("UserDao.insertUser()");
		System.out.println(userVo);
		int count=session.insert("user.insert", userVo);
		
		return count;
		
	}
	
	//회원 로그인 데이터 선택
	public UserVo selectUser(UserVo userVo) {
		System.out.println("UserDao.selectUser()");
		System.out.println(userVo);
		
	UserVo authUser=session.selectOne("user.selectUser", userVo);
	
	return authUser;
	}
	/*
	//id check <--ajax
	public void selectUser(String id) {
		System.out.println("UserDao.");
	}
*/
}
