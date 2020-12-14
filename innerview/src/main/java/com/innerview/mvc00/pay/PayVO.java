package com.innerview.mvc00.pay;

import java.sql.Timestamp;

public class PayVO {
	private int pCode;
	private int pTotalPrice;
	private int iCode;
	private String uID;
	private Timestamp pDateTime;
	
	public int getpCode() {
		return pCode;
	}
	public void setpCode(int pCode) {
		this.pCode = pCode;
	}
	public int getpTotalPrice() {
		return pTotalPrice;
	}
	public void setpTotalPrice(int pTotalPrice) {
		this.pTotalPrice = pTotalPrice;
	}
	public int getiCode() {
		return iCode;
	}
	public void setiCode(int iCode) {
		this.iCode = iCode;
	}
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public Timestamp getpDateTime() {
		return pDateTime;
	}
	public void setpDateTime(Timestamp pDateTime) {
		this.pDateTime = pDateTime;
	}	
}
