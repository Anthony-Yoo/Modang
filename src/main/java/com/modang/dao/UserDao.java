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
	//회원정보 수정폼 유저
	public UserVo updateSelect(String id) {
		System.out.println("UserDao.selectUser()");
		System.out.println(id);
		
		UserVo userNo=session.selectOne("user.selectUserByNo", id);
		System.out.println(userNo);
		return userNo;
	}
	//회원정보 수정
	public int updateUser(UserVo userVo) {
		System.out.println("UserDao.selectUser()");
		System.out.println(userVo);
		
		int count=session.update("user.update", userVo);
		
		return count;
		
	}
	
	//id check <--ajax
	public UserVo selectUser(String id) {
		System.out.println("UserDao.selectUser()");
		System.out.println(id);
		
		UserVo userVo=session.selectOne("user.selectUserById", id);
		
		return userVo;
		
	}
	
	//nick check
	public UserVo selectNick(String nick) {
		System.out.println("UserDao.selectNick()");
		System.out.println(nick);
		
		UserVo userVo=session.selectOne("user.selectUserByNick", nick);
		
		return userVo;
	}
	
	//회원정보 확인
	public UserVo selectUserInfo(String id) {
		System.out.println("userDao.selectUser()");
		System.out.println(id);
		
		UserVo nick=session.selectOne("user.selectUserPageByNo", id);
		System.out.println(nick);
		return nick;
	}

}
