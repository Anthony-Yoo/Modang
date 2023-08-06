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
	public int insertManager(ManagerVo managerVo){
		System.out.println("ManagerDao.insertManager.managerVo");		
		
		return sqlSession.insert("manager.insertManager",managerVo);
	}
	
	/* 회원가입시 요금테이블 생성 */
	public int insertTariff(int biliardno) {
		System.out.println("ManagerDao.insertTariff()");
		System.out.println("요금테이블생성할 당구장:"+biliardno);
		
		return sqlSession.insert("manager.insertTariff", biliardno);
	}
	
	/*회원가입 id 중복체크*/
	public ManagerVo selectManager(String id) {
		
		return sqlSession.selectOne("manager.selectManagerById",id);
	}
	
	/*로그인*/
	public ManagerVo selectManager(ManagerVo managerVo){
		System.out.println("ManagerDao.selectManager");
		ManagerVo loginManager = sqlSession.selectOne("manager.selectManager",managerVo);
		System.out.println(loginManager);
		return loginManager;
	}

}