package com.modang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.modang.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("/")
	public String main() {
		System.out.println("MainController.main()");
		
		return "main/main";
	}
	
	@RequestMapping("/insert")
	public String insert(@RequestParam int no) {
		System.out.println("MainController.insert()");
		
		
		mainService.insert(no);
		
		return "redirect:/";		
		
	}
	
	

}
