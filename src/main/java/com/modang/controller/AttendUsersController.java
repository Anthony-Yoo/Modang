package com.modang.controller;

import java.util.Map;

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
import com.modang.vo.JsonResult;

@Controller
@RequestMapping(value = "/attendUsers")
public class AttendUsersController {

	@Autowired
	private AttendUsersService attendUserService;

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

	// 유저 마이페이지의 신청 리스트 목록
	@RequestMapping(value = "/myPage/applyMenu")
	public String applyList(@RequestParam(value = "userNo", required = false, defaultValue = "-1") int userNo, Model model) {
		System.out.println("AttendUsersController.applyList()");
		// Map<String, Object> pMap = boardService.getList(crtPage, keyword, category);
		// System.out.println(pMap);
		// model.addAttribute("pMap", pMap);	
		
		return "user/myPage/applyManagement";
	}

}
