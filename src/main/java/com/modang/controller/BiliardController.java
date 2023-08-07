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
import org.springframework.web.bind.annotation.ResponseBody;

import com.modang.service.BiliardService;
import com.modang.vo.CueTableVo;
import com.modang.vo.JsonResult;
import com.modang.vo.ManagerVo;
import com.modang.vo.TableGamesVo;
import com.modang.vo.TariffVo;

@Controller
@RequestMapping(value = "/manager")
public class BiliardController {

	@Autowired
	private BiliardService biliardService;

	/* 테이블현황 페이지-------------------------------------------------------------------*/
	/* 테이블 현황 - 하나의 게임정보의 결제금액 가져오기 */
	@ResponseBody
	@RequestMapping(value = "/gamesPaymoney", method = { RequestMethod.GET, RequestMethod.POST })
	public String gamesPaymoney() {
		System.out.println("BiliardController.gamesPaymoney()");

		return "";
	}

	/* 테이블 현황 - 게임 결제 */
	@ResponseBody
	@RequestMapping(value = "/payMent", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult payMent(@ModelAttribute TableGamesVo gamesVo) {
		System.out.println("BiliardController.payMent()");
		int count = biliardService.payMent(gamesVo);

		JsonResult jsonResult = new JsonResult();
		jsonResult.success(count);

		return jsonResult;
	}

	/* 테이블 현황 - 테이블 추가 */
	@ResponseBody
	@RequestMapping(value = "/addTable", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult addTable(HttpSession session, @ModelAttribute CueTableVo cuetableVo) {
		System.out.println("BiliardController.addTable()");
		System.out.println(cuetableVo);

		ManagerVo loginManager = (ManagerVo) session.getAttribute("loginManager");
		cuetableVo.setBiliardNo(loginManager.getbiliardNo());

		int count = biliardService.addTable(cuetableVo);

		JsonResult jsonResult = new JsonResult();
		jsonResult.success(count);

		return jsonResult;
	}

	/* 테이블 현황 - 테이블 종류 변경 */
	@ResponseBody
	@RequestMapping(value = "/tabletype", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult tableTypeModify(HttpSession session, @ModelAttribute CueTableVo cuetableVo) {
		System.out.println("BiliardController.tableTypeModify()");

		int count = biliardService.tableTypeModify(cuetableVo);

		JsonResult jsonResult = new JsonResult();
		jsonResult.success(count);

		return jsonResult;
	}

	/* 테이블 현황 - 상세정보 가져오기 */
	@ResponseBody
	@RequestMapping(value = "/info", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult tableInfo(HttpSession session, @ModelAttribute CueTableVo cuetableVo) {
		System.out.println("BiliardController.tableInfo()");

		Map<String, Object> tMap = biliardService.tableInfo(cuetableVo);

		JsonResult jsonResult = new JsonResult();
		jsonResult.success(tMap);

		return jsonResult;
	}

	/* 테이블 현황 - 테이블 전체리스트 */
	@RequestMapping(value = "/index", method = { RequestMethod.GET, RequestMethod.POST })
	public String tableList(HttpSession session, Model model) {
		System.out.println("BiliardController.tableList()");

		ManagerVo loginManager = (ManagerVo) session.getAttribute("loginManager");

		if (loginManager != null) { // 로그인 되어있을 경우 접속
			int biliardNo = loginManager.getbiliardNo();

			List<CueTableVo> cueTableList = biliardService.tableList(biliardNo);
			if (cueTableList != null) {
				model.addAttribute("cueTableList", cueTableList);
			}

			return "/manager/index";

		} else { // 로그인 안되어있을 경우 로그인페이지로 이동
			return "/manager/managerLoginForm";
		}
	}

	/* 테이블 매출페이지----------------------------------------------------------------- */
	/* 테이블 매출검색 */
	@RequestMapping(value = "/tableSales", method = { RequestMethod.GET, RequestMethod.POST })
	public String tableSales(@ModelAttribute TableGamesVo tableGamesVo, HttpSession session, Model model) {
		ManagerVo loginManager = (ManagerVo) session.getAttribute("loginManager");
		System.out.println(loginManager);
		int biliardNo = loginManager.getbiliardNo();
		System.out.println(biliardNo);
		tableGamesVo.setBiliardNo(biliardNo);

		/* 테이블 리스트 가져오기 */
		List<CueTableVo> cuetableList = biliardService.tablesalesList(biliardNo);

		System.out.println(cuetableList);
		model.addAttribute("cuetableList", cuetableList);
		
		List<TableGamesVo> salesList = biliardService.searchTable(tableGamesVo);
		model.addAttribute("salesList",salesList);
		
		return "/manager/tableSales";
	}

	/* 일별 매출 페이지----------------------------------------------------------------------------- */
	@RequestMapping(value = "/daySalesForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String daySalesForm() {
		System.out.println("BiliardController.daySalesForm()");

		return "/manager/daySales";
	}
	
	@RequestMapping(value = "/daySales", method = { RequestMethod.GET, RequestMethod.POST })
	public String daySales(@ModelAttribute TableGamesVo tableGamesVo,HttpSession session ) {
		System.out.println("BiliardController.daySales()");
		System.out.println("--------일별매출검색-------");
		
		ManagerVo loginManager = (ManagerVo) session.getAttribute("loginManager");
		int biliardNo = loginManager.getbiliardNo();
		System.out.println("당구장넘버: "+biliardNo);
		
		tableGamesVo.setBiliardNo(biliardNo);
		biliardService.daySales(tableGamesVo);
		
		return "/manager/daySales";
		
	}

	/* 요금테이블 페이지-------------------------------------------------------------------------- */
	/* 요금테이블 수정 */
	@RequestMapping(value = "/pricePolicy", method = { RequestMethod.GET, RequestMethod.POST })
	public String pricePolicy(@ModelAttribute TariffVo tariffVo) {
		System.out.println("BiliardController.pricePolicy()");

		biliardService.updatePrice(tariffVo);

		return "/manager/pricePolicy";
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

}
