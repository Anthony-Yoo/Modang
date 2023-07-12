package com.modang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.modang.service.ManagerService;

@Controller
@RequestMapping(value="/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;

	/*회원가입폼 출력*/
	@RequestMapping(value ="/joinForm")
	public String joinForm() {
		System.out.println("ManagerController.joinForm");
		return "/manager/managerJoinForm";
	}
	/*회원가입*/
	@RequestMapping(value ="/join")
	public String join() {
		System.out.println("ManagerController.join");
		
		return "";
	}
	
	/*로그인폼 출력*/
	@RequestMapping(value ="/loginForm")
	public String loginForm() {
		System.out.println("ManagerController.loginForm");
		return "/manager/managerLoginForm";
	}
	
	/* 요금테이블 */
	@RequestMapping(value="/pricePolicy")
	public String PricePolicy() {
		
		return "/manager/pricePolicy";
	}
	
	/* 테이블 매출 */
	@RequestMapping(value="/tableSales")
	public String Tablesales() {
		
		return "/manager/tableSales";
	}
}
