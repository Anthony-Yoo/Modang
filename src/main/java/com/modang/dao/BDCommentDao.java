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

	/* 댓글 추가 */
	public void insert(BDCommentVo vo) {
		System.out.println("BDCommentDao.insert()");
		System.out.println(vo);
		sqlSession.insert("bDComment.insert", vo);
		System.out.println(vo);
	}
	
	/* 하나의 댓글 데이터 출력문 */
	public BDCommentVo selectComment(BDCommentVo vo) {
		System.out.println("BDCommentDao.selectComment()");
		BDCommentVo result = sqlSession.selectOne("bDComment.selectComment", vo);
		System.out.println(result);
		return result;
		
	}
	
	/* 댓글 리스트 출력 */
	public List<BDCommentVo> list(int boardNo){
		List<BDCommentVo> list = sqlSession.selectList("bDComment.list", boardNo); 
		System.out.println(list);
		return list;
	}
	
	// 댓글 데이터가 존재하는지 체크
	public BDCommentVo CheckData(BDCommentVo vo) {
		return sqlSession.selectOne("bDComment.checkVal", vo);
	}
	
	/* 대댓글 데이터 삽입을 위한 기존의 정보 수정 */
	public int SCModify(BDCommentVo vo) {
		System.out.println("BDCommentDao.SCModify()");
		//기존 order값 1씩 증가
		return sqlSession.update("bDComment.sCModify", vo);
	}
	
	
	/* 대댓글 데이터 삽입 */
	public BDCommentVo SCInsert(BDCommentVo vo) {
		System.out.println("BDCommentService.SCInsert()");
		System.out.println(vo);
		sqlSession.insert("bDComment.sInsert", vo);
		System.out.println(vo);
		return vo;
	}
	
}
