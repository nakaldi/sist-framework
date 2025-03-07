package com.yong.member;

import java.sql.Date;

public class MemberDTO {
	private int idx; // 회원 고유 번호
	private String id; // 사용자 ID
	private String pwd; // 비밀번호
	private String name; // 이름
	private String email; // 이메일
	private String tel; // 전화번호
	private String addr; // 주소
	private Date joinDate; // 가입 날짜

	// 기본 생성자
	public MemberDTO() {
	}

	// 모든 필드를 포함한 생성자
	public MemberDTO(int idx, String id, String pwd, String name, String email, String tel, String addr,
			Date joinDate) {
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.joinDate = joinDate;
	}

	// Getter와 Setter
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "MemberDTO{" + "idx=" + idx + ", id='" + id + '\'' + ", pwd='" + pwd + '\'' + ", name='" + name + '\''
				+ ", email='" + email + '\'' + ", tel='" + tel + '\'' + ", addr='" + addr + '\'' + ", joinDate="
				+ joinDate + '}';
	}
}
