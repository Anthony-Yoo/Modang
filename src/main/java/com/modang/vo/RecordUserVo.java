package com.modang.vo;

public class RecordUserVo {	

	
	private int recordNo;
	private int playNo;
	private int userNo;
	private int gameNo;
	private String nick;
	private int average;
	private int recommAverage;
	private int currentAverage;
	private int activeAverage;	
	private int upperHit;
	private String profileImage;
	private String biliardAddress;
	private String biliardName; 
	private int tableType;
	private int gameType;
	private int memberNum;
	private String gameDate;
	private String gameTime;
	private String  playTime;
	private int record;
	private int paymoney;	
	private int calGameTime;
	private String totalGameTime;	
	private double totalWinRate;
	private int totalCountGame;	
	private int totalCountWinGame;
	public RecordUserVo(int recordNo, int playNo, int userNo, int gameNo, String nick, int average, int recommAverage,
			int currentAverage, int activeAverage, int upperHit, String profileImage, String biliardAddress,
			String biliardName, int tableType, int gameType, int memberNum, String gameDate, String gameTime,
			String playTime, int record, int paymoney, int calGameTime, String totalGameTime, double totalWinRate,
			int totalCountGame, int totalCountWinGame) {
		this.recordNo = recordNo;
		this.playNo = playNo;
		this.userNo = userNo;
		this.gameNo = gameNo;
		this.nick = nick;
		this.average = average;
		this.recommAverage = recommAverage;
		this.currentAverage = currentAverage;
		this.activeAverage = activeAverage;
		this.upperHit = upperHit;
		this.profileImage = profileImage;
		this.biliardAddress = biliardAddress;
		this.biliardName = biliardName;
		this.tableType = tableType;
		this.gameType = gameType;
		this.memberNum = memberNum;
		this.gameDate = gameDate;
		this.gameTime = gameTime;
		this.playTime = playTime;
		this.record = record;
		this.paymoney = paymoney;
		this.calGameTime = calGameTime;
		this.totalGameTime = totalGameTime;
		this.totalWinRate = totalWinRate;
		this.totalCountGame = totalCountGame;
		this.totalCountWinGame = totalCountWinGame;
	}
	public RecordUserVo() {
	}
	public int getRecordNo() {
		return recordNo;
	}
	public void setRecordNo(int recordNo) {
		this.recordNo = recordNo;
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
	public int getGameNo() {
		return gameNo;
	}
	public void setGameNo(int gameNo) {
		this.gameNo = gameNo;
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
	public int getRecommAverage() {
		return recommAverage;
	}
	public void setRecommAverage(int recommAverage) {
		this.recommAverage = recommAverage;
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
	public int getUpperHit() {
		return upperHit;
	}
	public void setUpperHit(int upperHit) {
		this.upperHit = upperHit;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getBiliardAddress() {
		return biliardAddress;
	}
	public void setBiliardAddress(String biliardAddress) {
		this.biliardAddress = biliardAddress;
	}
	public String getBiliardName() {
		return biliardName;
	}
	public void setBiliardName(String biliardName) {
		this.biliardName = biliardName;
	}
	public int getTableType() {
		return tableType;
	}
	public void setTableType(int tableType) {
		this.tableType = tableType;
	}
	public int getGameType() {
		return gameType;
	}
	public void setGameType(int gameType) {
		this.gameType = gameType;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getGameDate() {
		return gameDate;
	}
	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}
	public String getGameTime() {
		return gameTime;
	}
	public void setGameTime(String gameTime) {
		this.gameTime = gameTime;
	}
	public String getPlayTime() {
		return playTime;
	}
	public void setPlayTime(String playTime) {
		this.playTime = playTime;
	}
	public int getRecord() {
		return record;
	}
	public void setRecord(int record) {
		this.record = record;
	}
	public int getPaymoney() {
		return paymoney;
	}
	public void setPaymoney(int paymoney) {
		this.paymoney = paymoney;
	}
	public int getCalGameTime() {
		return calGameTime;
	}
	public void setCalGameTime(int calGameTime) {
		this.calGameTime = calGameTime;
	}
	public String getTotalGameTime() {
		return totalGameTime;
	}
	public void setTotalGameTime(String totalGameTime) {
		this.totalGameTime = totalGameTime;
	}
	public double getTotalWinRate() {
		return totalWinRate;
	}
	public void setTotalWinRate(double totalWinRate) {
		this.totalWinRate = totalWinRate;
	}
	public int getTotalCountGame() {
		return totalCountGame;
	}
	public void setTotalCountGame(int totalCountGame) {
		this.totalCountGame = totalCountGame;
	}
	public int getTotalCountWinGame() {
		return totalCountWinGame;
	}
	public void setTotalCountWinGame(int totalCountWinGame) {
		this.totalCountWinGame = totalCountWinGame;
	}
	@Override
	public String toString() {
		return "RecordUserVo [recordNo=" + recordNo + ", playNo=" + playNo + ", userNo=" + userNo + ", gameNo=" + gameNo
				+ ", nick=" + nick + ", average=" + average + ", recommAverage=" + recommAverage + ", currentAverage="
				+ currentAverage + ", activeAverage=" + activeAverage + ", upperHit=" + upperHit + ", profileImage="
				+ profileImage + ", biliardAddress=" + biliardAddress + ", biliardName=" + biliardName + ", tableType="
				+ tableType + ", gameType=" + gameType + ", memberNum=" + memberNum + ", gameDate=" + gameDate
				+ ", gameTime=" + gameTime + ", playTime=" + playTime + ", record=" + record + ", paymoney=" + paymoney
				+ ", calGameTime=" + calGameTime + ", totalGameTime=" + totalGameTime + ", totalWinRate=" + totalWinRate
				+ ", totalCountGame=" + totalCountGame + ", totalCountWinGame=" + totalCountWinGame + "]";
	}
	
}
