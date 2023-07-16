package com.modang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.modang.service.ManagerService;

import com.modang.vo.ManagerVo;

import com.modang.vo.CueTableVo;

import com.modang.vo.TariffVo;

@Controller
@RequestMapping(value="/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;

	/*회원가입폼 출력*/
	@RequestMapping(value ="/joinForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
		System.out.println("ManagerController.joinForm");
		return "/manager/managerJoinForm";
	}
	/*회원가입*/
	@RequestMapping(value ="/join", method = {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute ManagerVo managerVO) {
		System.out.println("ManagerController.join");
		
		return "";
	}
	
	/*로그인폼 출력*/
	@RequestMapping(value ="/loginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm() {
		System.out.println("ManagerController.loginForm");
		return "/manager/managerLoginForm";
	}
	
	/*로그인*/
	@RequestMapping(value ="/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(@ModelAttribute ManagerVo managerVO) {
		System.out.println("ManagerController.login");
		managerService.login(managerVO);
		return "";
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////
	
	/* 테이블 현황-테이블 전체리스트 */
	@RequestMapping(value="/index", method = {RequestMethod.GET,RequestMethod.POST})
	public String tableList(Model model) {
		System.out.println("ManagerController.tableList()");
		int no =1;
		List<CueTableVo> cueTableList = managerService.tableList(no);
		model.addAttribute("cueTableList", cueTableList);
		
		return "/manager/index";
	}
	
	/* 요금테이블폼(요금가져오기) */
	@RequestMapping(value="/pricePolicyForm", method = {RequestMethod.GET,RequestMethod.POST})
	public String pricePolicyForm(Model model) {
		System.out.println("ManagerController.pricePolicyForm()");
        int no = 1;
        TariffVo tariffVo = managerService.getPrice(no);
        model.addAttribute(tariffVo);
		
		return "/manager/pricePolicy";
	}
	
	/* 요금테이블 수정 */
	@RequestMapping(value="/pricePolicy", method = {RequestMethod.GET,RequestMethod.POST})
	public String pricePolicy(@ModelAttribute TariffVo tariffVo) {
		System.out.println("ManagerController.pricePolicy()");
		int no = 1;

		int count = managerService.updatePrice(tariffVo);
		
		return "/manager/pricePolicy";
	}
	
	/* 테이블 매출폼 */
	@RequestMapping(value="/tableSalesForm", method = {RequestMethod.GET,RequestMethod.POST})
	public String tableSalesForm() {
		System.out.println("ManagerController.tableSalesForm()");

		
		return "/manager/tableSales";
	}
	
	/* 테이블 매출검색 */
	@RequestMapping(value="/tableSales", method = {RequestMethod.GET,RequestMethod.POST})
	public String tableSales(@RequestParam int tableno,@RequestParam String mindate,
							 @RequestParam String maxdate) {
		System.out.println("ManagerController.tableSales()");
		System.out.println(tableno);
		System.out.println(mindate);
		System.out.println(maxdate);
		return "/manager/tableSales";
	}
	
	/* 관리자 설정폼 */
	@RequestMapping(value="/settingsForm", method = {RequestMethod.GET,RequestMethod.POST})
	public String settingsForm() {
		System.out.println("ManagerController.settingsForm()");

		
		return "/manager/settings";
	}
	

	
}
