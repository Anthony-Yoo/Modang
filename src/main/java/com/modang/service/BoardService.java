package com.modang.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modang.dao.AttendUsersDao;
import com.modang.dao.BoardDao;
import com.modang.vo.BoardVo;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private AttendUsersDao attendUsersDao;

	/* 게시판 글 작성 등록 */
	public void write(BoardVo boardVo) {
		// System.out.println("BoardService.write");
		boardDao.insert(boardVo);
	}

	/* 게시판 리스트 검색기능, 페이지기능 포함 */
	public Map<String, Object> getList(int crtPage, String keyword, String category) {

		// 페이지가 1페이지 이상인경우 해당 페이지번호로.
		crtPage = (crtPage >= 1) ? crtPage : (crtPage = 1);

		// 5 5
		// 1-5, 6-10 1-5, 6-10
		// rownum 번호를 구해야 한다.
		// startRnum, endRnum

		// 페이지당 글 갯수
		int listCnt = 10;

		// 시작글 번호
		int startRnum = (crtPage - 1) * listCnt + 1;

		// 끝글번호
		int endRum = (startRnum + listCnt) - 1;
		List<BoardVo> bList = boardDao.selectList(startRnum, endRum, keyword, category);
		
		/////////////////////////////////////////////////////////
		// 페이징 계산
		/////////////////////////////////////////////////////////

		// 전체 글 갯수
		int totalCount = boardDao.totalCount(keyword, category);

		// 페이지당 버튼 갯수
		int pageBtnCount = 5;

		// 마지막 버튼 번호
		// 1 --> 1~5
		// 2 --> 1~5
		// 3 --> 1~5
		// 4 --> 1~5
		// 5 --> 1~5
		// 6 --> 6~10
		// 10 --> 6~10

		int endPageBtnNo = (int) Math.ceil(crtPage / (double) pageBtnCount) * pageBtnCount;

		// 시작버튼 번호
		int startPageBtnNo = (endPageBtnNo - pageBtnCount) + 1;

		// 다음 화살표
		boolean next = false;

		if (endPageBtnNo * listCnt < totalCount) { // 10 * 10 < 123
			next = true;
		} else {
			next = false;
			// 끝버튼 번호 endPageBtnNo 다시 계산
			endPageBtnNo = (int) Math.ceil(totalCount / (double) listCnt);
		}

		// 이전 화살표
		boolean prev = false;
		if (startPageBtnNo != 1) {
			prev = true;
		}

		// 맵으로 만들기
		Map<String, Object> pMap = new HashMap<String, Object>();

		pMap.put("prev", prev);
		pMap.put("startPageBtnNo", startPageBtnNo);
		pMap.put("endPageBtnNo", endPageBtnNo);
		pMap.put("next", next);
		pMap.put("keyword", keyword);
		pMap.put("bList", bList);

		return pMap;
	}

	/* 조회수 증가 서비스 */
	public void hitCount(int boardNo) {
		System.out.println("BoardController.hitCount()");
		boardDao.hitAddCount(boardNo);
	}

	/* 글 읽기 서비스 */
	public BoardVo read(int boardNo) {
		System.out.println("BoardService.read()");
		return boardDao.selectOne(boardNo);
	}

	// 마이페이지 내가 쓴 글 리스트 목록
	public List<BoardVo> myBoardList(int userNo) {
		List<BoardVo> vo = new ArrayList<BoardVo>();
		vo = boardDao.myBoardList(userNo);

		return vo;
	}
	
	/* 모집 완료된 게시글인지 체크 */
	public BoardVo checkBStatus(int boardNo) {
		System.out.println("BoardService.checkStatus()");
		BoardVo result = boardDao.checkBStatus(boardNo);
		
		return result;
	}
	
	/* 게시글 모집 확정 기능 */
	public void confirmation(int boardNo) {
		System.out.println("BoardService.confirmation()");
		/* 확정으로 게시판 상태 변경 */
		boardDao.confirmed(boardNo);
		/* 승인된 이외의 데이터 삭제 */
		attendUsersDao.delete(boardNo);
	}
	
	/* 게시글 삭제 */
	public void dismiss(int boardNo) {
		System.out.println("BoardService.dismiss()");
		boardDao.delete(boardNo);
	}
}
