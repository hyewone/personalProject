package com.exciform.board.dto;

public class BoardFileDto {

	private int file_no;
	private String originalfile_name;
	private String physicalfile_name;
	private String physicalfile_path;
	private String file_ext;
	private int board_no;

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public String getOriginalfile_name() {
		return originalfile_name;
	}

	public void setOriginalfile_name(String originalfile_name) {
		this.originalfile_name = originalfile_name;
	}

	public String getPhysicalfile_name() {
		return physicalfile_name;
	}

	public void setPhysicalfile_name(String physicalfile_name) {
		this.physicalfile_name = physicalfile_name;
	}

	public String getPhysicalfile_path() {
		return physicalfile_path;
	}

	public void setPhysicalfile_path(String physicalfile_path) {
		this.physicalfile_path = physicalfile_path;
	}

	public String getFile_ext() {
		return file_ext;
	}

	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
}
