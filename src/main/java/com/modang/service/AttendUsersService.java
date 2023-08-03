package com.modang.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.AttendUsersDao;
import com.modang.vo.AttendUsersVo;
import com.modang.vo.BoardVo;

@Service
public class AttendUsersService {

	@Autowired
	private AttendUsersDao attendUsersDao;
	
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
	public List<BoardVo> myApplyList(int userNo){
		System.out.println("AttendUserService.myApplyList()");
		List<BoardVo> vo = new ArrayList<BoardVo>();
		vo = attendUsersDao.myApplyList(userNo);
		
		return vo;
	}
}
