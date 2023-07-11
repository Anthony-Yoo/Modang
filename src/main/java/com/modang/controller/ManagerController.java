package com.modang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/manager")
public class ManagerController {

	/*회원가입폼 출력*/
	@RequestMapping(value ="/joinForm")
	public String joinForm() {
		System.out.println("ManagerController.joinForm");
		return "/manager/managerJoinForm";
	}
	
	/*로그인폼 출력*/
	@RequestMapping(value ="/loginForm")
	public String loginForm() {
		System.out.println("ManagerController.loginForm");
		return "/manager/managerLoginForm";
	}
}
