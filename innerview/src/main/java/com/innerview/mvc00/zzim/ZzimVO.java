package com.innerview.mvc00.zzim;

public class ZzimVO {
	private int zCode;
	private int iCode;
	private String uID;
	
	public int getzCode() {
		return zCode;
	}
	public void setzCode(int zCode) {
		this.zCode = zCode;
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
	@Override
	public String toString() {
		return "ZzimVO [zCode=" + zCode + ", iCode=" + iCode + ", uID=" + uID + "]";
	}

	
}
