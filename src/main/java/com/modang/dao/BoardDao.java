package com.modang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modang.vo.BoardVo;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	/* 게시글 작성 등록 */
	public void insert(BoardVo vo) {
		System.out.println("BoardDao.insert()");
		sqlSession.insert("board.insert", vo);
	}
	
	public List<BoardVo> selectList(int startNum, int endNum, String keyword){
		System.out.println("BoardDao.selectList()");
		System.out.println(startNum+ " " + endNum);
		
		Map<String, Object> bMap = new HashMap<String, Object>();
		bMap.put("startRnum", startNum);
		bMap.put("endRnum", endNum);
		bMap.put("keyword", keyword);
		System.out.println(bMap);
			
		List<BoardVo> boardList = sqlSession.selectList("board.selectList", bMap);
		System.out.println(boardList);

		return boardList;
	}
	
	public int totalCount(String keyword) {
		System.out.println("boardDao.totalCount()");
		int total = sqlSession.selectOne("board.totalCount", keyword);
		System.out.println(total);
		return total;
	}
	
	
}
