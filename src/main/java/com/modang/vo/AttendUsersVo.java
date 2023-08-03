package com.modang.vo;

public class AttendUsersVo {

	private String buttonClass;
	private int rownum;
	private int attendNo;
	private int boardNo;
	private int userNo;
	private String attendDate;
	private int status;
	private String nick;
	private int average;
	
	public AttendUsersVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AttendUsersVo(String buttonClass, int rownum, int attendNo, int boardNo, int userNo, String attendDate,
			int status, String nick, int average) {
		super();
		this.buttonClass = buttonClass;
		this.rownum = rownum;
		this.attendNo = attendNo;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.attendDate = attendDate;
		this.status = status;
		this.nick = nick;
		this.average = average;
	}

	public String getButtonClass() {
		return buttonClass;
	}

	public void setButtonClass(String buttonClass) {
		this.buttonClass = buttonClass;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
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

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getAverage() {
		return average;
	}

	public void setAverage(int average) {
		this.average = average;
	}

	@Override
	public String toString() {
		return "AttendUsersVo [buttonClass=" + buttonClass + ", rownum=" + rownum + ", attendNo=" + attendNo
				+ ", boardNo=" + boardNo + ", userNo=" + userNo + ", attendDate=" + attendDate + ", status=" + status
				+ ", nick=" + nick + ", average=" + average + "]";
	}

}
