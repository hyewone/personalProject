package com.exciform.board.dto;

public class PageMakerDto {

	private int page_per_board = 10;
	private int page_per_block = 10;
	private int total_count;
	private int total_page;
	private int start_board;
	private int end_board;
	private int current_page;

	public int getPage_per_board() {
		return page_per_board;
	}

	public void setPage_per_board(int page_per_board) {
		this.page_per_board = page_per_board;
	}

	public int getPage_per_block() {
		return page_per_block;
	}

	public void setPage_per_block(int page_per_block) {
		this.page_per_block = page_per_block;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public int getTotal_page() {

		if (total_count % page_per_board > 0) {
			total_page = total_count / page_per_board + 1;
		} else {
			total_page = total_count / page_per_board;
		}
		return total_page;
	}

	public void setTotal_page(int total_page) {
		this.total_page = total_page;
	}

	public int getStart_board() {
		start_board = end_board - (page_per_board - 1);
		return start_board;
	}

	public void setStart_page(int start_board) {
		this.start_board = start_board;
	}

	public int getEnd_page() {
		end_board = current_page * page_per_board;
		return end_board;
	}

	public void setEnd_page(int end_board) {
		this.end_board = end_board;
	}

	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int current_page) {
		this.current_page = current_page;
	}
	
	public void checkEnd_page() {
		if(end_board > total_count) {
			end_board = total_count;
		}
	}

}
