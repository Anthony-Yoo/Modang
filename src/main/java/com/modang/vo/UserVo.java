package com.modang.vo;

public class UserVo {

	private int userNo;					/*유저엔티티번호*/
	private String id;					/*아이디*/
	private String passwd;				/*비밀번호*/
	private String nick;				/*닉네임*/
	private String cellphone;			/*핸드폰번호*/
	private int average;				/*평타*/
	private int recommAverage;			/*권장평타*/
	private String recentLogonTime;		/*최근로그인시간*/
	private String profileImage;			/*프로필이미지명*/


	public UserVo() {
		super();
	}


	public UserVo(int userNo, String id, String passwd, String nick, String cellphone, int average, int recommAverage,
			String recentLogonTime, String profileImage) {
		super();
		this.userNo = userNo;
		this.id = id;
		this.passwd = passwd;
		this.nick = nick;
		this.cellphone = cellphone;
		this.average = average;
		this.recommAverage = recommAverage;
		this.recentLogonTime = recentLogonTime;
		this.profileImage = profileImage;
	}

	/**
	 * @return the userNo
	 */
	public int getUserNo() {
		return userNo;
	}

	/**
	 * @param userNo the userNo to set
	 */
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}


	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}


	/**
	 * @return the passwd
	 */
	public String getPasswd() {
		return passwd;
	}


	/**
	 * @param passwd the passwd to set
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	/**
	 * @return the nick
	 */
	public String getNick() {
		return nick;
	}


	/**
	 * @param nick the nick to set
	 */
	public void setNick(String nick) {
		this.nick = nick;
	}


	/**
	 * @return the cellphone
	 */
	public String getCellphone() {
		return cellphone;
	}


	/**
	 * @param cellphone the cellphone to set
	 */
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}


	/**
	 * @return the average
	 */
	public int getAverage() {
		return average;
	}


	/**
	 * @param average the average to set
	 */
	public void setAverage(int average) {
		this.average = average;
	}


	/**
	 * @return the recommAverage
	 */
	public int getRecommAverage() {
		return recommAverage;
	}


	/**
	 * @param recommAverage the recommAverage to set
	 */
	public void setRecommAverage(int recommAverage) {
		this.recommAverage = recommAverage;
	}


	/**
	 * @return the recentLogonTime
	 */
	public String getRecentLogonTime() {
		return recentLogonTime;
	}


	/**
	 * @param recentLogonTime the recentLogonTime to set
	 */
	public void setRecentLogonTime(String recentLogonTime) {
		this.recentLogonTime = recentLogonTime;
	}


	/**
	 * @return the profileImage
	 */
	public String getProfileImage() {
		return profileImage;
	}


	/**
	 * @param profileImage the profileImage to set
	 */
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}


	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", id=" + id + ", passwd=" + passwd + ", nick=" + nick + ", cellphone="
				+ cellphone + ", average=" + average + ", recommAverage=" + recommAverage + ", recentLogonTime="
				+ recentLogonTime + ", profileImage=" + profileImage + "]";
	}
	
}