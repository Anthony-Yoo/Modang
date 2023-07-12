package com.modang.vo;

public class UserVo {
	
	private int userno;					/*유저엔티티번호*/
	private String id;					/*아이디*/
	private String passwd;				/*비밀번호*/
	private String nick;				/*닉네임*/
	private String cellphone;			/*핸드폰번호*/
	private int average;				/*평타*/
	private int recommaverage;			/*권장평타*/
	private String recentlogontime;		/*최근로그인시간*/
	private long profileimage;			/*프로필이미지*/
	private int keynum;					/*키넘버*/
	private String createdate;			/*생성시간*/
	private int keycount;				/*생성횟수*/
	
	public UserVo(int userno, String id, String passwd, String nick, String cellphone, int average, int recommaverage,
			String recentlogontime, long profileimage, int keynum) {
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
	}
	public UserVo() {
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
	@Override
	public String toString() {
		return "UserVo [userno=" + userno + ", id=" + id + ", passwd=" + passwd + ", nick=" + nick + ", cellphone="
				+ cellphone + ", average=" + average + ", recommaverage=" + recommaverage + ", recentlogontime="
				+ recentlogontime + ", profileimage=" + profileimage + ", keynum=" + keynum + "]";
	}
	
	
}