package com.tech.blog.entities;

public class Categories {
	private int cid;
	private String name;
	private String description;

	public Categories(int id, String name, String description) {
		super();
		this.cid = id;
		this.name = name;
		this.description = description;
	}

	public Categories(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}

	public int getCid() {
		return cid;
	}

	public void setId(int id) {
		this.cid = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
