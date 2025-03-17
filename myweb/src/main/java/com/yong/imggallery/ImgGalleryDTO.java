package com.yong.imggallery;

public class ImgGalleryDTO {
	private int idx;
	private String writer;
	private String originName;
	private String systemName;

	public ImgGalleryDTO() {
	}

	public ImgGalleryDTO(int idx, String writer, String originName, String systemName) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.originName = originName;
		this.systemName = systemName;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
}
