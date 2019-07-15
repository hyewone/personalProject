package com.exciform.board.dto;

public class SearchDto {

	private boolean period_yn;
	private String start_date;
	private String end_date;
	private String board_type;
	private String search_type;
	private String search_word;
	
	private int current_page;
	private int view_count;
	private int total_page;
	
	private int start_board;
	private int end_board;

	private int user_no;

	public boolean isPeriod_yn() {
		return period_yn;
	}

	public void setPeriod_yn(boolean period_yn) {
		this.period_yn = period_yn;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getSearch_type() {
		return search_type;
	}

	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}

	public String getSearch_word() {
		return search_word;
	}

	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getStart_board() {
		return start_board;
	}

	public void setStart_board(int start_board) {
		this.start_board = start_board;
	}

	public int getEnd_board() {
		return end_board;
	}

	public void setEnd_board(int end_board) {
		this.end_board = end_board;
	}

	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int current_page) {
		this.current_page = current_page;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	
	public int getTotal_page() {
		return total_page;
	}

	public void setTotal_page(int total_page) {
		this.total_page = total_page;
	}
	
}
