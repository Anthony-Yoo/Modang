package com.modang.controller;

import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import com.modang.service.ManagerService;
import com.modang.vo.JsonResult;
import com.modang.vo.ManagerVo;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {

	@Autowired
	private ManagerService managerService;

	/* 회원가입폼 출력 */
	@RequestMapping(value = "/joinForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm() {
		System.out.println("ManagerController.joinForm");
		
		return "/manager/managerJoinForm";
	}

	/* 회원가입 */ // 요금테이블 정보 같이 삽입
	@RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(@ModelAttribute ManagerVo managerVo, @RequestParam("file") List<MultipartFile> file,
			Model model) {
		// 웹 폼에서 전송된 모든 파일들이 file 리스트에 저장되어 컨트롤러로 전달
		System.out.println("ManagerController.join");
		System.out.println(managerVo);// 이미지 파일명 보임
		int count = managerService.join(managerVo, file);
		if(count==1) { System.out.println("회원가입성공");
			return "manager/managerJoinSuccess"; 
			
		}else { System.out.println("회원가입실패");		
		
			return "redirect:/manager/joinForm";
		}
	}
	
	/* 회원가입 id 중복체크 */
	@ResponseBody
	@RequestMapping(value = "/join/idcheck", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult idcheck(@RequestParam("id") String id) {
		System.out.println("ManagerController.idcheck()");
		ManagerVo idcheckVo = managerService.idcheck(id);
		
		JsonResult jsonResult = new JsonResult();
		
		if(idcheckVo !=null ) {
			System.out.println("아이디가 있어욤~");
			jsonResult.success(idcheckVo);//Json에 담아서 전달
		}else {			
			System.out.println("아이디가 없어용~");
			jsonResult.success(idcheckVo);//없지만 Json에 담아서 전달
		}		
		
		System.out.println(jsonResult);	
				
		return jsonResult;
	}

	/* 로그인폼 출력 */
	@RequestMapping(value = "/loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForm() {
		System.out.println("ManagerController.loginForm");
		return "/manager/managerLoginForm";
	}

	/* 로그인 */
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@ModelAttribute ManagerVo managerVo, HttpSession sessoin) {
		System.out.println("ManagerController.login");
		ManagerVo loginManager = managerService.login(managerVo);
		System.out.println(loginManager);
		if (loginManager != null) {
			System.out.println("로그인 성공");
			sessoin.setAttribute("loginManager", loginManager);
			return "redirect:/manager/index";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/manager/loginForm?result=fail";
		}
	}

	/* 로그아웃 *//* billiard 헤더 로그아웃버튼 */
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession sessoin) {
		System.out.println("ManagerController.logout");
		sessoin.removeAttribute("loginManager");
		sessoin.invalidate();
		return "redirect:/";
	}
	
	/*당구장 정보 수정폼*/
	@RequestMapping(value = "/settingsForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String settingsForm(HttpSession session, Model model) {
		System.out.println("ManagerController.settingsForm");
		ManagerVo loginManager=(ManagerVo)session.getAttribute("loginManager");//횡변환
		if(loginManager==null) {
			return "redirect:/manager/loginForm";
		}
		int no = loginManager.getbiliardNo();
		ManagerVo managerVo = managerService.settingsForm(no);
		System.out.println(managerVo);
		model.addAttribute("managerVo", managerVo);//request "managerVo"
		System.out.println("ManagerController.settingsForm");
		return "/manager/settings";
	}
	/*당구장 정보 수정*/
	@RequestMapping(value = "modify", method = {RequestMethod.GET, RequestMethod.POST })
	public String modify(HttpSession session, @ModelAttribute ManagerVo managerVo
			, @RequestParam("file") List<MultipartFile> file) {
		System.out.println("ManagerController.modify()" + managerVo);
		managerService.modify(managerVo,file);
		return "redirect:/manager/settingsForm";
	}
	/*당구장 찾기-모당리스트*/	
	@RequestMapping(value = "/modangFind", method = {RequestMethod.GET, RequestMethod.POST })
	public String modanglist(Model model) {
		System.out.println("ManagerController.modanglist()");		
		
		List<ManagerVo> modanglist = managerService.modanglist();
		model.addAttribute("modanglist", modanglist);
		
		return "/main/modangFind";
	}
	
}
