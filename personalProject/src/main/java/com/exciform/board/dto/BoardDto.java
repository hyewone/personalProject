package com.exciform.board.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardDto {

	private int board_no;
	private String board_title;
	private String board_content;
	private String reg_dt;
	private String reg_id;
	private int user_no;
	private String board_type;
	private int view_count;
	private int total_page;
	private int current_page;

	private String writer_name;
	private String board_type_name;
	private Boolean file_exist_yn = false;

	private List<MultipartFile> file_list;
	
	private List<BoardFileDto> board_file_list;

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getWriter_name() {
		return writer_name;
	}

	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}

	public String getBoard_type_name() {
		return board_type_name;
	}

	public void setBoard_type_name(String board_type_name) {
		this.board_type_name = board_type_name;
	}

	public Boolean getFile_exist_yn() {
		return file_exist_yn;
	}

	public void setFile_exist_yn(Boolean file_exist_yn) {
		this.file_exist_yn = file_exist_yn;
	}

	public List<MultipartFile> getFile_list() {
		return file_list;
	}

	public void setFile_list(List<MultipartFile> file_list) {
		this.file_list = file_list;
	}

	public List<BoardFileDto> getBoard_file_list() {
		return board_file_list;
	}

	public void setBoard_file_list(List<BoardFileDto> board_file_list) {
		this.board_file_list = board_file_list;
	}

	public int getTotal_page() {
		return total_page;
	}

	public void setTotal_page(int total_page) {
		this.total_page = total_page;
	}

	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int current_page) {
		this.current_page = current_page;
	}
	

}
