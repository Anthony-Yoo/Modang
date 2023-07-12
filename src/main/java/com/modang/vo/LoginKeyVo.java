package com.modang.vo;

public class LoginKeyVo {	
	private int loginKeyNo;
	private int keyOwner;
	private int keyNum;
	private String createDate;
	private int keyCount;
	public LoginKeyVo(int loginKeyNo, int keyOwner, int keyNum, String createDate, int keyCount) {
		this.loginKeyNo = loginKeyNo;
		this.keyOwner = keyOwner;
		this.keyNum = keyNum;
		this.createDate = createDate;
		this.keyCount = keyCount;
	}
	public LoginKeyVo() {
	}
	public int getLoginKeyNo() {
		return loginKeyNo;
	}
	public void setLoginKeyNo(int loginKeyNo) {
		this.loginKeyNo = loginKeyNo;
	}
	public int getKeyOwner() {
		return keyOwner;
	}
	public void setKeyOwner(int keyOwner) {
		this.keyOwner = keyOwner;
	}
	public int getKeyNum() {
		return keyNum;
	}
	public void setKeyNum(int keyNum) {
		this.keyNum = keyNum;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getKeyCount() {
		return keyCount;
	}
	public void setKeyCount(int keyCount) {
		this.keyCount = keyCount;
	}
	@Override
	public String toString() {
		return "LoginKeyVo [loginKeyNo=" + loginKeyNo + ", keyOwner=" + keyOwner + ", keyNum=" + keyNum
				+ ", createDate=" + createDate + ", keyCount=" + keyCount + "]";
	}
	
	

}
