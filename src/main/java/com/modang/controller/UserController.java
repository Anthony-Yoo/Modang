package com.modang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modang.service.UserService;
import com.modang.vo.UserVo;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	// 회원가입 폼
	@RequestMapping(value = "/joinForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm() {
		System.out.println("UserController.joinForm()");

		return "user/joinForm";
	}

	// 회원가입
	@RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(@ModelAttribute UserVo userVo) {
		System.out.println("UserController.join()");
		System.out.println(userVo);
		userService.join(userVo);

		return "user/joinOk";
	}

	// 로그인 폼
	@RequestMapping(value = "/loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForm() {
		System.out.println("UserController.loginForm()");

		return "user/loginForm";
	}

	// 로그인
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@ModelAttribute  UserVo userVo, HttpSession session) {
		System.out.println("UserController.login()");
		System.out.println(userVo);

		UserVo authUser=userService.login(userVo);
		
		if(authUser !=null) {
			System.out.println("로그인 성공");
			session.setAttribute("authUser", authUser);
			return "redirect:/main";
		}
		else {
			System.out.println("로그인 실패");
			return "redirect:/user/loginForm?result=fail";
		}

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
	  */
	
	
	//logout 
	@RequestMapping(value="/logout", method= {RequestMethod.GET,
	RequestMethod.POST}) public String logout(HttpSession session) {
		System.out.println("UserController.logout()");
	 
		session.removeAttribute("authUser"); session.invalidate();
	 
		return "redirect:/main";
 
	 }
	
	//수정폼 : 유저 넘버로 유저정보 가져오기
	@RequestMapping(value="/modifyForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String modifyForm(HttpSession session, Model model) {
		System.out.println("UserController.modifyForm()");
		
		//새로 저장된 UserVo의 session코드를 받아 변수 no에 저장
		int userno=((UserVo)session.getAttribute("authUser")).getUserno();
		System.out.println(userno);
		
		//userService를 통해 로그인한 유저의 모든정보 가져오기
		UserVo userVo=userService.modifyForm(userno);
		System.out.println(userVo);
		
		//Dispacher servlet에 유저정보 전달
		model.addAttribute("userVo", userVo);
		
		return "user/modifyForm";
	}
	
	/*수정
	@RequestMapping(value="/modify", method= {RequestMethod.GET, RequestMethod.POST})
	public String modify(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println("UserController.modify()");
		System.out.println(userVo);
		
		UserVo authUser=(UserVo)session.getAttribute("authUser");
		
		int no=authUser.getUserno();
		
		return "";
	}
	*/
}
