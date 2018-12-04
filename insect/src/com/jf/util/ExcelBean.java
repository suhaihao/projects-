package com.jf.util;

import java.util.Date;

public class ExcelBean {
	private String name;
	private int age;
	private Date birth;

	public ExcelBean() {

	}

	public ExcelBean(String name, int age, Date birth) {
		this.name = name;
		this.age = age;
		this.birth = birth;
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

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}
}
