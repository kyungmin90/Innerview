package com.innerview.mvc00.item;

public class ItemVO {
	private int iCode; 		//제품코드
	private String iTitle; 		//제품명
	private int iPrice;			//제품가격
	private String iManufac;	//제조사
	private String iField1;		//분야1
	private String iField2;		//분야2
	private String iIngredient1;//성분1
	private double iComponent1;
	private String iIngredient2;//성분2
	private double iComponent2;
	private String iImage;		//이미지
	private String iContent;	//내용
	private double iGrade;		//평점
	
	
	public int getiCode() {
		return iCode;
	}
	public void setiCode(int iCode) {
		this.iCode = iCode;
	}
	public String getiTitle() {
		return iTitle;
	}
	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}
	public int getiPrice() {
		return iPrice;
	}
	public void setiPrice(int iPrice) {
		this.iPrice = iPrice;
	}
	public String getiManufac() {
		return iManufac;
	}
	public void setiManufac(String iManufac) {
		this.iManufac = iManufac;
	}
	public String getiField1() {
		return iField1;
	}
	public void setiField1(String iField1) {
		this.iField1 = iField1;
	}
	public String getiField2() {
		return iField2;
	}
	public void setiField2(String iField2) {
		this.iField2 = iField2;
	}
	public String getiIngredient1() {
		return iIngredient1;
	}
	public void setiIngredient1(String iIngredient1) {
		this.iIngredient1 = iIngredient1;
	}	
	public double getiComponent1() {
		return iComponent1;
	}
	public void setiComponent1(double iComponent1) {
		this.iComponent1 = iComponent1;
	}
	public String getiIngredient2() {
		return iIngredient2;
	}
	public void setiIngredient2(String iIngredient2) {
		this.iIngredient2 = iIngredient2;
	}
	public double getiComponent2() {
		return iComponent2;
	}
	public void setiComponent2(double iComponent2) {
		this.iComponent2 = iComponent2;
	}
	public String getiImage() {
		return iImage;
	}
	public void setiImage(String iImage) {
		this.iImage = iImage;
	}
	public String getiContent() {
		return iContent;
	}
	public void setiContent(String iContent) {
		this.iContent = iContent;
	}
	public double getiGrade() {
		return iGrade;
	}
	public void setiGrade(double iGrade) {
		this.iGrade = iGrade;
	}
	
	
}
