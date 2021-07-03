package com.tech.blog.entities;

import java.sql.Timestamp;

public class User {
	private int id;
	private String user_name;
	private String email;
	private String password;
	private String gender;
	private String about;
	private Timestamp reg_date;

	public User(int id, String user_name, String email, String password, String gender, String about,
			Timestamp reg_date) {
		super();
		this.id = id;
		this.user_name = user_name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.reg_date = reg_date;
	}

	public User() {
		super();
	}

	public User(String user_name, String email, String password, String gender, String about) {
		super();
		this.user_name = user_name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
	}

// getters and setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

}
