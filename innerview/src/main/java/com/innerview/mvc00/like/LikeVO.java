package com.innerview.mvc00.like;


public class LikeVO {
	
	public String rNO;
	public String uID;
	public int lNO; //1또는0
	
	
	public String getrNO() {
		return rNO;
	}
	public void setrNO(String rNO) {
		this.rNO = rNO;
	}
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public int getlNO() {
		return lNO;
	}
	public void setlNO(int lNO) {
		this.lNO = lNO;
	}
	
}
