package com.modang.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
@RequestMapping(value = "/manager")
public class BiliardController {

	@Autowired
	private BiliardService biliardService;
	
	/* 테이블 현황 - 테이블 종류 변경 */
	@ResponseBody
	@RequestMapping(value="/tabletype", method= {RequestMethod.GET, RequestMethod.POST})
	public String tableTypeModify(HttpSession session, @ModelAttribute CueTableVo cuetableVo) {
		System.out.println("BiliardController.tableTypeModify()");
		
		biliardService.tableTypeModify(cuetableVo);
		
		return "";
	}
	
	

	/* 테이블 현황 - 상세정보 가져오기 */
	@ResponseBody
	@RequestMapping(value ="/info", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult tableInfo(HttpSession session, @ModelAttribute CueTableVo cuetableVo) {
		System.out.println("BiliardController.tableInfo()");

		Map<String, Object> tMap = biliardService.tableInfo(cuetableVo);

		JsonResult jsonResult = new JsonResult();
		jsonResult.success(tMap);

		return jsonResult;
	}

	/* 테이블 현황-테이블 전체리스트 */
	@RequestMapping(value="/index", method = {RequestMethod.GET,RequestMethod.POST})
	public String tableList(HttpSession session, Model model) {
		System.out.println("BiliardController.tableList()");
		
		ManagerVo loginManager =(ManagerVo)session.getAttribute("loginManager");
		
		if(loginManager!=null) { //로그인 되어있을 경우 접속
			int biliardNo = loginManager.getbiliardNo();
					
			List<CueTableVo> cueTableList = biliardService.tableList(biliardNo);
			List<TableGamesVo> gamesList =biliardService.getGames(biliardNo);
			
			model.addAttribute("cueTableList", cueTableList);
			
			return "/manager/index";
		
		}else { //로그인 안되어있을 경우 로그인페이지로 이동
			return "/manager/managerLoginForm";
		}
		
	}

	/* 요금테이블폼(요금가져오기) */
	@RequestMapping(value = "/pricePolicyForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String pricePolicyForm(HttpSession session, Model model) {
		System.out.println("BiliardController.pricePolicyForm()");

		ManagerVo loginManager = (ManagerVo) session.getAttribute("loginManager");
		int biliardNo = loginManager.getbiliardNo();

		TariffVo tariffVo = biliardService.getPrice(biliardNo);
		model.addAttribute(tariffVo);

		return "/manager/pricePolicy";
	}

	/* 요금테이블 수정 */
	@RequestMapping(value = "/pricePolicy", method = { RequestMethod.GET, RequestMethod.POST })
	public String pricePolicy(HttpSession session, @ModelAttribute TariffVo tariffVo) {
		System.out.println("BiliardController.pricePolicy()");

		ManagerVo loginManager = (ManagerVo) session.getAttribute("loginManager");
		int biliardNo = loginManager.getbiliardNo();

		biliardService.updatePrice(tariffVo);

		return "/manager/pricePolicy";
	}

	/* 테이블 매출폼 */
	@RequestMapping(value = "/tableSalesForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String tableSalesForm() {
		System.out.println("BiliardController.tableSalesForm()");

		return "/manager/tableSales";
	}

	/* 테이블 매출검색 */
	@RequestMapping(value = "/tableSales", method = { RequestMethod.GET, RequestMethod.POST })
	public String tableSales(@RequestParam int tableno, @RequestParam String mindate, @RequestParam String maxdate) {
		System.out.println("BiliardController.tableSales()");
		System.out.println(tableno);
		System.out.println(mindate);
		System.out.println(maxdate);
		return "/manager/tableSales";
	}

	/* 관리자 설정폼 */
	@RequestMapping(value = "/settingsForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String settingsForm() {
		System.out.println("BiliardController.settingsForm()");

		return "/manager/settings";
	}

}
