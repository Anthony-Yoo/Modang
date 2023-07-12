package com.modang.vo;

import java.sql.Date;

public class ManagerVo {
	private int billardNo;
	private String id;
	private String passwd;
	private String companyNo;
	private String repName;
	private String billardName;
	private String billardAddress;
	private String latitude;
	private String longtitude;
	private String billardPhone;
	private Date time1;
	private Date time2;
	private String parking;
	private String bdComment;
	
	public ManagerVo(int billardNo, String id, String passwd, String companyNo, String repName, String billardName,
			String billardAddress, String latitude, String longtitude, String billardPhone, Date time1, Date time2,
			String parking, String bdComment) {
		super();
		this.billardNo = billardNo;
		this.id = id;
		this.passwd = passwd;
		this.companyNo = companyNo;
		this.repName = repName;
		this.billardName = billardName;
		this.billardAddress = billardAddress;
		this.latitude = latitude;
		this.longtitude = longtitude;
		this.billardPhone = billardPhone;
		this.time1 = time1;
		this.time2 = time2;
		this.parking = parking;
		this.bdComment = bdComment;
	}

	public ManagerVo() {
		super();
	}

	public int getBillardNo() {
		return billardNo;
	}

	public void setBillardNo(int billardNo) {
		this.billardNo = billardNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(String companyNo) {
		this.companyNo = companyNo;
	}

	public String getRepName() {
		return repName;
	}

	public void setRepName(String repName) {
		this.repName = repName;
	}

	public String getBillardName() {
		return billardName;
	}

	public void setBillardName(String billardName) {
		this.billardName = billardName;
	}

	public String getBillardAddress() {
		return billardAddress;
	}

	public void setBillardAddress(String billardAddress) {
		this.billardAddress = billardAddress;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
	}

	public String getBillardPhone() {
		return billardPhone;
	}

	public void setBillardPhone(String billardPhone) {
		this.billardPhone = billardPhone;
	}

	public Date getTime1() {
		return time1;
	}

	public void setTime1(Date time1) {
		this.time1 = time1;
	}

	public Date getTime2() {
		return time2;
	}

	public void setTime2(Date time2) {
		this.time2 = time2;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getBdComment() {
		return bdComment;
	}

	public void setBdComment(String bdComment) {
		this.bdComment = bdComment;
	}

	@Override
	public String toString() {
		return "ManagerVo [billardNo=" + billardNo + ", id=" + id + ", passwd=" + passwd + ", companyNo=" + companyNo
				+ ", repName=" + repName + ", billardName=" + billardName + ", billardAddress=" + billardAddress
				+ ", latitude=" + latitude + ", longtitude=" + longtitude + ", billardPhone=" + billardPhone
				+ ", time1=" + time1 + ", time2=" + time2 + ", parking=" + parking + ", bdComment=" + bdComment + "]";
	}
	
	


}
