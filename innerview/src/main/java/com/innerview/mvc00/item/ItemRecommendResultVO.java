package com.innerview.mvc00.item;

public class ItemRecommendResultVO {
	private int iCode; 		//제품코드
	private String iImage;//이미지
	
	public int getiCode() {
		return iCode;
	}
	public void setiCode(int iCode) {
		this.iCode = iCode;
	}
	public String getiImage() {
		return iImage;
	}
	public void setiImage(String iImage) {
		this.iImage = iImage;
	}
	@Override
	public String toString() {
		return "ItemRecommendResultVO [iCode=" + iCode + ", iImage=" + iImage + "]";
	}	
	
}
