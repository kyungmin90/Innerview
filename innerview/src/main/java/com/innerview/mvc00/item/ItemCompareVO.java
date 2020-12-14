package com.innerview.mvc00.item;

public class ItemCompareVO {
	
	private String iCode;
	private String iImage;
	
	@Override
	public String toString() {
		return "ItemCompareVO [iCode=" + iCode + ", iImage=" + iImage + "]";
	}
	
	public String getiCode() {
		return iCode;
	}
	public void setiCode(String iCode) {
		this.iCode = iCode;
	}
	public String getiImage() {
		return iImage;
	}
	public void setiImage(String iImage) {
		this.iImage = iImage;
	}
	
}	
