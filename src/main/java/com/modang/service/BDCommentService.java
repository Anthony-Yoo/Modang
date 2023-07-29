package com.modang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.BDCommentDao;
import com.modang.vo.BDCommentVo;

@Service
public class BDCommentService {

	@Autowired
	private BDCommentDao bDCommentdao;
	
	//댓글 추가
	public BDCommentVo addComment(BDCommentVo vo) {
		System.out.println("BDCommentService.addComment()");
		bDCommentdao.insert(vo);
		return bDCommentdao.selectComment(vo);
	}
	
	
	// 대댓글 추가
	public BDCommentVo addSComment(BDCommentVo vo) {
		//대댓글 추가시 기존의 값과 중복되는 값이 있는지 체크하고 수정한뒤 추가 후 추가된 값 리턴
		if(bDCommentdao.CheckData(vo)!= null) {
			if(bDCommentdao.SCModify(vo)!=0) {
				bDCommentdao.SCInsert(vo);
				return bDCommentdao.selectComment(vo);
			}
			return null;
		}else {
			//중복값 없을시 바로 추가 후 추가된 값 리턴
			bDCommentdao.SCInsert(vo);
			return bDCommentdao.selectComment(vo);
		}
	}
	
	/* 댓글 리스트 */
	public List<BDCommentVo> list(int boardNo){
		System.out.println("RBoardService.list()");
		List<BDCommentVo> list = bDCommentdao.list(boardNo); 
		return list;
	}
}
