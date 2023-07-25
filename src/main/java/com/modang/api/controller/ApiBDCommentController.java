package com.modang.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modang.service.BDCommentService;
import com.modang.vo.BDCommentVo;
import com.modang.vo.JsonResult;

@Controller
public class ApiBDCommentController {
	
	@Autowired
	private BDCommentService bDCommentService;
	
	@ResponseBody
	@PostMapping("/api/comment/addComment")
	public JsonResult addComment(@RequestBody BDCommentVo bdCommentVo) {
		System.out.println("ApiBoardController.addComment()");
		System.out.println(bdCommentVo);
		bDCommentService.addComment(bdCommentVo);
		
		
		return null;
	}
	
	/*
	 * @RequestMapping(value="/list") public String commentList(Model model) {
	 * System.out.println("RBoardController.list()"); List<BDCommentVo> list =
	 * bDCommentService.list(); System.out.println(list);
	 * model.addAttribute("cList", list);
	 * 
	 * return "board/read"; }
	 */
}
