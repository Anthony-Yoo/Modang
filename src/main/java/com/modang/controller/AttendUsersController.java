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

	/* 신청하기를 통해 신청완료 기능 */
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
	
	/* 내가 신청한 리스트 */
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
	
	/* 내 글에 신청한 리스트 */
	@ResponseBody
	@RequestMapping(value="/myPage/applyList")
	public JsonResult applyList(@RequestParam("boardNo") int boardNo ,HttpSession session, Model model) {
		System.out.println("AttendUsersController.applyList()");
		System.out.println(boardNo);
		List<AttendUsersVo> result = attendUserService.applyList(boardNo);
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(result);
		jsonResult.setResult(null);
		
		return jsonResult;
	}
	
	/* 내 글 신청자들 승인 및 거절 */
	@ResponseBody
	@RequestMapping(value="/decide")
	public JsonResult decide(@RequestBody AttendUsersVo attendUsersVo) {
		System.out.println("AttendUsersController.decide()");
		System.out.println(attendUsersVo);
		JsonResult jsonResult = new JsonResult();
		if(attendUsersVo!=null) {
			attendUserService.approve(attendUsersVo);
			List<AttendUsersVo> result = attendUserService.applyList(attendUsersVo.getBoardNo());
			jsonResult.success(result);
		}else if(attendUsersVo==null) {
			System.out.println("실패");
			jsonResult.fail("처리 실패");
		}
		
		return jsonResult;
	}
	
	
}
