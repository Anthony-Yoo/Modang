package com.modang.vo;

public class UserVo {
	
	private int userno;
	private String id;
	private String passwd;
	private String nick;
	private String cellphone;
	private int average;
	private int recommaverage;
	private String recentlogontime;
	private long profileimage;
	private int keynum;
	private String createdate;
	private int keycount;
	public UserVo() {
		super();
	}
	public UserVo(int userno, String id, String passwd, String nick, String cellphone, int average, int recommaverage,
			String recentlogontime, long profileimage, int keynum, String createdate, int keycount) {
		super();
		this.userno = userno;
		this.id = id;
		this.passwd = passwd;
		this.nick = nick;
		this.cellphone = cellphone;
		this.average = average;
		this.recommaverage = recommaverage;
		this.recentlogontime = recentlogontime;
		this.profileimage = profileimage;
		this.keynum = keynum;
		this.createdate = createdate;
		this.keycount = keycount;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
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
	public int getAverage() {
		return average;
	}
	public void setAverage(int average) {
		this.average = average;
	}
	public int getRecommaverage() {
		return recommaverage;
	}
	public void setRecommaverage(int recommaverage) {
		this.recommaverage = recommaverage;
	}
	public String getRecentlogontime() {
		return recentlogontime;
	}
	public void setRecentlogontime(String recentlogontime) {
		this.recentlogontime = recentlogontime;
	}
	public long getProfileimage() {
		return profileimage;
	}
	public void setProfileimage(long profileimage) {
		this.profileimage = profileimage;
	}
	public int getKeynum() {
		return keynum;
	}
	public void setKeynum(int keynum) {
		this.keynum = keynum;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public int getKeycount() {
		return keycount;
	}
	public void setKeycount(int keycount) {
		this.keycount = keycount;
	}
	@Override
	public String toString() {
		return "UserVo [userno=" + userno + ", id=" + id + ", passwd=" + passwd + ", nick=" + nick + ", cellphone="
				+ cellphone + ", average=" + average + ", recommaverage=" + recommaverage + ", recentlogontime="
				+ recentlogontime + ", profileimage=" + profileimage + ", keynum=" + keynum + ", createdate="
				+ createdate + ", keycount=" + keycount + "]";
	}
	
}