package com.kugou.pojo;

public class Admins {
	private int adminID;
	
	private String adminName;
	
	private String adminPwd;

	public int getAdminID() {
		return adminID;
	}

	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public Admins(int adminID, String adminName, String adminPwd) {
		super();
		this.adminID = adminID;
		this.adminName = adminName;
		this.adminPwd = adminPwd;
	}

	
	public Admins(String adminName, String adminPwd) {
		super();
		this.adminName = adminName;
		this.adminPwd = adminPwd;
	}

	public Admins() {
		super();
	}
}
