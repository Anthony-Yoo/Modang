package com.modang.vo;

public class CardMemberVo {
	
	private int memberNo;
	private int getUserNo;
	private int cardNo;
	private String guestNick;
	private int average;
	public CardMemberVo(int memberNo, int getUserNo, int cardNo, String guestNick, int average) {
		this.memberNo = memberNo;
		this.getUserNo = getUserNo;
		this.cardNo = cardNo;
		this.guestNick = guestNick;
		this.average = average;
	}
	public CardMemberVo() {
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getGetUserNo() {
		return getUserNo;
	}
	public void setGetUserNo(int getUserNo) {
		this.getUserNo = getUserNo;
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	public String getGuestNick() {
		return guestNick;
	}
	public void setGuestNick(String guestNick) {
		this.guestNick = guestNick;
	}
	public int getAverage() {
		return average;
	}
	public void setAverage(int average) {
		this.average = average;
	}
	@Override
	public String toString() {
		return "CardMemberVo [memberNo=" + memberNo + ", getUserNo=" + getUserNo + ", cardNo=" + cardNo + ", guestNick="
				+ guestNick + ", average=" + average + "]";
	}
	
		
	

}
