package com.modang.vo;

import java.util.List;

public class CardUsersVo {
	
	private int cardNo;
	private int setUserNo;
	private String title;
	private String cardUserDate;
	private int gameType;
	private int average;	
	List<CardMemberVo> memberList;
	List<FavoriteUsersVo> favoriteList;
	public CardUsersVo(int cardNo, int setUserNo, String title, String cardUserDate, int gameType, int average,
			List<CardMemberVo> memberList, List<FavoriteUsersVo> favoriteList) {
		this.cardNo = cardNo;
		this.setUserNo = setUserNo;
		this.title = title;
		this.cardUserDate = cardUserDate;
		this.gameType = gameType;
		this.average = average;
		this.memberList = memberList;
		this.favoriteList = favoriteList;
	}
	public CardUsersVo() {
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	public int getSetUserNo() {
		return setUserNo;
	}
	public void setSetUserNo(int setUserNo) {
		this.setUserNo = setUserNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCardUserDate() {
		return cardUserDate;
	}
	public void setCardUserDate(String cardUserDate) {
		this.cardUserDate = cardUserDate;
	}
	public int getGameType() {
		return gameType;
	}
	public void setGameType(int gameType) {
		this.gameType = gameType;
	}
	public int getAverage() {
		return average;
	}
	public void setAverage(int average) {
		this.average = average;
	}
	public List<CardMemberVo> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<CardMemberVo> memberList) {
		this.memberList = memberList;
	}
	public List<FavoriteUsersVo> getFavoriteList() {
		return favoriteList;
	}
	public void setFavoriteList(List<FavoriteUsersVo> favoriteList) {
		this.favoriteList = favoriteList;
	}
	@Override
	public String toString() {
		return "CardUsersVo [cardNo=" + cardNo + ", setUserNo=" + setUserNo + ", title=" + title + ", cardUserDate="
				+ cardUserDate + ", gameType=" + gameType + ", average=" + average + ", memberList=" + memberList
				+ ", favoriteList=" + favoriteList + "]";
	}	

}
