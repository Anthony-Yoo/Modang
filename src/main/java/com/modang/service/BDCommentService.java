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
	
	public BDCommentVo addComment(BDCommentVo vo) {
		System.out.println("BDCommentService.addComment()");
		bDCommentdao.insert(vo);
		return bDCommentdao.selectComment(vo);
	}
	
	public BDCommentVo addSComment(BDCommentVo vo) {
		if(bDCommentdao.CheckData(vo)!= null) {
			if(bDCommentdao.SCModify(vo)!=0) {
				bDCommentdao.SCInsert(vo);
				return bDCommentdao.selectComment(vo);
			}
			return null;
		}else {
			bDCommentdao.SCInsert(vo);
			return bDCommentdao.selectComment(vo);
		}
	}
	
	public List<BDCommentVo> list(int boardNo){
		System.out.println("RBoardService.list()");
		List<BDCommentVo> list = bDCommentdao.list(boardNo); 
		return list;
	}
}
