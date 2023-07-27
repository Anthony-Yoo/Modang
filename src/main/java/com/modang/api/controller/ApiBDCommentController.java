package com.modang.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modang.service.BDCommentService;
import com.modang.vo.BDCommentVo;
import com.modang.vo.JsonResult;

@Controller
@RequestMapping("/api/comment")
public class ApiBDCommentController {

	@Autowired
	private BDCommentService bDCommentService;

	@ResponseBody
	@PostMapping("/addComment")
	public JsonResult addComment(@RequestBody BDCommentVo bdCommentVo) {
		System.out.println("ApiBoardController.addComment()");
		System.out.println(bdCommentVo);
		BDCommentVo result = bDCommentService.addComment(bdCommentVo);

		JsonResult jsonResult = new JsonResult();
		jsonResult.success(result);
		
		return jsonResult;
	}
	
	@ResponseBody
	@PostMapping("/addSComment")
	public JsonResult addSComment(@RequestBody BDCommentVo bdCommentVo) {
		System.out.println("ApiBoardController.addSComment()");
		System.out.println(bdCommentVo);
		BDCommentVo result = bDCommentService.addSComment(bdCommentVo);
		System.out.println("결과"+result);
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(result);
		
		return jsonResult;
	}
	
	@ResponseBody
	@PostMapping(value = "/list")
	public JsonResult commentList(@RequestParam int boardNo) {
		System.out.println("ApiBDCommentController.list()");
		System.out.println(boardNo);
		List<BDCommentVo> list= bDCommentService.list(boardNo);
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(list);
		
		System.out.println(jsonResult);
		return jsonResult;
	}

}
