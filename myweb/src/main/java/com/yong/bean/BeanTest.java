package com.yong.bean;

public class BeanTest {
	// 이름이랑 나이를 담아두는 카트 DTO를 만들어보자

	private String name;
	private int age;
	private String address;
	private String phone;

	public BeanTest() {
		System.out.println("BeanTest 객체 생성됨.");
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

}
