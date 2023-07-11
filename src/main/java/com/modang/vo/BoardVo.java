package com.modang.vo;

public class BoardVo {

	private int boardNo;		/* 게시판 글 번호 */
	private int userNo;			/* 유저 번호 */
	private String title;		/* 게시글 제목 */
	private byte matchGameType;	/* 게임 종류 */
	private String matchRegion;	/* 매칭 지역 */
	private int membernum;		/* 게임 인원 */
	private String matchDate;	/* 매칭 날짜 */
	private String content;		/* 게시판 글 */
	private String boardDate;	/* 게시판 작성일 */
	private int count; 			/* 조회수 */
	private byte status; 		/* 신청 상태 0: 신청중, 1: 모집완료 */
	
	public BoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVo(int boardNo, int userNo, String title, byte matchGameType, String matchRegion, int membernum,
			String matchDate, String content, String boardDate, int count, byte status) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.title = title;
		this.matchGameType = matchGameType;
		this.matchRegion = matchRegion;
		this.membernum = membernum;
		this.matchDate = matchDate;
		this.content = content;
		this.boardDate = boardDate;
		this.count = count;
		this.status = status;
	}




	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public byte getMatchGameType() {
		return matchGameType;
	}

	public void setMatchGameType(byte matchGameType) {
		this.matchGameType = matchGameType;
	}

	public String getMatchRegion() {
		return matchRegion;
	}

	public void setMatchRegion(String matchRegion) {
		this.matchRegion = matchRegion;
	}

	public int getMembernum() {
		return membernum;
	}

	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}

	public String getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(String matchDate) {
		this.matchDate = matchDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public byte getStatus() {
		return status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "BoardVo [boardNo=" + boardNo + ", userNo=" + userNo + ", title=" + title + ", matchGameType="
				+ matchGameType + ", matchRegion=" + matchRegion + ", membernum=" + membernum + ", matchDate="
				+ matchDate + ", content=" + content + ", boardDate=" + boardDate + ", count=" + count + ", status="
				+ status + "]";
	}
	
}
