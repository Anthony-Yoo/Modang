package com.modang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.UserDao;
import com.modang.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	/*회원가입*/
	public int join(UserVo userVo) {
		System.out.println("UserService.join()");
		System.out.println(userVo);
		int count=userDao.insertUser(userVo);
		
		return count;
		
	}
	/*로그인*/
	public UserVo login(UserVo userVo) {
		System.out.println("UserService.login()");
		System.out.println(userVo);
		
		UserVo authUser=userDao.selectUser(userVo);
		
		return authUser;
	}
	/*수정폼*/
	public UserVo modifyForm(int userno) {
		System.out.println("UserService.modifyForm()");
		System.out.println(userno);
		
		UserVo userVo=userDao.selectUser(userno);
		
		return userVo;
	}
	/*id check
	public void idCheck(String id) {
		System.out.println("UserService.idCheck()");
		
		userDao.selectUser(id);
	}
*/
}
