package com.yong.bbs;

import java.time.LocalDateTime;

public class BbsDTO {
	private int id;
	private String title;
	private String content;
	private String author;
	private String pwd;
	private LocalDateTime createdAt; // LocalDateTime 사용 (날짜+시간)
	private int ref;
	private int depth;
	private int orderNum;
	private int viewCount;

	public BbsDTO() {
	}

	public BbsDTO(int id, String title, String content, String author, String pwd, LocalDateTime createdAt,
			int ref, int depth, int orderNum, int viewCount) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.author = author;
		this.pwd = pwd;
		this.createdAt = createdAt;
		this.ref = ref;
		this.depth = depth;
		this.orderNum = orderNum;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
}