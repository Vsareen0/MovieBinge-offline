package com.comaniacs.models;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class User {
	
	@Id
	@GeneratedValue
	private int userId;
	private String username;
	private String email;
	private String password;
	
	public int getUserId() {
		return userId;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
}
