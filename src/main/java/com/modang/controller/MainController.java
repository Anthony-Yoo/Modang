package com.modang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.modang.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	/* 친구목록 출력-옮기고 지우기 */
	@RequestMapping(value = "/friendList", method = { RequestMethod.GET, RequestMethod.POST })
	public String friendList() {
		System.out.println("ManagerController.friendList");
		return "/user/myPage/FriendList";
	}
	/* 카드추가 폼 출력-옮기고 지우기 */
	@RequestMapping(value = "/cardList", method = { RequestMethod.GET, RequestMethod.POST })
	public String cardList() {
		System.out.println("ManagerController.cardList");
		return "/user/myPage/FCardList";
	}
	
	/*모당 메인페이지*/
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
