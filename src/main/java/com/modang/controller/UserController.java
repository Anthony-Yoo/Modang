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
	
	// 사용자 선택폼
	@RequestMapping(value= "/userJoinForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String userJoinForm() {
		System.out.println("UserController.userJoinForm()");
		
		return "user/userJoinForm";
	}
	
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
		
		int count=userService.join(userVo, file);
		if(count>0) {
			System.out.println("조인성공");
			return "user/joinOk";
		}
		else {
			System.out.println("조인실패");
			return "redirect:/user/joinForm?result=fail";
		}
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
	 @RequestMapping(value="/idCheck", method= {RequestMethod.GET, RequestMethod.POST}) 
	 public JsonResult idCheck(@RequestParam ("id") String id) {
		 System.out.println("UserController.idCheck()");
		 System.out.println(id); 
	  
		 boolean data=userService.idCheck(id);
	 
		 JsonResult jsonResult=new JsonResult();
		 jsonResult.success(data);
		 
		 System.out.println(jsonResult);
	 
		 return jsonResult; 
	  
	 }
	 
	 //닉네임 체크
	 @ResponseBody 
	 @RequestMapping(value="/nickChek", method= {RequestMethod.GET, RequestMethod.POST})
	 public JsonResult nickCheck(String nick) {
		 System.out.println("UserController.nickCheck()");
		 System.out.println(nick);
		 
		 boolean data=userService.nickCheck(nick);
		 
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
	public String modify(@ModelAttribute UserVo userVo, MultipartFile file, HttpSession session) {
	
		System.out.println("UserController.modify()");
		System.out.println(userVo);
		System.out.println(file.getOriginalFilename());
		
		//세션에서 로그인한 사용자 정보 가져오기(UserVo)
		UserVo authUser=(UserVo)session.getAttribute("authUser");
		
		//가져온 세션 정보에서 로그인한 사용자 no값 가져오기
		int userNo=authUser.getUserNo();
		
		//파라미터로 넘어온 사용자 정보 : UserVo 정보로 로그인 한 사용자 no값 추가
		userVo.setUserNo(userNo);
		
		//userService 를 통해 로그인한 사용자 정보 수정 (service에서 UserVo로 받은 정보 전체)
		userService.modify(userVo, file);
		
		//세션의 닉네임 변경
		authUser.setNick(userVo.getNick());
		
		/*
		 * //세션의 이미지 표기 및 변경 authUser.setProfileimage(userVo.getProfileimage());
		 */
		 
		return "redirect:/user/modifyForm";
	}
	
	//나의 페이지
	@RequestMapping(value="/userPage", method= {RequestMethod.GET, RequestMethod.POST})
	public String userPage(HttpSession session,  Model model) {
		System.out.println("UserController.userPage()");
		
		String id=((UserVo)session.getAttribute("authUser")).getId();
		System.out.println(id);
		
		if(id!=null) { //로그인 되어있을 경우 접속
		
		UserVo userVo=userService.userPage(id);
		if(userVo!=null) { //로그인 되어있을 경우 접속
		model.addAttribute("userVo", userVo);
		System.out.println(userVo);
		System.out.println();//check
		
		}
		return "user/userPage";
	}else {//로그 아웃 되었을 때 메인페이지로
		return "user/loginForm";
	}
}

	
	/*
	 * @RequestMapping(value="/testPage", method= {RequestMethod.GET,
	 * RequestMethod.POST}) public String testPage() {
	 * System.out.println("UserController.testPage()");
	 * 
	 * return "user/testPage"; }
	 */
}
	

