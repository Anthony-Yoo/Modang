package com.modang.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.BoardVo;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlsession;
	
	/* 게시글 작성 등록 */
	public void insert(BoardVo vo) {
		System.out.println("BoardDao.insert()");
		vo.setUserNo(1); // 테스트용 임시 계정번호
		sqlsession.insert("board.insert", vo);
	}
	
}
