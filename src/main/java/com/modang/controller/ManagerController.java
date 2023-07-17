package com.modang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.modang.service.ManagerService;

import com.modang.vo.ManagerVo;

import com.modang.vo.CueTableVo;

import com.modang.vo.TariffVo;

@Controller
@RequestMapping(value="/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;

	/*회원가입폼 출력*/
	@RequestMapping(value ="/joinForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
		System.out.println("ManagerController.joinForm");
		return "/manager/managerJoinForm";
	}
	/*회원가입*/
	@RequestMapping(value ="/join", method = {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute ManagerVo managerVO) {
		System.out.println("ManagerController.join");
		
		return "";
	}
	
	/*로그인폼 출력*/
	@RequestMapping(value ="/loginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm() {
		System.out.println("ManagerController.loginForm");
		return "/manager/managerLoginForm";
	}
	
	/*로그인*/
	@RequestMapping(value ="/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(@ModelAttribute ManagerVo managerVO) {
		System.out.println("ManagerController.login");
		managerService.login(managerVO);
		return "";
	}
	
}
