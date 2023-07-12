package com.modang.vo;

public class TariffVo {
	
	private int biliardno; /* 당구장번호 */
	private int btablefee; /* 대대시간당요금 */
	private int mtablefee; /* 중대시간당요금 */
	private int ptablefee; /* 포켓시간당요금 */
	private int bminfee;   /* 대대최소게임비 */
	private int mminfee;   /* 중대최소게임비 */
	private int pminfee;   /* 포케최소게임비 */
	
	public TariffVo() {
		
	}

	public TariffVo(int biliardno, int btablefee, int mtablefee, int ptablefee, int bminfee, int mminfee,
			int pminfee) {
		this.biliardno = biliardno;
		this.btablefee = btablefee;
		this.mtablefee = mtablefee;
		this.ptablefee = ptablefee;
		this.bminfee = bminfee;
		this.mminfee = mminfee;
		this.pminfee = pminfee;
	}

	public int getbiliardno() {
		return biliardno;
	}

	public void setbiliardno(int biliardno) {
		this.biliardno = biliardno;
	}

	public int getBtablefee() {
		return btablefee;
	}

	public void setBtablefee(int btablefee) {
		this.btablefee = btablefee;
	}

	public int getMtablefee() {
		return mtablefee;
	}

	public void setMtablefee(int mtablefee) {
		this.mtablefee = mtablefee;
	}

	public int getPtablefee() {
		return ptablefee;
	}

	public void setPtablefee(int ptablefee) {
		this.ptablefee = ptablefee;
	}

	public int getBminfee() {
		return bminfee;
	}

	public void setBminfee(int bminfee) {
		this.bminfee = bminfee;
	}

	public int getMminfee() {
		return mminfee;
	}

	public void setMminfee(int mminfee) {
		this.mminfee = mminfee;
	}

	public int getPminfee() {
		return pminfee;
	}

	public void setPminfee(int pminfee) {
		this.pminfee = pminfee;
	}

	@Override
	public String toString() {
		return "TableFeeVo [biliardno=" + biliardno + ", btablefee=" + btablefee + ", mtablefee=" + mtablefee
				+ ", ptablefee=" + ptablefee + ", bminfee=" + bminfee + ", mminfee=" + mminfee + ", pminfee=" + pminfee
				+ "]";
	}
	
	
	
	

}
