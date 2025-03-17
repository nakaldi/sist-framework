package com.yong.phonebook;

public class PhonebookDTO {
	private int idx;
	private String name;
	private String tel;
	private String addr;

	public PhonebookDTO() {
	}

	public PhonebookDTO(int idx, String name, String tel, String addr) {
		super();
		this.idx = idx;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
	}

	public int getIdx() {
		return idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

}
