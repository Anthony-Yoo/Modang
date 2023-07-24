package com.modang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modang.service.TabletService;
import com.modang.vo.CardUsersVo;
import com.modang.vo.JsonResult;
import com.modang.vo.PlayUserVo;
import com.modang.vo.TableGamesVo;
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
		System.out.println("TabletController.selectBall()");		
		
		
		return "/tablet/selectball";
	}
	
	@RequestMapping(value="/tablet/memberForm", method = {RequestMethod.GET,RequestMethod.POST})
	public String memberForm(Model model,HttpSession session) {
		System.out.println("TabletController.memberForm()");
		
		TabletUserVo authUser = (TabletUserVo)session.getAttribute("authUser");
		int userNo = authUser.getUserNo();	
		
		List<CardUsersVo> cardList = tabletService.myMember(userNo);
		System.out.println(cardList);
		model.addAttribute("cardList", cardList);
		
		return "/tablet/memberForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/tablet/confirm", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult confirm(@RequestBody TableGamesVo tableGame) {
		System.out.println("TabletController.confirm()");
		System.out.println(tableGame);
		
		 int gameNo = tabletService.createGame(tableGame);
		
		JsonResult jsonResult = new JsonResult();
				
		if (gameNo > 0) { 
			jsonResult.success(gameNo); 
			
			}else {				
				jsonResult.fail("해당id를 가진 유져가 없습니다."); 
			}
		 
		
		return jsonResult;
	}
	
	@RequestMapping(value="tablet/scoreboard", method = {RequestMethod.GET,RequestMethod.POST})
	public String scoreboard() {
		System.out.println("TabletController.scoreboard()");
		
		return "";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/tablet/idfind", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult userFind(@RequestParam(value="id") String id) {
		System.out.println("TabletController.userFind()");
		System.out.println(id);
		
		List<TabletUserVo> playerList = tabletService.userFind(id);
		System.out.println(playerList);
		JsonResult jsonResult = new JsonResult();
		
		if (playerList != null) {			
			jsonResult.success(playerList);
		}else {
			jsonResult.fail("해당id를 가진 유져가 없습니다.");	
		}	
		
		return jsonResult;
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
