package com.modang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.modang.service.UserService;
import com.modang.vo.JsonResult;
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
	public String join(@ModelAttribute UserVo userVo, MultipartFile file) {
		System.out.println("UserController.join()");
		System.out.println(userVo);
		System.out.println(file.getOriginalFilename());
		
		userService.join(userVo, file);
		
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
			return "redirect:/";
		}
		else {
			System.out.println("로그인 실패");
			return "redirect:/user/loginForm?result=fail";
		}

	}
	
	  //id check
	 @ResponseBody 
	 @RequestMapping(value="/idcheck", method= {RequestMethod.GET, RequestMethod.POST}) 
	 public JsonResult idCheck(@RequestParam ("id") String id) {
		 System.out.println("UserController.idcheck()");
		 System.out.println(id); 
	  
		 boolean data=userService.idCheck(id);
	 
		 JsonResult jsonResult=new JsonResult();
		 jsonResult.success(data);
		 
		 System.out.println(jsonResult);
	 
	 
	  return jsonResult; 
	  
	 }
	  
	 
	//logout 
	@RequestMapping(value="/logout", method= {RequestMethod.GET,
	RequestMethod.POST}) public String logout(HttpSession session) {
		System.out.println("UserController.logout()");
	 
		session.removeAttribute("authUser"); session.invalidate();
	 
		return "redirect:/";
 
	 }
	
	//회원정보 수정폼 : 유저 넘버로 유저정보 가져오기
	@RequestMapping(value="/modifyForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String modifyForm(HttpSession session, Model model) {
		System.out.println("UserController.modifyForm()");
		
		//새로 저장된 UserVo의 session코드를 받아 변수 no에 저장
		String id=((UserVo)session.getAttribute("authUser")).getId();
		System.out.println(id);
		
		//userService를 통해 로그인한 유저의 모든정보 가져오기
		UserVo userVo=userService.modifyForm(id);
		System.out.println(userVo);
		
		//Dispacher servlet에 유저정보 전달
		model.addAttribute("userVo", userVo);
		System.out.println(userVo);
		return "user/modifyForm";
	}
	
	/*회원정보 수정*/
	@RequestMapping(value="/modify", method= {RequestMethod.GET, RequestMethod.POST})
	public String modify(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println("UserController.modify()");
		System.out.println(userVo);
		//세션에서 로그인한 사용자 정보 가져오기(UserVo)
		UserVo authUser=(UserVo)session.getAttribute("authUser");
		//가져온 세션 정보에서 로그인한 사용자 no값 가져오기
		int userno=authUser.getUserno();
		//파라미터로 넘어온 사용자 정보 : UserVo 정보로 로그인 한 사용자 no값 추가
		userVo.setUserno(userno);
		//userService 를 통해 로그인한 사용자 정보 수정 (service에서 UserVo로 받은 정보 전체)
		userService.modify(userVo);
		//받은 정보 전체 중에 id값을 통한 이름 변경
		authUser.setId(userVo.getId());
		
		return "redirect:/";
	}
	
}
