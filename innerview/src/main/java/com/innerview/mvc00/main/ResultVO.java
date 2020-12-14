package com.innerview.mvc00.main;

public class ResultVO {
	//상품번호
	private int iCode;

	//아이템 평점
	private double result;
	

	
	
	public int getiCode() {
		return iCode;
	}
	public void setiCode(int iCode) {
		this.iCode = iCode;
	}
	public double getResult() {
		return result;
	}
	public void setResult(double result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "ResultVO [iCode=" + iCode + ", result=" + result + "]";
	}
	
	

	
	
	

}
