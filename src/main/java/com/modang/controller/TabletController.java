package com.modang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modang.service.TabletService;
import com.modang.vo.CardUsersVo;
import com.modang.vo.CueTableVo;
import com.modang.vo.JsonResult;
import com.modang.vo.ManagerVo;
import com.modang.vo.PlayUserVo;
import com.modang.vo.TableGamesVo;
import com.modang.vo.TabletUserVo;


@Controller
@RequestMapping("/tablet")
public class TabletController {
	
	@Autowired
	private TabletService tabletService;	

	/*로그인폼 출력*/
	@RequestMapping(value ="", method = {RequestMethod.GET, RequestMethod.POST})
	public String managerLoginForm() {
		System.out.println("TabletController.managerLoginForm()");
		
		return "/tablet/managerLoginForm";
	}
	
	/* 로그인 */
	@RequestMapping(value = "/managerlogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String managerlogin(@ModelAttribute ManagerVo managerVo, Model model) {
		System.out.println("TabletController.managerlogin()");
		
		managerVo = tabletService.managerLogin(managerVo);
		
		System.out.println(managerVo);
		if (managerVo != null) {
			System.out.println("로그인 성공");
			List<CueTableVo> tableList = tabletService.managerFindTable(managerVo);
			System.out.println(tableList);
			model.addAttribute("tableList", tableList);			
			return "/tablet/index";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/tablet?result=fail";
		}
	}
	
	@RequestMapping(value = "/{tableNo}/loginForm",method = {RequestMethod.GET,RequestMethod.POST})
	public String keyLoginForm(@PathVariable("tableNo") int tableNo,Model model) {
		System.out.println("TabletController.keyLoginForm()");		
		
		model.addAttribute(tableNo);
		
		return "/tablet/login";
	}
	
