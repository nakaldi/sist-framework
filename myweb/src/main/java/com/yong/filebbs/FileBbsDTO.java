package com.yong.filebbs;

public class FileBbsDTO {
	private int idx;
	private String filename;
	private String writer;

	public FileBbsDTO() {

	}

	public FileBbsDTO(int idx, String filename, String writer) {
		super();
		this.idx = idx;
		this.filename = filename;
		this.writer = writer;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

}
