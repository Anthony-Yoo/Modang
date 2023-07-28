package com.modang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modang.service.AttendUsersService;
import com.modang.vo.AttendUsersVo;
import com.modang.vo.JsonResult;

@Controller
@RequestMapping(value="/attendUsers")
public class AttendUsersController {
	
	@Autowired
	private AttendUsersService attendUserService;
	
	@ResponseBody
	@RequestMapping(value="/apply", method= {RequestMethod.POST, RequestMethod.GET})
	public JsonResult apply(@RequestBody AttendUsersVo vo) {
		System.out.println("AttendUsersController.apply()");
		String result = attendUserService.apply(vo);
		System.out.println(result);
		JsonResult jsonResult = new JsonResult();
		jsonResult.setResult(result);
		return jsonResult;
	}
	
	
}
