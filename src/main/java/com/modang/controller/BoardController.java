package com.modang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	/* 게시판 리스트 출력 */
	@RequestMapping(value="/list")
	public String list() {
		return "/board/list";
	}
}
