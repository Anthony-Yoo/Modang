package com.modang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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
		
		return "redirect:/tablet/mobilelogin?result=fail";		
		}
	}
	

}
