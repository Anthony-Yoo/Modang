package com.modang.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.modang.service.BDCommentService;
import com.modang.service.BoardService;
import com.modang.service.ManagerService;
import com.modang.vo.BDCommentVo;
import com.modang.vo.BoardVo;
import com.modang.vo.ManagerVo;
import com.modang.vo.UserVo;

@Controller
@RequestMapping(value = "/board")
public class TestController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private BDCommentService bDCommentService;

	@Autowired
	private ManagerService managerService;

	/* 매칭게시판 리스트 폼 */
	@RequestMapping(value = "/writeForm2", method = { RequestMethod.GET })
	public String writeForm(HttpSession session) {
		System.out.println("BoardController.writeForm");
		UserVo vo = (UserVo) session.getAttribute("authUser");
		if (vo != null) {
			return "/board/a-writeForm";
		} else {
			return "redirect:/user/loginForm";
		}
	}

	/* 게시판 리스트 페이지 이동 */
	@RequestMapping(value = "/list2")
	public String list(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage,
			@RequestParam(value = "category", required = false, defaultValue = "") String category, Model model) {
		System.out.println("BoardController.list");
		Map<String, Object> pMap = boardService.getList(crtPage, keyword, category);
//		System.out.println(pMap);
		model.addAttribute("pMap", pMap);

		return "/board/a-list";
	}

	/* 글 읽기 */
	@RequestMapping(value = "/read2")
	public String read(@RequestParam("boardNo") int boardNo, Model model) {
		System.out.println("BoardController.read()");
		BoardVo vo = boardService.read(boardNo);
		System.out.println(vo);
		model.addAttribute("rList", vo);
		List<BDCommentVo> list = bDCommentService.list(boardNo);
		System.out.println(list);
		model.addAttribute("cList", list);
		return "/board/a-read";
	}

}
