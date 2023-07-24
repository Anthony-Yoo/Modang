package com.modang.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.modang.vo.ManagerVo;

@Repository
public class ManagerDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*회원가입*/
	public void insertManager(ManagerVo managerVo){
		System.out.println("ManagerDao.insertManager");
		sqlSession.insert("manager.insertManager",managerVo);
	}
	public void insertManager(ManagerVo managerVo,MultipartFile file){
		System.out.println("ManagerDao.insertManager");
		sqlSession.insert("manager.insertManager",managerVo);
	}
	
	/*로그인*/
	public ManagerVo selectManager(ManagerVo managerVo){
		System.out.println("ManagerDao.selectManager");
		ManagerVo loginManager = sqlSession.selectOne("manager.selectManager",managerVo);
		System.out.println(loginManager);
		return loginManager;
	}

}