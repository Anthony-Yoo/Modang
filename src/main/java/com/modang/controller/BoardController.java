package com.modang.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

import com.modang.service.BDCommentService;
import com.modang.service.BoardService;
import com.modang.vo.BDCommentVo;
import com.modang.vo.BoardVo;
import com.modang.vo.UserVo;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BDCommentService bDCommentService;

	/* 게시판 리스트 페이지 이동 */
	@RequestMapping(value = "/list")
	public String list(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
					   @RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage,
					   @RequestParam(value = "category", required = false, defaultValue = "") String category,
					   Model model) {
		System.out.println("BoardController.list");
		Map<String, Object> pMap = boardService.getList(crtPage, keyword, category);
//		System.out.println(pMap);
		model.addAttribute("pMap", pMap );
		
		return "/board/list";
	}

	/* 글쓰기 폼 페이지 이동 */
	@RequestMapping(value = "/writeForm", method = { RequestMethod.GET })
	public String writeForm(HttpSession session) {
		System.out.println("BoardController.writeForm");
		UserVo vo = (UserVo) session.getAttribute("authUser");
		if(vo!=null) {
			return "/board/writeForm";
		}else {
			return "redirect:/user/loginForm"; 
		}
	}

	/* 글쓰기 서브밋 데이터 */
	@RequestMapping(value = "/write", method = { RequestMethod.POST })
	public String write(@ModelAttribute BoardVo boardVo, HttpSession session) {
		System.out.println("BoardController.write()");
		UserVo vo = (UserVo) session.getAttribute("authUser");
		System.err.println(vo);
		boardVo.setUserNo(vo.getUserNo());
		System.err.println(boardVo);
		/* matchDate의 T를 공백을 변환 */
		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime matchDate = LocalDateTime.parse(boardVo.getMatchDate(), inputFormatter);
		String formattedDate = outputFormatter.format(matchDate);
		boardVo.setMatchDate(formattedDate);
		/* matchDate의 T를 공백을 변환 end */
		System.out.println(boardVo);

		boardService.write(boardVo);
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/read")
	public String read(@RequestParam("boardNo") int boardNo, Model model) {
		System.out.println("BoardController.read()");
		BoardVo vo = boardService.read(boardNo);
		System.out.println(vo);
		model.addAttribute("rList", vo);
		List<BDCommentVo> list = bDCommentService.list();
		System.out.println(list);
		model.addAttribute("cList", list);
		return "/board/read";
	}

	@RequestMapping(value = "/test")
	public String test() {

		return "/board/test2";
	}

	
}
