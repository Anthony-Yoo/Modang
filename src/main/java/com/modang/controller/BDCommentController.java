package com.modang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/comment")
public class BDCommentController {

	@RequestMapping(value="/add",method = {RequestMethod.GET})
	public String addComment() {
		
		return "";
	}
	
	@RequestMapping(value="/list")
	public String commentList() {
		
		return "";
	}
}
