package com.modang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modang.service.UserService;
import com.modang.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	// 회원가입 폼
	@RequestMapping(value = "/user/joinForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm() {
		System.out.println("UserController.joinForm()");

		return "user/joinForm";
	}

	// 회원가입
	@RequestMapping(value = "/user/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(@ModelAttribute UserVo userVo) {
		System.out.println("UserController.join()");
		System.out.println(userVo);
		userService.join(userVo);

		return "user/joinOk";
	}

	// 로그인 폼
	@RequestMapping(value = "/user/loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForm() {
		System.out.println("UserController.loginForm()");

		return "user/loginForm";
	}

	// 로그인
	@RequestMapping(value = "/user/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login() {
		System.out.println("UserController.login()");
		System.out.println();

		userService.login();

		return "";
	}
	/*
	 * //id check
	 * 
	 * @RequestMapping(value="idCheck", method= {RequestMethod.GET,
	 * RequestMethod.POST}) public String idCheck(@RequestParam ("id") String id) {
	 * System.out.println("UserController.idCheck()");
	 * 
	 * userService.idCheck(id); System.out.println(id);
	 * 
	 * return ""; }
	 * 
	 * //logout
	 * 
	 * @RequestMapping(value="logout", method= {RequestMethod.GET,
	 * RequestMethod.POST}) public String logout(HttpSession session) {
	 * System.out.println("UserController.logout()");
	 * 
	 * session.removeAttribute("authUser"); session.invalidate();
	 * 
	 * return "";
	 * 
	 * 
	 * }
	 */
}
