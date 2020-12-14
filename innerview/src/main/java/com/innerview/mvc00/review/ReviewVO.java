package com.innerview.mvc00.review;

public class ReviewVO {
	
	public String  rNO;
	public String rTitle;
	public String rContent;
	public String rScore;
	public String rCount;
	public String uID;
	public String rDate;
	public String image;
	public String iCode;
	
	
	
	public String  getrNO() {
		return rNO;
	}
	public void setrNO(String  rNO) {
		this.rNO = rNO;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrScore() {
		return rScore;
	}
	public void setrScore(String rScore) {
		this.rScore = rScore;
	}
	public String getrCount() {
		return rCount;
	}
	public void setrCount(String rCount) {
		this.rCount = rCount;
	}
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getiCode() {
		return iCode;
	}
	public void setiCode(String iCode) {
		this.iCode = iCode;
	}
	
	
	
	
	@Override
	public String toString() {
		return "ReviewVO [rNO=" + rNO + ", rTitle=" + rTitle + ", rContent=" + rContent + ", rScore=" + rScore
				+ ", rCount=" + rCount + ", uID=" + uID + ", rDate=" + rDate + ", image=" + image + ", iCode=" + iCode
				+ "]";
	}
	
	
	
	
	
	
	

	
}
