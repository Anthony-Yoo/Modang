package com.modang.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.AttendUsersDao;
import com.modang.dao.BoardDao;
import com.modang.vo.AttendUsersVo;
import com.modang.vo.BoardVo;

@Service
public class AttendUsersService {

	@Autowired
	private AttendUsersDao attendUsersDao;
	
	@Autowired
	private BoardDao boardDao;
	
	/* 신청하기 완료 */
	public String apply(AttendUsersVo vo) {
		System.out.println("AttendUserService.apply()");
		if(attendUsersDao.applyCheck(vo) == null) {
			attendUsersDao.apply(vo);
			return "신청이 완료되었습니다.";
		}else {
			return "이미 신청된 글입니다.";
		}
	}
	
	
	/* 내가 신청한 리스트 */
	public List<BoardVo> myApplyList(int userNo){
		System.out.println("AttendUserService.myApplyList()");
		List<BoardVo> vo = new ArrayList<BoardVo>();
		vo = attendUsersDao.myApplyList(userNo);
		
		return vo;
	}
	
	/* 내 글에 신청한 리스트 */
	public List<AttendUsersVo> applyList(int boardNo){
		System.out.println("AttendUserService.applyList()");
		List<AttendUsersVo> vo = new ArrayList<AttendUsersVo>();
		vo = attendUsersDao.applyList(boardNo);
		return vo;
	}

	/* 신청한 유저 승인 및 거절 처리 */
	public void approve(AttendUsersVo attendUsersVo) {
		System.out.println("AttendUserService.approve()");
		attendUsersDao.approve(attendUsersVo);
		BoardVo result = attendUsersDao.memberCheck(attendUsersVo.getBoardNo());
		
		if(result.getAgreeCount()+1 >= result.getMembernum()){
			System.out.println("결과는?");
			/* 확정으로 게시판 상태 변경 */
			boardDao.confirmed(result.getBoardNo());
			/* 승인된 이외의 데이터 삭제 */
			attendUsersDao.delete(result.getBoardNo());
		}
	}
}
