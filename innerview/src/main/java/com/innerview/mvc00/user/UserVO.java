package com.innerview.mvc00.user;

public class UserVO {
	private String uID;
	private String uPW;
	private String uName;
	private String uBirth;
	private String uTel;
	private String uEmail;
	private String uAddress;
	private String uAddress1;
	private String uAddress2;
	private String uGender;
	private String uInterest;

	
	public String getuBirth() {
		return uBirth;
	}
	public void setuBirth(String uBirth) {
		this.uBirth = uBirth;
	}
	public String getuAddress1() {
		return uAddress1;
	}
	public void setuAddress1(String uAddress1) {
		this.uAddress1 = uAddress1;
	}
	public String getuAddress2() {
		return uAddress2;
	}
	public void setuAddress2(String uAddress2) {
		this.uAddress2 = uAddress2;
	}
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public String getuPW() {
		return uPW;
	}
	public void setuPW(String uPW) {
		this.uPW = uPW;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuTel() {
		return uTel;
	}
	public void setuTel(String uTel) {
		this.uTel = uTel;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuAddress() {
		return uAddress +" "+ uAddress1 + uAddress2;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public String getuGender() {
		return uGender;
	}
	public void setuGender(String uGender) {
		this.uGender = uGender;
	}
	public String getuInterest() {
		return uInterest;
	}
	public void setuInterest(String uInterest) {
		this.uInterest = uInterest;
	}
	
}
