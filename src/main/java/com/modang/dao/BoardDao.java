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
		System.out.println(vo);
		sqlSession.insert("board.insert", vo);
	}

	/* 게시판 리스트 출력을 위한 리스트 */
	public List<BoardVo> selectList(int startNum, int endNum, String keyword, String category){
		System.out.println("BoardDao.selectList()");
		System.out.println(startNum+ " " + endNum);
		
		Map<String, Object> bMap = new HashMap<>();
		bMap.put("startRnum", startNum);
		bMap.put("endRnum", endNum);
		bMap.put("keyword", keyword);
		bMap.put("category", category);
		// matchgametype에 대한 처리를 추가
        if ("matchgametype".equals(category)) {
            if ("구".equals(keyword)) {
                bMap.put("matchgametypeValue", -1);
            } else if ("3".equals(keyword) || "3구".equals(keyword)) {
                bMap.put("matchgametypeValue", 0);
            } else if ("4".equals(keyword) || "4구".equals(keyword)) {
                bMap.put("matchgametypeValue", 1);
            } else if (keyword.contains("포") || keyword.contains("켓") || keyword.contains("볼") || keyword.contains("포켓") || keyword.contains("켓볼") || keyword.contains("포켓볼")) {
                bMap.put("matchgametypeValue", 2);
            } else {
                bMap.put("matchgametypeValue", null); // 그 외의 경우는 null로 처리하여 조건에서 제외
            }
        }
		System.out.println(bMap);
			
		List<BoardVo> boardList = sqlSession.selectList("board.selectList", bMap);
		System.out.println(boardList);

		return boardList;
	}
	
	/* 검색기능 결과에 대한 카운트 */
	public int totalCount(String keyword, String category) {
		System.out.println("boardDao.totalCount()");
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("keyword", keyword);
		paramMap.put("category", category);
		if ("matchgametype".equals(category)) {
            if ("구".equals(keyword)) {
            	paramMap.put("matchgametypeValue", -1);
            } else if ("3".equals(keyword) || "3구".equals(keyword)) {
            	paramMap.put("matchgametypeValue", 0);
            } else if ("4".equals(keyword) || "4구".equals(keyword)) {
            	paramMap.put("matchgametypeValue", 1);
            } else if (keyword.contains("포") || keyword.contains("켓") || keyword.contains("볼") || keyword.contains("포켓") || keyword.contains("켓볼") || keyword.contains("포켓볼")) {
            	paramMap.put("matchgametypeValue", 2);
            } else {
            	paramMap.put("matchgametypeValue", null); // 그 외의 경우는 null로 처리하여 조건에서 제외
            }
        }
		
		int total = sqlSession.selectOne("board.totalCount", paramMap);
		System.out.println(total);
		return total;
	}
	
	/* 조회수 증가 */
	public void hitAddCount(int boardNo) {
		sqlSession.update("board.hitAddCount", boardNo);
	}
	
	/* 글 read시 필요한 한개의 데이터 */
	public BoardVo selectOne(int boardNo) {
		System.out.println("BoardDao.selectOne()");
		BoardVo result = sqlSession.selectOne("selectOne", boardNo);
		
		return result;
	}
	
	
}
