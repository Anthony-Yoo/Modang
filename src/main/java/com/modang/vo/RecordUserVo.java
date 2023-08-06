package com.modang.vo;

public class RecordUserVo {	
	
	private int recordNo;
	private int playNo;
	private int userNo;				//최근 3경기 함께한 유져번호,나의 유져번호
	private int gameNo;				
	private String nick;			//최근 3경기 함께한 유져 닉,나의 닉네임
	private String recentLogonTime; // 나의 최근 로그인 정보
	private int average;			//나의 기본다마
	private int recommAverage;
	private int currentAverage;
	private int activeAverage;	
	private int hitMarker;
	private String profileImage;	//나의 프로필이미지
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
	private double totalWinRate;            // 전체 누적 (본인다마+정상게임) 승률
	private double totalCommRate;			// 누적 안물린 비율(new)(본인다마 +정상게임) 
	private int totalCountGame;				// 전체 누적 (본인다마+정상게임) 게임수
	private int totalCountWinGame;			// 전체 누적 (본인다마+정상게임) 승리게임수	
	private int totalCountLoseGame;			// 전체 누적 (본인다마+정상게임) 패배게임수	
	private int totalCountNormGame;			
	private int totalCountWinNormGame;		
	private int totalCountLoseNormGame;	
	private double totalNormRate; 		
	private int totalNormRatePercent;	
	private int recommStatus;				// 권장다마 상태
	private String totalPlayTime;			// 전체 누적(본인다마 관계없음 / 나가리게임포함) 플레이시간
	public RecordUserVo(int recordNo, int playNo, int userNo, int gameNo, String nick, String recentLogonTime,
			int average, int recommAverage, int currentAverage, int activeAverage, int hitMarker, String profileImage,
			String biliardAddress, String biliardName, int tableType, int gameType, int memberNum, String gameDate,
			String gameTime, String playTime, int record, int paymoney, int calGameTime, String totalGameTime,
			double totalWinRate, double totalCommRate, int totalCountGame, int totalCountWinGame,
			int totalCountLoseGame, int totalCountNormGame, int totalCountWinNormGame, int totalCountLoseNormGame,
			double totalNormRate, int totalNormRatePercent, int recommStatus, String totalPlayTime) {
		this.recordNo = recordNo;
		this.playNo = playNo;
		this.userNo = userNo;
		this.gameNo = gameNo;
		this.nick = nick;
		this.recentLogonTime = recentLogonTime;
		this.average = average;
		this.recommAverage = recommAverage;
		this.currentAverage = currentAverage;
		this.activeAverage = activeAverage;
		this.hitMarker = hitMarker;
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
		this.totalCommRate = totalCommRate;
		this.totalCountGame = totalCountGame;
		this.totalCountWinGame = totalCountWinGame;
		this.totalCountLoseGame = totalCountLoseGame;
		this.totalCountNormGame = totalCountNormGame;
		this.totalCountWinNormGame = totalCountWinNormGame;
		this.totalCountLoseNormGame = totalCountLoseNormGame;
		this.totalNormRate = totalNormRate;
		this.totalNormRatePercent = totalNormRatePercent;
		this.recommStatus = recommStatus;
		this.totalPlayTime = totalPlayTime;
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
	public String getRecentLogonTime() {
		return recentLogonTime;
	}
	public void setRecentLogonTime(String recentLogonTime) {
		this.recentLogonTime = recentLogonTime;
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
	public int getHitMarker() {
		return hitMarker;
	}
	public void setHitMarker(int hitMarker) {
		this.hitMarker = hitMarker;
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
	public double getTotalCommRate() {
		return totalCommRate;
	}
	public void setTotalCommRate(double totalCommRate) {
		this.totalCommRate = totalCommRate;
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
	public int getTotalCountLoseGame() {
		return totalCountLoseGame;
	}
	public void setTotalCountLoseGame(int totalCountLoseGame) {
		this.totalCountLoseGame = totalCountLoseGame;
	}
	public int getTotalCountNormGame() {
		return totalCountNormGame;
	}
	public void setTotalCountNormGame(int totalCountNormGame) {
		this.totalCountNormGame = totalCountNormGame;
	}
	public int getTotalCountWinNormGame() {
		return totalCountWinNormGame;
	}
	public void setTotalCountWinNormGame(int totalCountWinNormGame) {
		this.totalCountWinNormGame = totalCountWinNormGame;
	}
	public int getTotalCountLoseNormGame() {
		return totalCountLoseNormGame;
	}
	public void setTotalCountLoseNormGame(int totalCountLoseNormGame) {
		this.totalCountLoseNormGame = totalCountLoseNormGame;
	}
	public double getTotalNormRate() {
		return totalNormRate;
	}
	public void setTotalNormRate(double totalNormRate) {
		this.totalNormRate = totalNormRate;
	}
	public int getTotalNormRatePercent() {
		return totalNormRatePercent;
	}
	public void setTotalNormRatePercent(int totalNormRatePercent) {
		this.totalNormRatePercent = totalNormRatePercent;
	}
	public int getRecommStatus() {
		return recommStatus;
	}
	public void setRecommStatus(int recommStatus) {
		this.recommStatus = recommStatus;
	}
	public String getTotalPlayTime() {
		return totalPlayTime;
	}
	public void setTotalPlayTime(String totalPlayTime) {
		this.totalPlayTime = totalPlayTime;
	}
	@Override
	public String toString() {
		return "RecordUserVo [recordNo=" + recordNo + ", playNo=" + playNo + ", userNo=" + userNo + ", gameNo=" + gameNo
				+ ", nick=" + nick + ", recentLogonTime=" + recentLogonTime + ", average=" + average
				+ ", recommAverage=" + recommAverage + ", currentAverage=" + currentAverage + ", activeAverage="
				+ activeAverage + ", hitMarker=" + hitMarker + ", profileImage=" + profileImage + ", biliardAddress="
				+ biliardAddress + ", biliardName=" + biliardName + ", tableType=" + tableType + ", gameType="
				+ gameType + ", memberNum=" + memberNum + ", gameDate=" + gameDate + ", gameTime=" + gameTime
				+ ", playTime=" + playTime + ", record=" + record + ", paymoney=" + paymoney + ", calGameTime="
				+ calGameTime + ", totalGameTime=" + totalGameTime + ", totalWinRate=" + totalWinRate
				+ ", totalCommRate=" + totalCommRate + ", totalCountGame=" + totalCountGame + ", totalCountWinGame="
				+ totalCountWinGame + ", totalCountLoseGame=" + totalCountLoseGame + ", totalCountNormGame="
				+ totalCountNormGame + ", totalCountWinNormGame=" + totalCountWinNormGame + ", totalCountLoseNormGame="
				+ totalCountLoseNormGame + ", totalNormRate=" + totalNormRate + ", totalNormRatePercent="
				+ totalNormRatePercent + ", recommStatus=" + recommStatus + ", totalPlayTime=" + totalPlayTime + "]";
	}
	

}

