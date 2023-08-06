package com.modang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.modang.service.MypageService;
import com.modang.service.TabletService;
import com.modang.vo.CardUsersVo;
import com.modang.vo.CurrentRecordVo;
import com.modang.vo.JsonResult;
import com.modang.vo.RecordUserVo;

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
	@RequestMapping(value = "/{userNo}/friendlist",method = {RequestMethod.GET,RequestMethod.POST})
	public String friendList(@PathVariable("userNo") int userNo,Model model) {
		System.out.println("MypageController.friendList()");
		
		List<RecordUserVo> friendList = mypageService.friendList(userNo);
		System.out.println(friendList);
		
		model.addAttribute("friendList", friendList);
	
		
		return "/mypage/friendList";
	}
	

}
