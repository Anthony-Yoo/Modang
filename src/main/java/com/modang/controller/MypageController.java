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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.modang.service.MypageService;
import com.modang.service.TabletService;
import com.modang.vo.CardUsersVo;
import com.modang.vo.CurrentRecordVo;
import com.modang.vo.FavoriteUsersVo;
import com.modang.vo.JsonResult;
import com.modang.vo.RecordUserVo;
import com.modang.vo.TabletUserVo;
import com.modang.vo.UserVo;

@RequestMapping("/mypage")
@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private TabletService tabletService;
	
	@RequestMapping(value = "/{userNo}/record",method = {RequestMethod.GET,RequestMethod.POST})
	public String userRecord(@PathVariable("userNo") int userNo,Model model) {
		System.out.println("MypageController.userRecord()");
		
		Map<String,Object> resultList = new HashMap<String,Object>();
		resultList = mypageService.userRecord(userNo);	
		
		CurrentRecordVo curRecordVo = (CurrentRecordVo)resultList.get("curRecordVo");
		RecordUserVo myUserVo = (RecordUserVo)resultList.get("myUserVo");

		//List<RecordUserVo> getGameList = (ArrayList<RecordUserVo>)resultList.get("getGameList");		
		//List<RecordUserVo> getPlayList = (ArrayList<RecordUserVo>)resultList.get("getPlayList");
		
		
		model.addAttribute("myUserVo", myUserVo);
		model.addAttribute("CurrentRecordVo", curRecordVo);
		model.addAttribute("getGameList", resultList.get("getGameList"));
		model.addAttribute("getPlayList", resultList.get("getPlayList"));
		
				
		return "/mypage/userRecord";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{userNo}/playlist",method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult userPlayList(@PathVariable("userNo") int userNo,@RequestParam("gameNo") int gameNo) {
		System.out.println("MypageController.userPlayList()");
		
		RecordUserVo myPlayVo = new RecordUserVo();
		myPlayVo.setUserNo(userNo);
		myPlayVo.setGameNo(gameNo);
		
		List<RecordUserVo> myPlayList = mypageService.userPlayList(myPlayVo);
		
		
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(myPlayList);
		
		return jsonResult;
	}
	@RequestMapping(value = "/friendlist",method = {RequestMethod.GET,RequestMethod.POST})
	public String friendList(Model model,HttpSession session) {
		System.out.println("MypageController.friendList()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		List<RecordUserVo> friendList = mypageService.friendList(userNo);
		System.out.println(friendList);
		
		model.addAttribute("friendList", friendList);
		model.addAttribute("userNo", userNo);
		
		return "/mypage/friendList";
	}	
	
	
	@ResponseBody
	@RequestMapping(value = "/{userNo}/friendinsert",method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult friendInsert(@PathVariable("userNo") int setUserNo,@RequestParam("userNo") int getUserNo) {
		System.out.println("MypageController.friendInput()");
		
		FavoriteUsersVo favoriteVo = new FavoriteUsersVo();
		favoriteVo.setSetUserNo(setUserNo);
		favoriteVo.setGetUserNo(getUserNo);		
		
		RecordUserVo friendInputVo = mypageService.friendInsert(favoriteVo);
		System.out.println(friendInputVo);
		
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(friendInputVo);
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value = "/friendDelete",method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult friendDelete(@RequestParam("favoriteNo") int favoriteNo) {
		System.out.println("MypageController.friendDelete()");
		
		int result = mypageService.friendDelete(favoriteNo);
		JsonResult jsonResult = new JsonResult();
		
		jsonResult.success(result);
		
		return jsonResult;		
	}
	
	@RequestMapping(value = "/FCardList",method = {RequestMethod.GET,RequestMethod.POST})
	public String FCardList(Model model,HttpSession session) {
		System.out.println("MypageController.FCardList()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int userNo = authUser.getUserNo();	
		
		List<CardUsersVo> cardList =mypageService.cardList(userNo);
		System.out.println("=================================");
		System.out.println(cardList);
		System.out.println("=================================");
		
		model.addAttribute("userNo", userNo);
		model.addAttribute("cardList", cardList);
		
		return "/mypage/FCardList";
	}
	
	@RequestMapping(value = "/FCardInsert", method = {RequestMethod.GET,RequestMethod.POST})
	public String FCardInsert(@ModelAttribute CardUsersVo cardVo,Model model) {
		System.out.println("MypageController.FCardInsert()");
		System.out.println(cardVo);
		
		List<CardUsersVo> cardList = mypageService.cardInsert(cardVo);
		System.out.println(cardList);
		model.addAttribute("cardList", cardList);		
		
		return "redirect:/mypage/FCardList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/friendload",method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult friendLoad(@RequestParam("userNo") int userNo) {
		System.out.println("MypageController.friendLoad()");
		
		List<FavoriteUsersVo> friendList = mypageService.friendLoad(userNo);
		System.out.println(friendList);
		
		JsonResult jsonResult = new JsonResult();
		
		jsonResult.success(friendList);
		
		return jsonResult;		
	}
}
