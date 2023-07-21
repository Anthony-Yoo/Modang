package com.modang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.modang.service.ManagerService;
import com.modang.vo.BiliardImageVo;
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
	public String join(@ModelAttribute ManagerVo managerVO) {
		System.out.println("ManagerController.join");
		managerService.join(managerVO);
		return "/manager/managerLoginForm";
	}
	

	/*로그인폼 출력*/
	@RequestMapping(value ="/loginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm() {
		System.out.println("ManagerController.loginForm");
		return "/manager/managerLoginForm";
	}

	/* 로그인 */
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@ModelAttribute ManagerVo managerVO, HttpSession sessoin) {
		System.out.println("ManagerController.login");
		ManagerVo loginManager = managerService.login(managerVO);
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


