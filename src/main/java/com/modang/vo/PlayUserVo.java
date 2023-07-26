package com.modang.vo;

public class PlayUserVo {
	
	private int playNo;
	private int userNo;
	private String nick;
	private int gameNo;
	private String playTime; 
	private int number;
	private int currentAverage;
	private int activeAverage;
	private String endTime;
	private int orderNo;
	private TariffVo tariff;
	public PlayUserVo(int playNo, int userNo, String nick, int gameNo, String playTime, int number, int currentAverage,
			int activeAverage, String endTime, int orderNo, TariffVo tariff) {
		this.playNo = playNo;
		this.userNo = userNo;
		this.nick = nick;
		this.gameNo = gameNo;
		this.playTime = playTime;
		this.number = number;
		this.currentAverage = currentAverage;
		this.activeAverage = activeAverage;
		this.endTime = endTime;
		this.orderNo = orderNo;
		this.tariff = tariff;
	}
	public PlayUserVo() {
	}
	public int getPlayNo() {
		return playNo;
	}
	public void setPlayNo(int playNo) {
		this.playNo = playNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getGameNo() {
		return gameNo;
	}
	public void setGameNo(int gameNo) {
		this.gameNo = gameNo;
	}
	public String getPlayTime() {
		return playTime;
	}
	public void setPlayTime(String playTime) {
		this.playTime = playTime;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getCurrentAverage() {
		return currentAverage;
	}
	public void setCurrentAverage(int currentAverage) {
		this.currentAverage = currentAverage;
	}
	public int getActiveAverage() {
		return activeAverage;
	}
	public void setActiveAverage(int activeAverage) {
		this.activeAverage = activeAverage;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public TariffVo getTariff() {
		return tariff;
	}
	public void setTariff(TariffVo tariff) {
		this.tariff = tariff;
	}
	@Override
	public String toString() {
		return "PlayUserVo [playNo=" + playNo + ", userNo=" + userNo + ", nick=" + nick + ", gameNo=" + gameNo
				+ ", playTime=" + playTime + ", number=" + number + ", currentAverage=" + currentAverage
				+ ", activeAverage=" + activeAverage + ", endTime=" + endTime + ", orderNo=" + orderNo + ", tariff="
				+ tariff + "]";
	}	
	
	
	
	

}
