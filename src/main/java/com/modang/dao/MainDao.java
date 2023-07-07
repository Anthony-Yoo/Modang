package com.modang.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void insert(int no) {
		System.out.println("MainDao.insert()");
		
		sqlSession.insert("main.insert", no);		
	}
	

}
