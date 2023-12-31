package com.modang.vo;

public class PlayUserVo {

	private int playNo;
	private int userNo;
	private String nick;
	private int gameNo;
	private int playTime; 
	private int record;
	private String comRecord;
	private int currentAverage;
	private int activeAverage;
	private String endTime;
	private int orderNo;
	private TariffVo tariff;  // 요금표
	private String proFileImage;
	public PlayUserVo(int playNo, int userNo, String nick, int gameNo, int playTime, int record, String comRecord,
			int currentAverage, int activeAverage, String endTime, int orderNo, TariffVo tariff, String proFileImage) {
		this.playNo = playNo;
		this.userNo = userNo;
		this.nick = nick;
		this.gameNo = gameNo;
		this.playTime = playTime;
		this.record = record;
		this.comRecord = comRecord;
		this.currentAverage = currentAverage;
		this.activeAverage = activeAverage;
		this.endTime = endTime;
		this.orderNo = orderNo;
		this.tariff = tariff;
		this.proFileImage = proFileImage;
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
	public int getPlayTime() {
		return playTime;
	}
	public void setPlayTime(int playTime) {
		this.playTime = playTime;
	}
	public int getRecord() {
		return record;
	}
	public void setRecord(int record) {
		this.record = record;
	}
	public String getComRecord() {
		return comRecord;
	}
	public void setComRecord(String comRecord) {
		this.comRecord = comRecord;
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
	public String getProFileImage() {
		return proFileImage;
	}
	public void setProFileImage(String proFileImage) {
		this.proFileImage = proFileImage;
	}
	@Override
	public String toString() {
		return "PlayUserVo [playNo=" + playNo + ", userNo=" + userNo + ", nick=" + nick + ", gameNo=" + gameNo
				+ ", playTime=" + playTime + ", record=" + record + ", comRecord=" + comRecord + ", currentAverage="
				+ currentAverage + ", activeAverage=" + activeAverage + ", endTime=" + endTime + ", orderNo=" + orderNo
				+ ", tariff=" + tariff + ", proFileImage=" + proFileImage + "]";
	}
	
	
}
