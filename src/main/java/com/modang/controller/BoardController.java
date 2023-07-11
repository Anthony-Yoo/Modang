package com.modang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	/* 게시판 리스트 페이지 이동 */
	@RequestMapping(value="/list")
	public String list() {
		return "/board/list";
	}
	
	/* 글쓰기 폼 페이지 이동 */
	@RequestMapping(value="/writeForm")
	public String writeForm() {
		
		return "/board/writeForm";
	}
	
	@RequestMapping(value="/test")
	public String test() {
		
		return "/board/mapApi";	
	}
}
