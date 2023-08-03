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
	public CurrentRecordVo(int userNo, double recentWinRate, int recentHit, int recentTimeAv, int totalCountGame,
			int totalCountWinGame, int totalCountLoseGame, double totalWinRate, int totalGameTime) {
		this.userNo = userNo;
		this.recentWinRate = recentWinRate;
		this.recentHit = recentHit;
		this.recentTimeAv = recentTimeAv;
		this.totalCountGame = totalCountGame;
		this.totalCountWinGame = totalCountWinGame;
		this.totalCountLoseGame = totalCountLoseGame;
		this.totalWinRate = totalWinRate;
		this.totalGameTime = totalGameTime;
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
	@Override
	public String toString() {
		return "CurrentRecordVo [userNo=" + userNo + ", recentWinRate=" + recentWinRate + ", recentHit=" + recentHit
				+ ", recentTimeAv=" + recentTimeAv + ", totalCountGame=" + totalCountGame + ", totalCountWinGame="
				+ totalCountWinGame + ", totalCountLoseGame=" + totalCountLoseGame + ", totalWinRate=" + totalWinRate
				+ ", totalGameTime=" + totalGameTime + "]";
	}
	

}
