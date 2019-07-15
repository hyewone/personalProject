package com.exciform.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exciform.board.dto.BoardDto;
import com.exciform.board.dto.BoardFileDto;
import com.exciform.board.dto.BoardTypeDto;
import com.exciform.board.dto.CommentDto;
import com.exciform.board.dto.SearchDto;

@Repository
public class BoardDaoImple implements BoardDaoInter{

	@Autowired
	private SqlSessionTemplate sqlSession;

	//BoardList
	@Override
	public List<BoardDto> getBoardList(SearchDto searchDto) {

		List<BoardDto> boardList = new ArrayList<BoardDto>();
		boardList = sqlSession.selectList("boardMapper.getBoardList", searchDto);

		return boardList;
	}
	
	//BoardTotalCount
	@Override
	public int getBoardTotalCount() {
		
		int totalCount = sqlSession.selectOne("boardMapper.getBoardTotalCount");
		
		return totalCount;
	}

	//BoardDetail
	@Override
	public BoardDto getBoardDetail(int boardNo) {

		BoardDto boardDetail = new BoardDto();
		boardDetail = sqlSession.selectOne("boardMapper.getBoardDetail", boardNo);

		return boardDetail;
	}
	
	//BoardDetailFileList
	@Override
	public List<BoardFileDto> getBoardFileList(int boardNo) {
		
		List<BoardFileDto> boardFileList = sqlSession.selectList("boardMapper.getBoardFileList", boardNo);
		
		return boardFileList;
	}
	
	//CommentList
	@Override
	public List<CommentDto> getCommentList(int boardNo) {
		
		List<CommentDto> commentList = sqlSession.selectList("boardMapper.getCommentList", boardNo);
		
		return commentList;
	}

	//InsertComment
	@Override
	public int insertComment(CommentDto commentDto) {
		
		int insertCount = sqlSession.insert("boardMapper.insertComment", commentDto);
		
		return insertCount;
	}
	
	//DeleteComment
	@Override
	public int deleteComment(int commentNo) {
		
		int deleteCount = sqlSession.delete("boardMapper.deleteComment", commentNo);
		
		return deleteCount;
	}

	//UpdateViewCount
	@Override
	public int updateViewCount(int boardNo) {
		
		int updateCount = sqlSession.update("boardMapper.updateViewCount", boardNo);
		
		return updateCount;
	}

	//InsertBoard
	@Override
	public int insertBoard(BoardDto boardDto) {
		
		int insertCount = sqlSession.insert("boardMapper.insertBoard", boardDto);
		
		return insertCount;
	}

	//InsertBoardFile
	@Override
	public int insertBoardFile(BoardFileDto boardFileDto) {
		
		int insertCount = sqlSession.insert("boardMapper.insertBoardFile", boardFileDto);
		
		return insertCount;
	}

	//UpdateBoard
	@Override
	public int updateBoard(BoardDto boardDto) {
		
		int updateCount = sqlSession.update("boardMapper.updateBoard", boardDto);
		
		return updateCount;
	}

	//DeleteBoard
	@Override
	public int deleteBoard(int boardNo) {
		
		int deleteCount = sqlSession.delete("boardMapper.deleteBoard", boardNo);
		
		return deleteCount;
	}

	//GetBoardTypeList
	@Override
	public List<BoardTypeDto> getBoardTypeList() {
		
		List<BoardTypeDto> dtoList = sqlSession.selectList("boardMapper.getBoardTypeList");
		
		return dtoList;
	}
	
	
	
	
}
