package com.modang.vo;

public class AttendUsersVo {

	private int attendNo;
	private int boardNo;
	private int userNo;
	private String attendDate;
	private int status;
	
	
	public AttendUsersVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public AttendUsersVo(int boardNo, int userNo) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
	}


	public AttendUsersVo(int attendNo, int boardNo, int userNo, String attendDate, int status) {
		super();
		this.attendNo = attendNo;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.attendDate = attendDate;
		this.status = status;
	}


	public int getAttendNo() {
		return attendNo;
	}


	public void setAttendNo(int attendNo) {
		this.attendNo = attendNo;
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


	public String getAttendDate() {
		return attendDate;
	}


	public void setAttendDate(String attendDate) {
		this.attendDate = attendDate;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}
	
	
	@Override
	public String toString() {
		return "AttendUserVo [attendNo=" + attendNo + ", boardNo=" + boardNo + ", userNo=" + userNo + ", attendDate="
				+ attendDate + ", status=" + status + "]";
	}
	
}
