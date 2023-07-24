package com.modang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.BDCommentVo;

@Repository
public class BDCommentDao {
	
	@Autowired
	private SqlSession sqlSession;

	public void insert(BDCommentVo vo) {
		System.out.println("BDCommentDao.insert()");
		System.out.println(vo);
		sqlSession.insert("bDComment.insert", vo);
		System.out.println(vo);
	}
	
	public List<BDCommentVo> list(){
		List<BDCommentVo> list = sqlSession.selectList("bDComment.list"); 
		System.out.println(list);
		return list;
	}
}
