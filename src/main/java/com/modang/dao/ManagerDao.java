package com.modang.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.ManagerVo;

@Repository
public class ManagerDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*회원가입*/
	public void insertManager(ManagerVo managerVO){
		System.out.println("ManagerDao.insertManager");
		sqlSession.insert("manager.insertManager",managerVO);
	}
	
	/*로그인*/
	public ManagerVo selectManager(ManagerVo managerVO){
		System.out.println("ManagerDao.selectManager");
		ManagerVo loginManager = sqlSession.selectOne("manager.selectManager",managerVO);
		System.out.println(loginManager);
		return loginManager;
	}

}
