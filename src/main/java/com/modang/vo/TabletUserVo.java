package com.modang.vo;

public class TabletUserVo {
	
	private int userNo;		
	private String id;		
	private String passwd;			
	private String nick;			
	private String cellphone;			
	private byte average;			
	private byte recommAverage;			
	private String recentLogonTime;		
	private String profileImage;			
	private int keyNum;		
	private String createDate;			
	private int keyCount;
	public TabletUserVo(int userNo, String id, String passwd, String nick, String cellphone, byte average,
			byte recommAverage, String recentLogonTime, String profileImage, int keyNum, String createDate,
			int keyCount) {
		this.userNo = userNo;
		this.id = id;
		this.passwd = passwd;
		this.nick = nick;
		this.cellphone = cellphone;
		this.average = average;
		this.recommAverage = recommAverage;
		this.recentLogonTime = recentLogonTime;
		this.profileImage = profileImage;
		this.keyNum = keyNum;
		this.createDate = createDate;
		this.keyCount = keyCount;
	}
	public TabletUserVo() {
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public byte getAverage() {
		return average;
	}
	public void setAverage(byte average) {
		this.average = average;
	}
	public byte getRecommAverage() {
		return recommAverage;
	}
	public void setRecommAverage(byte recommAverage) {
		this.recommAverage = recommAverage;
	}
	public String getRecentLogonTime() {
		return recentLogonTime;
	}
	public void setRecentLogonTime(String recentLogonTime) {
		this.recentLogonTime = recentLogonTime;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
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
		return "TabletUserVo [userNo=" + userNo + ", id=" + id + ", passwd=" + passwd + ", nick=" + nick
				+ ", cellphone=" + cellphone + ", average=" + average + ", recommAverage=" + recommAverage
				+ ", recentLogonTime=" + recentLogonTime + ", profileImage=" + profileImage + ", keyNum=" + keyNum
				+ ", createDate=" + createDate + ", keyCount=" + keyCount + "]";
	}
	
	

}
