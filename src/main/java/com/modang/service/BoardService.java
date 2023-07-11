package com.modang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.BoardDao;
import com.modang.vo.BoardVo;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao boardDao;

	public void write(BoardVo boardVo){
		System.out.println("BoardService.write");
		boardDao.insert(boardVo);
	}
}
