package com.kugou.pojo;

public class Manager {
	private Integer id;
	private String username;
	private String email;
	private String password;
	private String rpassword;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRpassword() {
		return rpassword;
	}
	public void setRpassword(String rpassword) {
		this.rpassword = rpassword;
	}
	public Manager(Integer id, String username, String email, String password,
			String rpassword) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.rpassword = rpassword;
	}
	public Manager() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Manager [id=" + id + ", username=" + username + ", email="
				+ email + ", password=" + password + ", rpassword=" + rpassword
				+ "]";
	}
	
}
