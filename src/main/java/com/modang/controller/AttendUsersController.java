package com.modang.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modang.service.AttendUsersService;
import com.modang.service.BoardService;
import com.modang.vo.AttendUsersVo;
import com.modang.vo.BoardVo;
import com.modang.vo.JsonResult;
import com.modang.vo.UserVo;

@Controller
@RequestMapping(value = "/attendUsers")
public class AttendUsersController {

	@Autowired
	private AttendUsersService attendUserService;
	
	@Autowired
	private BoardService boardService;

	@ResponseBody
	@RequestMapping(value = "/apply", method = { RequestMethod.POST, RequestMethod.GET })
	public JsonResult apply(@RequestBody AttendUsersVo vo) {
		System.out.println("AttendUsersController.apply()");
		String result = attendUserService.apply(vo);
		System.out.println(result);
		JsonResult jsonResult = new JsonResult();
		jsonResult.setResult(result);
		return jsonResult;
	}

	// 마이페이지 내가 쓴 글 리스트 목록
	@RequestMapping(value = "/myPage/myBoardList")
	public String myBoardList(HttpSession session, Model model) {
		System.out.println("AttendUsersController.myBoardList()");
		UserVo vo = (UserVo)session.getAttribute("authUser");
		if(vo != null) {
		List<BoardVo> result = boardService.myBoardList(vo.getUserNo());
		model.addAttribute("mBList", result);
			return "user/myPage/applyManagement";
		}else {
			return "user/loginForm";
		}
	}
	
	@RequestMapping(value="/myPage/myApplyList")
	public String myApplyList(HttpSession session, Model model) {
		System.out.println("AttendUsersController.myApplyList()");
		UserVo vo = (UserVo)session.getAttribute("authUser");
		if(vo != null) {
			List<BoardVo> result = attendUserService.myApplyList(vo.getUserNo());
			model.addAttribute("mAList", result);
			return "user/myPage/applyMenu";
		}else {
			return "user/loginForm";
		}
	}
}
