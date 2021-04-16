package com.conan.vo;

public class strangers {

	private String id;
	private String name;
	private int age;
	private String department;
	private String category;
	private int rating;
	private String filename;
	
	public strangers(String id, String name, int age, String department, String category, int rating, String filename) {
		  super();
		  this.id = id;
		  this.name = name;
		  this.age = age;
		  this.department = department;
		  this.category = category;
		  this.rating = rating;
		  this.filename = filename;
	}
	
	public strangers() {
		
	}
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	
}
