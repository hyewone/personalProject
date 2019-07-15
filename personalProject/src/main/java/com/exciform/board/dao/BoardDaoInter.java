package com.exciform.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.exciform.board.dto.BoardDto;
import com.exciform.board.dto.BoardFileDto;
import com.exciform.board.dto.BoardTypeDto;
import com.exciform.board.dto.CommentDto;
import com.exciform.board.dto.SearchDto;
@Repository
public interface BoardDaoInter {

	//BoardList
	public List<BoardDto> getBoardList(SearchDto searchDto);
	//BoardTotalCount
	public int getBoardTotalCount();
	//BoardDetail
	public BoardDto getBoardDetail(int boardNo);
	//BoardDetailFileList
	public List<BoardFileDto> getBoardFileList(int boardNo);
	//CommentList
	public List<CommentDto> getCommentList(int boardNo);
	//InsertComment
	public int insertComment(CommentDto commentDto);
	//DeleteComment
	public int deleteComment(int commentNo);
	//UpdateViewCount
	public int updateViewCount(int boardNo);
	//InsertBoard
	public int insertBoard(BoardDto boardDto);
	//InsertBoardFile
	public int insertBoardFile(BoardFileDto boardFileDto);
	//UpdateBoard
	public int updateBoard(BoardDto boardDto);
	//DeleteBoard
	public int deleteBoard(int boardNo);
	//GetBoardTypeList
	public List<BoardTypeDto> getBoardTypeList();
	
	
}
