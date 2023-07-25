package com.modang.vo;

public class ManagerVo {
   private int biliardNo;          //당구장PK번호
   private String id;                //아이디
   private String passwd;           //비밀번호
   private String companyNo;        //사업자번호
   private String repName;          //대표자명
   private String biliardName;      //상호명
   private int postcode;            //우편번호
   private String biliardAddress1;  //주소1
   private String biliardAddress2;  //주소2(상세주소)
   private String latitude;         //위도
   private String longtitude;       //경도
   private String biliardPhone;     //당구장 전화번호
   private String imageFile1;		//당구장 이미지 (필수)
   private String imageFile2;		//당구장 이미지2
   private String imageFile3;		//당구장 이미지3
   private String time1;              //이용시간1
   private String time2;              //이용시간2
   private String parking;          //주차장여부
   private String bdComment;        //간략소개
   
   
	public ManagerVo() {
		super();
	}
	public ManagerVo(int biliardNo,String imageFile1, String imageFile2, String imageFile3) {
		super();
		this.biliardNo = biliardNo;
		this.imageFile1 = imageFile1;
		this.imageFile2 = imageFile2;
		this.imageFile3 = imageFile3;
	}
	public ManagerVo(int biliardNo, String id, String passwd, String companyNo, String repName, String biliardName,
			int postcode, String biliardAddress1, String biliardAddress2, String latitude, String longtitude,
			String biliardPhone, String imageFile1, String imageFile2, String imageFile3, String time1, String time2,
			String parking, String bdComment) {
		super();
		this.biliardNo = biliardNo;
		this.id = id;
		this.passwd = passwd;
		this.companyNo = companyNo;
		this.repName = repName;
		this.biliardName = biliardName;
		this.postcode = postcode;
		this.biliardAddress1 = biliardAddress1;
		this.biliardAddress2 = biliardAddress2;
		this.latitude = latitude;
		this.longtitude = longtitude;
		this.biliardPhone = biliardPhone;
		this.imageFile1 = imageFile1;
		this.imageFile2 = imageFile2;
		this.imageFile3 = imageFile3;
		this.time1 = time1;
		this.time2 = time2;
		this.parking = parking;
		this.bdComment = bdComment;
	}
    // biliardNo 필드의 getter 메서드 정의
    public int getbiliardNo() {
        return biliardNo;
    }

    // biliardNo 필드의 setter 메서드 정의
    public void setbiliardNo(int biliardNo) {
        this.biliardNo = biliardNo;
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
	public String getBiliardName() {
		return biliardName;
	}
	public void setBiliardName(String biliardName) {
		this.biliardName = biliardName;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getBiliardAddress1() {
		return biliardAddress1;
	}
	public void setBiliardAddress1(String biliardAddress1) {
		this.biliardAddress1 = biliardAddress1;
	}
	public String getBiliardAddress2() {
		return biliardAddress2;
	}
	public void setBiliardAddress2(String biliardAddress2) {
		this.biliardAddress2 = biliardAddress2;
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
	public String getBiliardPhone() {
		return biliardPhone;
	}
	public void setBiliardPhone(String biliardPhone) {
		this.biliardPhone = biliardPhone;
	}
	public String getImageFile1() {
		return imageFile1;
	}
	public void setImageFile1(String imageFile1) {
		this.imageFile1 = imageFile1;
	}
	public String getImageFile2() {
		return imageFile2;
	}
	public void setImageFile2(String imageFile2) {
		this.imageFile2 = imageFile2;
	}
	public String getImageFile3() {
		return imageFile3;
	}
	public void setImageFile3(String imageFile3) {
		this.imageFile3 = imageFile3;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
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
		return "ManagerVo [biliardNo=" + biliardNo + ", id=" + id + ", passwd=" + passwd + ", companyNo=" + companyNo
				+ ", repName=" + repName + ", biliardName=" + biliardName + ", postcode=" + postcode
				+ ", biliardAddress1=" + biliardAddress1 + ", biliardAddress2=" + biliardAddress2 + ", latitude="
				+ latitude + ", longtitude=" + longtitude + ", biliardPhone=" + biliardPhone + ", imageFile1="
				+ imageFile1 + ", imageFile2=" + imageFile2 + ", imageFile3=" + imageFile3 + ", time1=" + time1
				+ ", time2=" + time2 + ", parking=" + parking + ", bdComment=" + bdComment + "]";
	}
   
   
}
   