package com.modang.vo;

public class TotalVo {

	private String gameDate;
	private String dates;
	private int c_payMoney;
	private int c_income;
	private int m_payMoney;
	private int m_income;
	private int t_payMoney;
	private int t_income;

	public TotalVo() {
		super();
	}

	public TotalVo(String gameDate, String dates, int c_payMoney, int c_income, int m_payMoney, int m_income,
			int t_payMoney, int t_income) {
		super();
		this.gameDate = gameDate;
		this.dates = dates;
		this.c_payMoney = c_payMoney;
		this.c_income = c_income;
		this.m_payMoney = m_payMoney;
		this.m_income = m_income;
		this.t_payMoney = t_payMoney;
		this.t_income = t_income;
	}

	public String getGameDate() {
		return gameDate;
	}

	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}

	public String getDates() {
		return dates;
	}

	public void setDate(String dates) {
		this.dates = dates;
	}

	public int getC_payMoney() {
		return c_payMoney;
	}

	public void setC_payMoney(int c_payMoney) {
		this.c_payMoney = c_payMoney;
	}

	public int getC_income() {
		return c_income;
	}

	public void setC_income(int c_income) {
		this.c_income = c_income;
	}

	public int getM_payMoney() {
		return m_payMoney;
	}

	public void setM_payMoney(int m_payMoney) {
		this.m_payMoney = m_payMoney;
	}

	public int getM_income() {
		return m_income;
	}

	public void setM_income(int m_income) {
		this.m_income = m_income;
	}

	public int getT_payMoney() {
		return t_payMoney;
	}

	public void setT_payMoney(int t_payMoney) {
		this.t_payMoney = t_payMoney;
	}

	public int getT_income() {
		return t_income;
	}

	public void setT_income(int t_income) {
		this.t_income = t_income;
	}

	@Override
	public String toString() {
		return "TotalVo [gameDate=" + gameDate + ", dates=" + dates + ", c_payMoney=" + c_payMoney + ", c_income="
				+ c_income + ", m_payMoney=" + m_payMoney + ", m_income=" + m_income + ", t_payMoney=" + t_payMoney
				+ ", t_income=" + t_income + "]";
	}

}
