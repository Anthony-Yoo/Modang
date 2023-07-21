package com.modang.vo;

public class TableGamesVo {
	
	private int tableNo;		//테이블넘버
	private int biliardNo;      //당구장넘버
	private int tableName;      //테이블이름(번호)
	private int tableType;      //테이블타입(0:대대/1:중대/2:포켓)
	private int tableStatus;    //테이블상태(0:대기/1:사용/2:일시정지)
	
	private int gameNo;      	//게임넘버
	private int gameType;    	//게임타입(0:3구/1:4구/2:8볼/3:10볼)
	private int memberNum;   	//게임인원
	private String gameDate; 	//게임날짜
	private int gameTime;    	//게임시간
	private String startTime;	//시작시각
	private String endTime;  	//종료시각
	private int payStatus;   	//결제상태(0:미정산/1:정산)
	private int payType;     	//결제타입(0:카드/1:현금)
	private String payDate;  	//결제날짜
	private int income;      	//지불금액
	private int payMoney;    	//게임결제금액
    private String pauseStart;	//정지시작시각
    private String pauseEnd;    //정지종료시각
    private int pauseTime;      //정지누적시각
    private int setNo;          //고객그룹번호
    
	public TableGamesVo() {
		
	}

	public TableGamesVo(int tableNo, int gameNo, int gameType, int memberNum, String gameDate, int gameTime,
			String startTime, String endTime, int payStatus, int payType, String payDate, int income, int payMoney,
			String pauseStart, String pauseEnd, int pauseTime, int setNo) {
		this.tableNo = tableNo;
		this.gameNo = gameNo;
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
		this.pauseEnd = pauseEnd;
		this.pauseTime = pauseTime;
		this.setNo = setNo;
	}

	public TableGamesVo(int tableNo, int biliardNo, int tableName, int tableType, int tableStatus, int gameNo,
			int gameType, int memberNum, String gameDate, int gameTime, String startTime, String endTime, int payStatus,
			int payType, String payDate, int income, int payMoney, String pauseStart, String pauseEnd, int pauseTime,
			int setNo) {
		this.tableNo = tableNo;
		this.biliardNo = biliardNo;
		this.tableName = tableName;
		this.tableType = tableType;
		this.tableStatus = tableStatus;
		this.gameNo = gameNo;
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
		this.pauseEnd = pauseEnd;
		this.pauseTime = pauseTime;
		this.setNo = setNo;
	}

	public int getTableNo() {
		return tableNo;
	}

	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}

	public int getBiliardNo() {
		return biliardNo;
	}

	public void setBiliardNo(int biliardNo) {
		this.biliardNo = biliardNo;
	}

	public int getTableName() {
		return tableName;
	}

	public void setTableName(int tableName) {
		this.tableName = tableName;
	}

	public int getTableType() {
		return tableType;
	}

	public void setTableType(int tableType) {
		this.tableType = tableType;
	}

	public int getTableStatus() {
		return tableStatus;
	}

	public void setTableStatus(int tableStatus) {
		this.tableStatus = tableStatus;
	}

	public int getGameNo() {
		return gameNo;
	}

	public void setGameNo(int gameNo) {
		this.gameNo = gameNo;
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

	public String getPauseEnd() {
		return pauseEnd;
	}

	public void setPauseEnd(String pauseEnd) {
		this.pauseEnd = pauseEnd;
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

	@Override
	public String toString() {
		return "TableGamesVo [tableNo=" + tableNo + ", biliardNo=" + biliardNo + ", tableName=" + tableName
				+ ", tableType=" + tableType + ", tableStatus=" + tableStatus + ", gameNo=" + gameNo + ", gameType="
				+ gameType + ", memberNum=" + memberNum + ", gameDate=" + gameDate + ", gameTime=" + gameTime
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", payStatus=" + payStatus + ", payType="
				+ payType + ", payDate=" + payDate + ", income=" + income + ", payMoney=" + payMoney + ", pauseStart="
				+ pauseStart + ", pauseEnd=" + pauseEnd + ", pauseTime=" + pauseTime + ", setNo=" + setNo + "]";
	}

}
