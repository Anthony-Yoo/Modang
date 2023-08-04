package com.modang.vo;

public class CurrentRecordVo {
	
	private int userNo;
	private double recentWinRate; 		// 최근10게임 승률
	private int recentHit;        		// 최근10게임 평균타수	
	private int recentTimeAv;			// 최근10게임 평균시간
	private int totalCountGame;			// 누적 게임수
	private int totalCountWinGame;		// 누적 승리게임수	
	private int totalCountLoseGame;		// 누적 패배게임수
	private double totalWinRate;		// 누적 승률
	private int totalGameTime;			// 누적 게임시간
	private int totalCountNormGame;			// 누적 본인다마 전체게임수	
	private int totalCountWinNormGame;			// 누적 본인다마 승리게임수	
	private int totalCountLoseNormGame;		// 누적 본인다마 패배게임수
	private double totalNormRate; 			// 본인 다마 안물린비율
	private int totalNormRatePercent;		// 누적 본인다마 안물린승률 100분위
	private int recommStatus;				// 권장다마 상태
	public CurrentRecordVo(int userNo, double recentWinRate, int recentHit, int recentTimeAv, int totalCountGame,
			int totalCountWinGame, int totalCountLoseGame, double totalWinRate, int totalGameTime,
			int totalCountNormGame, int totalCountWinNormGame, int totalCountLoseNormGame, double totalNormRate,
			int totalNormRatePercent, int recommStatus) {
		this.userNo = userNo;
		this.recentWinRate = recentWinRate;
		this.recentHit = recentHit;
		this.recentTimeAv = recentTimeAv;
		this.totalCountGame = totalCountGame;
		this.totalCountWinGame = totalCountWinGame;
		this.totalCountLoseGame = totalCountLoseGame;
		this.totalWinRate = totalWinRate;
		this.totalGameTime = totalGameTime;
		this.totalCountNormGame = totalCountNormGame;
		this.totalCountWinNormGame = totalCountWinNormGame;
		this.totalCountLoseNormGame = totalCountLoseNormGame;
		this.totalNormRate = totalNormRate;
		this.totalNormRatePercent = totalNormRatePercent;
		this.recommStatus = recommStatus;
	}
	public CurrentRecordVo() {
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public double getRecentWinRate() {
		return recentWinRate;
	}
	public void setRecentWinRate(double recentWinRate) {
		this.recentWinRate = recentWinRate;
	}
	public int getRecentHit() {
		return recentHit;
	}
	public void setRecentHit(int recentHit) {
		this.recentHit = recentHit;
	}
	public int getRecentTimeAv() {
		return recentTimeAv;
	}
	public void setRecentTimeAv(int recentTimeAv) {
		this.recentTimeAv = recentTimeAv;
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
	public double getTotalWinRate() {
		return totalWinRate;
	}
	public void setTotalWinRate(double totalWinRate) {
		this.totalWinRate = totalWinRate;
	}
	public int getTotalGameTime() {
		return totalGameTime;
	}
	public void setTotalGameTime(int totalGameTime) {
		this.totalGameTime = totalGameTime;
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
	@Override
	public String toString() {
		return "CurrentRecordVo [userNo=" + userNo + ", recentWinRate=" + recentWinRate + ", recentHit=" + recentHit
				+ ", recentTimeAv=" + recentTimeAv + ", totalCountGame=" + totalCountGame + ", totalCountWinGame="
				+ totalCountWinGame + ", totalCountLoseGame=" + totalCountLoseGame + ", totalWinRate=" + totalWinRate
				+ ", totalGameTime=" + totalGameTime + ", totalCountNormGame=" + totalCountNormGame
				+ ", totalCountWinNormGame=" + totalCountWinNormGame + ", totalCountLoseNormGame="
				+ totalCountLoseNormGame + ", totalNormRate=" + totalNormRate + ", totalNormRatePercent="
				+ totalNormRatePercent + ", recommStatus=" + recommStatus + "]";
	}
	
	
}
