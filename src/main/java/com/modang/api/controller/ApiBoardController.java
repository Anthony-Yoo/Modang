package com.modang.api.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modang.vo.BDCommentVo;
import com.modang.vo.JsonResult;

@Controller
public class ApiBoardController {

	@ResponseBody
	@GetMapping("/api/board/addComment")
	public JsonResult addComment(@ModelAttribute BDCommentVo bdCommentVo) {
		System.out.println("ApiBoardController.addComment()");
		System.out.println(bdCommentVo);
		
		return null;
	}
}
