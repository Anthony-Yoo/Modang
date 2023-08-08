package com.modang.vo;

public class FavoriteUsersVo {
	
	private int favoriteNo;
	private int setUserNo;
	private int getUserNo;
	private String favoriteUserDate;
	private String nick;
	private int average;
	private String profileImage;
	public FavoriteUsersVo(int favoriteNo, int setUserNo, int getUserNo, String favoriteUserDate, String nick,
			int average, String profileImage) {
		this.favoriteNo = favoriteNo;
		this.setUserNo = setUserNo;
		this.getUserNo = getUserNo;
		this.favoriteUserDate = favoriteUserDate;
		this.nick = nick;
		this.average = average;
		this.profileImage = profileImage;
	}
	public FavoriteUsersVo() {
	}
	public int getFavoriteNo() {
		return favoriteNo;
	}
	public void setFavoriteNo(int favoriteNo) {
		this.favoriteNo = favoriteNo;
	}
	public int getSetUserNo() {
		return setUserNo;
	}
	public void setSetUserNo(int setUserNo) {
		this.setUserNo = setUserNo;
	}
	public int getGetUserNo() {
		return getUserNo;
	}
	public void setGetUserNo(int getUserNo) {
		this.getUserNo = getUserNo;
	}
	public String getFavoriteUserDate() {
		return favoriteUserDate;
	}
	public void setFavoriteUserDate(String favoriteUserDate) {
		this.favoriteUserDate = favoriteUserDate;
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
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	@Override
	public String toString() {
		return "FavoriteUsersVo [favoriteNo=" + favoriteNo + ", setUserNo=" + setUserNo + ", getUserNo=" + getUserNo
				+ ", favoriteUserDate=" + favoriteUserDate + ", nick=" + nick + ", average=" + average
				+ ", profileImage=" + profileImage + "]";
	}
	

}
