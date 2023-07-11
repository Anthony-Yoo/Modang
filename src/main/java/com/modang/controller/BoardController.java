package com.modang.controller;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modang.service.BoardService;
import com.modang.vo.BoardVo;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	/* 게시판 리스트 페이지 이동 */
	@RequestMapping(value="/list")
	public String list() {
		return "/board/list";
	}
	
	/* 글쓰기 폼 페이지 이동 */
	@RequestMapping(value="/writeForm", method={RequestMethod.GET})
	public String writeForm() {
		System.out.println("BoardController.writeForm");
		return "/board/writeForm";
	}
	
	/* 글쓰기 서브밋 데이터*/
	@RequestMapping(value="/write", method = {RequestMethod.POST})
	public String write(@ModelAttribute BoardVo boardVo) {
		System.out.println("BoardController");
		/* matchDate의 T를 공백을 변환 */
		  DateTimeFormatter inputFormatter =
		  DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"); DateTimeFormatter
		  outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		  LocalDateTime matchDate = LocalDateTime.parse(boardVo.getMatchDate(),
		  inputFormatter); String formattedDate = outputFormatter.format(matchDate);
		  boardVo.setMatchDate(formattedDate);
		/* matchDate의 T를 공백을 변환 end */
		System.out.println(boardVo);
		
		boardService.write(boardVo);
		return "/board/list";
	}
	
	@RequestMapping(value="/test")
	public String test() {
		
		return "/board/mapApi";	
	}
}
