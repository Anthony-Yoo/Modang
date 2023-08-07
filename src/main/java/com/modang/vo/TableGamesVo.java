package com.modang.vo;

import java.util.List;

public class TableGamesVo {
	private int gameNo; // 게임넘버
	private int tableNo; // 테이블넘버
	private int gameType; // 게임타입(0:3구/1:4구/2:8볼/3:10볼)
	private int memberNum; // 게임인원
	private String gameDate; // 게임날짜
	private int gameTime; // 게임시간
	private String startTime; // 시작시각
	private String endTime; // 종료시각
	private int payStatus; // 결제상태(0:미정산/1:정산)
	private int payType; // 결제타입(0:카드/1:현금)
	private String payDate; // 결제날짜
	private int income; // 지불금액
	private int payMoney; // 게임결제금액
	private String pauseStart; // 정지시작시각
	private String pauseStop; // 정지종료시각
	private int pauseTime; // 정지누적시각
	private int setNo; // 고객그룹번호
	private int gameStatus;
	private List<PlayUserVo> playUserList; // 플레이 유져리스트
	private List<RecordUserVo> recordUserList; // 전적 유져리스트
	private CueTableVo tableInfo;
	private int tableFee;
	private int minFee;
	private int secondsToTime;
	private int rownum; //순서
	private String minDate; //검색최소날짜
	private String maxDate; //검색최대날짜
	private String tableName;//테이블네임
	private int biliardNo; //당구장번호
	private String comPayMoney; //결제금액 천단위표기형
	private String comIncome;   //입금금액 천단위 표기형
	
	public TableGamesVo() {
		
	}

	public TableGamesVo(int gameNo, int tableNo, int gameType, int memberNum, String gameDate, int gameTime,
			String startTime, String endTime, int payStatus, int payType, String payDate, int income, int payMoney,
			String pauseStart, String pauseStop, int pauseTime, int setNo, int gameStatus,
			List<PlayUserVo> playUserList, List<RecordUserVo> recordUserList, CueTableVo tableInfo, int tableFee,
			int minFee, int secondsToTime, int rownum, String minDate, String maxDate, String tableName,
			int biliardNo, String comPayMoney, String comIncome) {
		super();
		this.gameNo = gameNo;
		this.tableNo = tableNo;
		this.gameType = gameType;
		this.memberNum = memberNum;
		this.gameDate = gameDate;
		this.gameTime = gameTime;
		this.startTime = startTime;
		this.endTime = endTime;
		this.payStatus = payStatus;
		this.payType = payType;
		this.payDate = payDate;
		this.income = income;
		this.payMoney = payMoney;
		this.pauseStart = pauseStart;
		this.pauseStop = pauseStop;
		this.pauseTime = pauseTime;
		this.setNo = setNo;
		this.gameStatus = gameStatus;
		this.playUserList = playUserList;
		this.recordUserList = recordUserList;
		this.tableInfo = tableInfo;
		this.tableFee = tableFee;
		this.minFee = minFee;
		this.secondsToTime = secondsToTime;
		this.rownum = rownum;
		this.minDate = minDate;
		this.maxDate = maxDate;
		this.tableName = tableName;
		this.biliardNo = biliardNo;
		this.comPayMoney = comPayMoney;
		this.comIncome = comIncome;
	}


	public int getGameNo() {
		return gameNo;
	}

	public void setGameNo(int gameNo) {
		this.gameNo = gameNo;
	}

	public int getTableNo() {
		return tableNo;
	}

	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
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

	public int getGameTime() {
		return gameTime;
	}

	public void setGameTime(int gameTime) {
		this.gameTime = gameTime;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(int payStatus) {
		this.payStatus = payStatus;
	}

	public int getPayType() {
		return payType;
	}

	public void setPayType(int payType) {
		this.payType = payType;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public int getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}

	public String getPauseStart() {
		return pauseStart;
	}

	public void setPauseStart(String pauseStart) {
		this.pauseStart = pauseStart;
	}

	public String getPauseStop() {
		return pauseStop;
	}

	public void setPauseStop(String pauseStop) {
		this.pauseStop = pauseStop;
	}

	public int getPauseTime() {
		return pauseTime;
	}

	public void setPauseTime(int pauseTime) {
		this.pauseTime = pauseTime;
	}

	public int getSetNo() {
		return setNo;
	}

	public void setSetNo(int setNo) {
		this.setNo = setNo;
	}

	public int getGameStatus() {
		return gameStatus;
	}

	public void setGameStatus(int gameStatus) {
		this.gameStatus = gameStatus;
	}

	public List<PlayUserVo> getPlayUserList() {
		return playUserList;
	}

	public void setPlayUserList(List<PlayUserVo> playUserList) {
		this.playUserList = playUserList;
	}

	public List<RecordUserVo> getRecordUserList() {
		return recordUserList;
	}

	public void setRecordUserList(List<RecordUserVo> recordUserList) {
		this.recordUserList = recordUserList;
	}

	public CueTableVo getTableInfo() {
		return tableInfo;
	}

	public void setTableInfo(CueTableVo tableInfo) {
		this.tableInfo = tableInfo;
	}

	public int getTableFee() {
		return tableFee;
	}

	public void setTableFee(int tableFee) {
		this.tableFee = tableFee;
	}

	public int getMinFee() {
		return minFee;
	}

	public void setMinFee(int minFee) {
		this.minFee = minFee;
	}

	public int getSecondsToTime() {
		return secondsToTime;
	}

	public void setSecondsToTime(int secondsToTime) {
		this.secondsToTime = secondsToTime;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public String getMinDate() {
		return minDate;
	}

	public void setMinDate(String minDate) {
		this.minDate = minDate;
	}

	public String getMaxDate() {
		return maxDate;
	}

	public void setMaxDate(String maxDate) {
		this.maxDate = maxDate;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	public int getBiliardNo() {
		return biliardNo;
	}

	public void setBiliardNo(int biliardNo) {
		this.biliardNo = biliardNo;
	}

	public String getComPayMoney() {
		return comPayMoney;
	}

	public void setComPayMoney(String comPayMoney) {
		this.comPayMoney = comPayMoney;
	}

	public String getComIncome() {
		return comIncome;
	}

	public void setComIncome(String comIncome) {
		this.comIncome = comIncome;
	}

	@Override
	public String toString() {
		return "TableGamesVo [gameNo=" + gameNo + ", tableNo=" + tableNo + ", gameType=" + gameType + ", memberNum="
				+ memberNum + ", gameDate=" + gameDate + ", gameTime=" + gameTime + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", payStatus=" + payStatus + ", payType=" + payType + ", payDate=" + payDate
				+ ", income=" + income + ", payMoney=" + payMoney + ", pauseStart=" + pauseStart + ", pauseStop="
				+ pauseStop + ", pauseTime=" + pauseTime + ", setNo=" + setNo + ", gameStatus=" + gameStatus
				+ ", playUserList=" + playUserList + ", recordUserList=" + recordUserList + ", tableInfo=" + tableInfo
				+ ", tableFee=" + tableFee + ", minFee=" + minFee + ", secondsToTime=" + secondsToTime + ", rownum="
				+ rownum + ", minDate=" + minDate + ", maxDate=" + maxDate + ", tableName=" + tableName + ", biliardNo="
				+ biliardNo + ", comPayMoney=" + comPayMoney + ", comIncome=" + comIncome + "]";
	}

}