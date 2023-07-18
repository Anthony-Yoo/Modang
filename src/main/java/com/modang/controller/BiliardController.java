package com.modang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modang.service.BiliardService;
import com.modang.service.ManagerService;

import com.modang.vo.ManagerVo;
import com.modang.vo.TableGamesVo;
import com.modang.vo.CueTableVo;
import com.modang.vo.JsonResult;
import com.modang.vo.TariffVo;

@Controller
@RequestMapping(value="/manager")
public class BiliardController {
	
	@Autowired
	private BiliardService biliardService;
	
	/* 테이블 현황 - 상세정보 가져오기 */
	@ResponseBody
	@RequestMapping(value="/info", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult tableInfo(@ModelAttribute CueTableVo cuetableVo) {
		System.out.println("BiliardController.tableInfo()");
		
		TableGamesVo gamesVo = biliardService.tableInfo(cuetableVo);
		
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(gamesVo);

		return jsonResult;
	}
	

	/* 테이블 현황-테이블 전체리스트 */
	@RequestMapping(value="/index", method = {RequestMethod.GET,RequestMethod.POST})
	public String tableList(Model model) {
		System.out.println("BiliardController.tableList()");
		int no =1;
		List<CueTableVo> cueTableList = biliardService.tableList(no);
		model.addAttribute("cueTableList", cueTableList);
		
		return "/manager/index";
	}
	
	/* 요금테이블폼(요금가져오기) */
	@RequestMapping(value="/pricePolicyForm", method = {RequestMethod.GET,RequestMethod.POST})
	public String pricePolicyForm(Model model) {
		System.out.println("BiliardController.pricePolicyForm()");
        int no = 1;
        TariffVo tariffVo = biliardService.getPrice(no);
        model.addAttribute(tariffVo);
		
		return "/manager/pricePolicy";
	}
	
	/* 요금테이블 수정 */
	@RequestMapping(value="/pricePolicy", method = {RequestMethod.GET,RequestMethod.POST})
	public String pricePolicy(@ModelAttribute TariffVo tariffVo) {
		System.out.println("BiliardController.pricePolicy()");
		int no = 1;

		int count = biliardService.updatePrice(tariffVo);
		
		return "/manager/pricePolicy";
	}
	
	/* 테이블 매출폼 */
	@RequestMapping(value="/tableSalesForm", method = {RequestMethod.GET,RequestMethod.POST})
	public String tableSalesForm() {
		System.out.println("BiliardController.tableSalesForm()");

		
		return "/manager/tableSales";
	}
	
	/* 테이블 매출검색 */
	@RequestMapping(value="/tableSales", method = {RequestMethod.GET,RequestMethod.POST})
	public String tableSales(@RequestParam int tableno,@RequestParam String mindate,
							 @RequestParam String maxdate) {
		System.out.println("BiliardController.tableSales()");
		System.out.println(tableno);
		System.out.println(mindate);
		System.out.println(maxdate);
		return "/manager/tableSales";
	}
	
	/* 관리자 설정폼 */
	@RequestMapping(value="/settingsForm", method = {RequestMethod.GET,RequestMethod.POST})
	public String settingsForm() {
		System.out.println("BiliardController.settingsForm()");

		
		return "/manager/settings";
	}
	

	
}
