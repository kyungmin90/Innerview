package com.innerview.mvc00.item;

public class ItemRecommendVO {
	private int iCode; 		//제품코드
	private int iPrice;			//제품가격
	private String iImage;//이미지
	private double iComponent1;
	private double iComponent2;
	private double iGrade;		//평점
	
	
	public int getiCode() {
		return iCode;
	}
	public void setiCode(int iCode) {
		this.iCode = iCode;
	}
	public int getiPrice() {
		return iPrice;
	}
	public void setiPrice(int iPrice) {
		this.iPrice = iPrice;
	}
	public String getiImage() {
		return iImage;
	}
	public void setiImage(String iImage) {
		this.iImage = iImage;
	}
	public double getiComponent1() {
		return iComponent1;
	}
	public void setiComponent1(double iComponent1) {
		this.iComponent1 = iComponent1;
	}
	public double getiComponent2() {
		return iComponent2;
	}
	public void setiComponent2(double iComponent2) {
		this.iComponent2 = iComponent2;
	}
	public double getiGrade() {
		return iGrade;
	}
	public void setiGrade(double iGrade) {
		this.iGrade = iGrade;
	}
	
	
	
}
