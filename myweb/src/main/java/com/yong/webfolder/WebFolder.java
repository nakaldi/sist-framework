package com.yong.webfolder;

import java.io.File;
import java.util.Arrays;

public class WebFolder {
	private String rootPath;
	private String userId;
	private final long MAX_FOLDER_SIZE = 1024 * 1024 * 20;
	private File userFolder;

	public WebFolder(String rootPath, String userId) {
		super();
		this.rootPath = rootPath;
		this.userId = userId;
		makeUserFolder();
	}

	public String getRootPath() {
		return rootPath;
	}

	public String getUserId() {
		return userId;
	}

	public long getUsedSize() {
		return sumUsedSize(userFolder);
	}

	public long getFreeSize() {
		return MAX_FOLDER_SIZE - getUsedSize();
	}

	public long getMAX_FOLDER_SIZE() {
		return MAX_FOLDER_SIZE;
	}

	public void makeUserFolder() {
		userFolder = new File(rootPath + "/" + userId);
		if (!userFolder.exists()) {
			userFolder.mkdir();
		}
	}

	public long sumUsedSize(File folder) {
		return Arrays.stream(folder.listFiles()).mapToLong(f -> f.isFile() ? f.length() : sumUsedSize(f)).sum();
	}

	public File getUserFolder() {
		return userFolder;
	}

	public boolean deleteFile(File target) {
		boolean deleted = false;
		if (target.isDirectory()) {
			if (target.listFiles().length > 0) {
				Arrays.stream(target.listFiles()).forEach(t -> deleteFile(t));
			}
		}
		deleted = target.delete();
		System.out.println(target.getAbsolutePath() + " 파일 삭제 " + (deleted ? "성공" : "실패"));
		return deleted;
	}
}
