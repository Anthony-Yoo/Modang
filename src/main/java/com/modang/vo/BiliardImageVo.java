package com.modang.vo;

public class BiliardImageVo {
	private int imageNo;
	private int biliardNo;
	private String imageFile1;
	
	public BiliardImageVo(int imageNo, int biliardNo, String imageFile1) {
		super();
		this.imageNo = imageNo;
		this.biliardNo = biliardNo;
		this.imageFile1 = imageFile1;
	}

	public BiliardImageVo() {
		super();
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public int getBiliardNo() {
		return biliardNo;
	}

	public void setBiliardNo(int biliardNo) {
		this.biliardNo = biliardNo;
	}

	public String getImageFile1() {
		return imageFile1;
	}

	public void setImageFile1(String imageFile1) {
		this.imageFile1 = imageFile1;
	}

	@Override
	public String toString() {
		return "BiliardImageVo [imageNo=" + imageNo + ", biliardNo=" + biliardNo + ", imageFile1=" + imageFile1 + "]";
	}
	
	
}
