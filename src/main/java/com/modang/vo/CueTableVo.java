package com.modang.vo;

public class CueTableVo {
	
	private int tableNo;		//테이블넘버
	private int biliardNo;      //당구장넘버
	private String tableName;      //테이블이름(번호)
	private int tableType;      //테이블타입(0:대대/1:중대/2:포켓)
	private int status;    //테이블상태(0:대기/1:사용/2:일시정지)
	private TariffVo myTariff; // 테이블별 요금표
	
	public CueTableVo() {	
	}

	public CueTableVo(int tableNo, int biliardNo, String tableName, int tableType, int status, TariffVo myTariff) {
		this.tableNo = tableNo;
		this.biliardNo = biliardNo;
		this.tableName = tableName;
		this.tableType = tableType;
		this.status = status;
		this.myTariff = myTariff;
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

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public int getTableType() {
		return tableType;
	}

	public void setTableType(int tableType) {
		this.tableType = tableType;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public TariffVo getMyTariff() {
		return myTariff;
	}

	public void setMyTariff(TariffVo myTariff) {
		this.myTariff = myTariff;
	}

	@Override
	public String toString() {
		return "CueTableVo [tableNo=" + tableNo + ", biliardNo=" + biliardNo + ", tableName=" + tableName
				+ ", tableType=" + tableType + ", status=" + status + ", myTariff=" + myTariff + "]";
	}
	

}
