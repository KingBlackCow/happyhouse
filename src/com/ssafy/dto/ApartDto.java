package com.ssafy.dto;

public class ApartDto {
	private int no;
	private String dong;
	private String AptName;
	private String code;
	private String dealAmount;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return AptName;
	}

	@Override
	public String toString() {
		return "ApartDto [no=" + no + ", dong=" + dong + ", aptName=" + AptName + ", code=" + code + ", dealAmount="
				+ dealAmount + "]";
	}

	public void setAptName(String AptName) {
		this.AptName = AptName;
	}

}
