package com.modang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.modang.service.TabletService;
import com.modang.vo.TabletUserVo;


@Controller
public class TabletController {
	
	@Autowired
	private TabletService tabletService;
	
	@RequestMapping(value = "/tablet",method = {RequestMethod.GET,RequestMethod.POST})
	public String keyLoginForm() {
		System.out.println("TabletController.keyLoginForm()");		
		
		
		return "/tablet/login";
	}
	
	@RequestMapping(value = "/tablet/keyLogin",method = {RequestMethod.GET,RequestMethod.POST})
	public String keyLogin(@RequestParam("keyNum") int keyNum,HttpSession session) {
		System.out.println("TabletController.keyLogin()");		
		System.out.println(keyNum);
		
		TabletUserVo resultVo = tabletService.keyLogin(keyNum);
		System.out.println(resultVo);
		
		TabletUserVo authUser = new TabletUserVo();	
		  
		if (resultVo != null) {		
		System.out.println("로그인성공");
		authUser.setUserNo(resultVo.getUserNo());
		authUser.setNick(resultVo.getNick());
		authUser.setAverage(resultVo.getAverage());
		session.setAttribute("authUser", authUser);
		  
		return "/tablet/selectball";
		
		} else { 
		System.out.println("로그인실패");
		
		return "redirect:/tablet?result=fail";		
		}	

	}	
	
	
	@RequestMapping(value = "/tablet/selectBall",method = {RequestMethod.GET,RequestMethod.POST})
	public String selectBall() {
		System.out.println("TabletController.keyLoginForm()");		
		
		
		
		return "/tablet/login";
	}
	
	@RequestMapping(value = "/mobile",method = {RequestMethod.GET,RequestMethod.POST})
	public String mobileLoginForm() {
		System.out.println("TabletController.loginForm()");		
		
		
		return "/tablet/mobilelogin";
	}
	
	@RequestMapping(value = "/mobile/login",method = {RequestMethod.GET,RequestMethod.POST})
	public String mobileLogin(@ModelAttribute TabletUserVo userVo,Model model) {
		System.out.println("TabletController.loginForm()");		
		System.out.println(userVo);
		
		TabletUserVo resultVo = tabletService.loginGetKey(userVo);		
		System.out.println(resultVo);
		  
		if (resultVo != null) {		
		System.out.println("로그인성공");
		model.addAttribute("keyUser", resultVo);
		  
		return "/tablet/mobilekeyview";
		
		} else { 
		System.out.println("로그인실패");
		
		return "redirect:/mobile?result=fail";		
		}
	}
	

}
