package com.modang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.modang.service.ManagerService;
import com.modang.vo.JsonResult;
import com.modang.vo.ManagerVo;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {

	@Autowired
	private ManagerService managerService;

	/* 회원가입폼 출력 */
	@RequestMapping(value = "/joinForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm() {
		System.out.println("ManagerController.joinForm");
		return "/manager/managerJoinForm";
	}

	/* 회원가입 */
	@RequestMapping(value ="/join", method = {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute ManagerVo managerVo,@RequestParam("file") MultipartFile file) {
		System.out.println("ManagerController.join");
		System.out.println(file);
		managerService.join(file,managerVo);
		return "/manager/managerLoginForm";
	}
	 
	/*회원가입 id 중복체크*/
	@ResponseBody
	@RequestMapping(value ="/join/idcheck", method = {RequestMethod.GET, RequestMethod.POST})
	public JsonResult idcheck(@RequestParam("id") String id) {
		System.out.println("ManagerController.idcheck");
		boolean data =managerService.idcheck(id);
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(data);
		System.out.println(jsonResult);
		return jsonResult;
	}
	
	/*로그인폼 출력*/
	@RequestMapping(value ="/loginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm() {
		System.out.println("ManagerController.loginForm");
		return "/manager/managerLoginForm";
	}

	/* 로그인 */
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@ModelAttribute ManagerVo managerVo, HttpSession sessoin) {
		System.out.println("ManagerController.login");
		ManagerVo loginManager = managerService.login(managerVo);
		System.out.println(loginManager);
		if (loginManager != null) {
			System.out.println("로그인 성공");
			sessoin.setAttribute("loginManager", loginManager);
			return "redirect:/manager/index";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/manager/loginForm?result=fail";
		}
	}

	/* 로그아웃 *//* billiard 헤더 로그아웃버튼 */
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession sessoin) {
		System.out.println("ManagerController.logout");
		sessoin.removeAttribute("loginManager");
		sessoin.invalidate();
		return "redirect:/";
	}

}