	@RequestMapping(value = "/{tableNo}/keyLogin",method = {RequestMethod.GET,RequestMethod.POST})
	public String keyLogin(@RequestParam("keyNum") int keyNum,HttpSession session,
			@PathVariable("tableNo") int tableNo,Model model) {
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
			model.addAttribute(tableNo);
			
			return "/tablet/selectball";
		
		} else { 
			System.out.println("로그인실패");
			
			return "redirect:/tablet/"+tableNo+"/loginForm?result=fail";		
		}	

	}	
	
	
	@RequestMapping(value = "/{tableNo}/selectBall",method ={RequestMethod.GET,RequestMethod.POST}) 
	public String selectBall(@PathVariable("tableNo") int tableNo,Model model) {
		System.out.println("TabletController.selectBall()");	
		
		model.addAttribute("tableNo", tableNo);
	
		return "/tablet/selectball"; 
	}
	
	
	@RequestMapping(value="/{tableNo}/memberForm", method = {RequestMethod.GET,RequestMethod.POST})
	public String memberForm(Model model,HttpSession session,
			@PathVariable("tableNo") int tableNo) {
		System.out.println("TabletController.memberForm()");
		
		TabletUserVo authUser = (TabletUserVo)session.getAttribute("authUser");
		int userNo = authUser.getUserNo();	
		
		Map<String, Object> memberPackage = new HashMap<String,Object>(); 
		memberPackage = tabletService.myMember(userNo);
		System.out.println(memberPackage);
			
		model.addAttribute("cardList", memberPackage.get("cardList"));
		model.addAttribute("favoriteList", memberPackage.get("favoriteList"));
		model.addAttribute("tableNo",tableNo);
		
		
		return "/tablet/memberForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/confirm", method = {RequestMethod.GET,RequestMethod.POST})
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
	
	@RequestMapping(value="/{tableNo}/scoreboard", method = {RequestMethod.GET,RequestMethod.POST})
	public String scoreboard(@PathVariable("tableNo") int tableNo,Model model) {  //테이블No 게임No
		System.out.println("TabletController.scoreboard()");
		
		TableGamesVo tableGameVo = tabletService.playFind(tableNo);		
		System.out.println(tableGameVo);
		model.addAttribute("tableGameVo", tableGameVo);	
		
		return "/tablet/scoreboard";
	}
	@ResponseBody
	@RequestMapping(value="/playstart", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult playStart(@ModelAttribute TableGamesVo tableGameVo) {  //게임시작!
		System.out.println("TabletController.playStart()");
			
		TableGamesVo myGameInfo = tabletService.startGame(tableGameVo);	
		JsonResult jsonResult = new JsonResult();
		if (myGameInfo != null) { 			
			jsonResult.success(myGameInfo);
			System.out.println(jsonResult);
			
			}else {				
				System.out.println("해당Game이 없습니다."); 
			}		
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value="/playpause", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult playPause(@ModelAttribute TableGamesVo tableGameVo) {  //일시정지!
		System.out.println("TabletController.playPause()");
			
		TableGamesVo myGameInfo = tabletService.pauseGame(tableGameVo);	
		System.out.println(myGameInfo);
		JsonResult jsonResult = new JsonResult();
		if (myGameInfo != null) { 			
			jsonResult.success(myGameInfo);
			System.out.println(jsonResult);
			
			}else {				
				System.out.println("해당Game이 없습니다."); 
			}
		
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value="/pausestatus", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult pauseStatus(@ModelAttribute TableGamesVo tableGameVo) {  //일시정지!
		System.out.println("TabletController.pauseStatus()");
			
		TableGamesVo myGameInfo = tabletService.pauseStatus(tableGameVo);	
		System.out.println(myGameInfo);
		JsonResult jsonResult = new JsonResult();
		if (myGameInfo != null) { 			
			jsonResult.success(myGameInfo);
			System.out.println(jsonResult);
			
			}else {				
				System.out.println("해당Game이 없습니다."); 
			}
		
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value="/playstatus", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult playStatus(@ModelAttribute TableGamesVo tableGameVo) {  //일시정지!
		System.out.println("TabletController.playStatus()");
			
		TableGamesVo myGameInfo = tabletService.playStatus(tableGameVo);	
		System.out.println(myGameInfo);
		JsonResult jsonResult = new JsonResult();
		if (myGameInfo != null) { 			
			jsonResult.success(myGameInfo);
			System.out.println(jsonResult);
			
			}else {				
				System.out.println("해당Game이 없습니다."); 
			}
		
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value="/saveplay", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult savePlay(@ModelAttribute PlayUserVo playUserVo) {  //개인게임종료!
		System.out.println("TabletController.savePlay()");
		System.out.println(playUserVo);
			
		PlayUserVo myPlayInfo = tabletService.updatePlayInfo(playUserVo);	
		System.out.println(myPlayInfo);
		JsonResult jsonResult = new JsonResult();
		if (myPlayInfo != null) { 			
			jsonResult.success(myPlayInfo);
			System.out.println(jsonResult);
			
			}else {				
				System.out.println("해당Play가 없습니다."); 
			}
		
		
		return jsonResult;
	}	
	@ResponseBody
	@RequestMapping(value="/playrestart", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult playReStart(@ModelAttribute TableGamesVo tableGameVo) {  //재시작!
		System.out.println("TabletController.playReStart()");
			
		TableGamesVo myGameInfo = tabletService.reStartGame(tableGameVo);	
		System.out.println(myGameInfo);
		JsonResult jsonResult = new JsonResult();
		if (myGameInfo != null) { 			
			jsonResult.success(myGameInfo);
			System.out.println(jsonResult);
			
			}else {				
				System.out.println("해당Game이 없습니다."); 
			}
		
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value="/playend", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult playEnd(@ModelAttribute TableGamesVo tableGameVo) {  // 게임종료(마지막완료)!
		System.out.println("TabletController.playEnd()");
			
		TableGamesVo myGameInfo = tabletService.endGame(tableGameVo);	
		System.out.println(myGameInfo);
		JsonResult jsonResult = new JsonResult();
		if (myGameInfo != null) { 			
			jsonResult.success(myGameInfo);
			System.out.println(jsonResult);
			
			}else {				
				System.out.println("해당Game이 없습니다."); 
			}		
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value="/playquit", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult playQuit(@ModelAttribute TableGamesVo tableGameVo) {  //재시작!
		System.out.println("TabletController.playQuit()");
			
		TableGamesVo myGameInfo = tabletService.quitGame(tableGameVo);	
		System.out.println(myGameInfo);
		JsonResult jsonResult = new JsonResult();
		if (myGameInfo != null) { 			
			jsonResult.success(myGameInfo);
			System.out.println(jsonResult);
			
			}else {				
				System.out.println("해당Game이 없습니다."); 
			}		
		
		return jsonResult;
	}
	
	@RequestMapping(value="/{tableNo}/resultPage", method = {RequestMethod.GET,RequestMethod.POST})
	public String resultPage(@PathVariable("tableNo") int tableNo,@ModelAttribute TableGamesVo tableGameVo,Model model) {  //결과페이지!
		System.out.println("TabletController.resultPage()");
		System.out.println(tableGameVo);
		
		TableGamesVo myGameInfo = tabletService.playResultFind(tableGameVo);	
		System.out.println(myGameInfo);

		if (myGameInfo != null) { 
			model.addAttribute("tableGameVo", myGameInfo);
			System.out.println(myGameInfo);
			
			}else {				
				System.out.println("해당Game이 없습니다."); 
			}		
		
		return "/tablet/resultPage";
	}
	@ResponseBody
	@RequestMapping(value="/resultdata", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult resultData(@ModelAttribute TableGamesVo tableGameVo) {  //결과페이지!
		System.out.println("TabletController.resultPage()");
			
		TableGamesVo myGameInfo = tabletService.playResultFind(tableGameVo);	
		System.out.println(myGameInfo);
		JsonResult jsonResult = new JsonResult();
		if (myGameInfo != null) { 
			jsonResult.success(myGameInfo);
			System.out.println(myGameInfo);
			
			}else {				
				System.out.println("해당Game이 없습니다."); 
			}		
		
		return jsonResult;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/idfind", method = {RequestMethod.GET,RequestMethod.POST})
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
		System.out.println("TabletController.mobileLogin()");		
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
