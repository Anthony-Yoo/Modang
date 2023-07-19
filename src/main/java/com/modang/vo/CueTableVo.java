package com.modang.vo;

public class CueTableVo {
	
	private int tableNo;		//테이블넘버
	private int biliardNo;      //당구장넘버
	private int tableName;      //테이블이름(번호)
	private int tableType;      //테이블타입(0:대대/1:중대/2:포켓)
	private int tableStatus;    //테이블상태(0:대기/1:사용/2:일시정지)
	
	public CueTableVo() {
		
	}

	public CueTableVo(int tableNo, int biliardNo, int tableName, int tableType, int tableStatus) {
		this.tableNo = tableNo;
		this.biliardNo = biliardNo;
		this.tableName = tableName;
		this.tableType = tableType;
		this.tableStatus = tableStatus;
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

	@Override
	public String toString() {
		return "CueTableVo [tableNo=" + tableNo + ", biliardNo=" + biliardNo + ", tableName=" + tableName
				+ ", tableType=" + tableType + ", tableStatus=" + tableStatus + "]";
	}
	
	
	

}