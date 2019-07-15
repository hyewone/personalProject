package com.exciform.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.exciform.board.dao.BoardDaoImple;
import com.exciform.board.dto.BoardDto;
import com.exciform.board.dto.BoardFileDto;
import com.exciform.board.dto.BoardTypeDto;
import com.exciform.board.dto.CommentDto;
import com.exciform.board.dto.PageMakerDto;
import com.exciform.board.dto.SearchDto;
import com.exciform.board.dto.UserDto;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardDaoImple dao;

	// BoardList
	@RequestMapping(value = "/boardList", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView boardList(HttpServletRequest request, @ModelAttribute("SearchDto") SearchDto searchDto,
			@RequestParam(value = "current_page", defaultValue = "1") int current_page,
			@RequestParam(value = "view_count", defaultValue = "10") int view_count) {

		ModelAndView mav = new ModelAndView();

		// GET BOARD_TYPE_LIST FOR SEARCH
		List<BoardTypeDto> boardTypeDtoList = dao.getBoardTypeList();

		mav.addObject("boardTypeList", boardTypeDtoList);

		mav.addObject("searchDto", searchDto);

		// GET BOARDLIST
		searchDto.setView_count(view_count);
		searchDto.setCurrent_page(current_page);
		List<BoardDto> boardDtoList = dao.getBoardList(searchDto);

		// SETTING file_exist_yn(after check boardFile)
		if (boardDtoList.size() > 0) {
			mav.addObject("boardList", boardDtoList);
		}

		mav.setViewName("boardList");

		return mav;
	}

	// BoardDetail
	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam("boardNo") int boardNo) {

		ModelAndView mav = new ModelAndView();

		// GET BAORD DTAIL INFO
		BoardDto boardDto = dao.getBoardDetail(boardNo);
		mav.addObject("boardDto", boardDto);

		// GET BOARD FILE LIST
		List<BoardFileDto> boardFileList = dao.getBoardFileList(boardNo);
		mav.addObject("boardFileList", boardFileList);

		// GET BOARD COMMNET LIST
		List<CommentDto> commentList = dao.getCommentList(boardNo);
		mav.addObject("commentList", commentList);

		// GET BOARD BEFORE & AFTER

		// UPDATE VIEW_COUNT
		int updateCount = dao.updateViewCount(boardNo);

		mav.setViewName("boardDetail");

		return mav;
	}

	// BoardDetail_InsertComment
	@RequestMapping(value = "/insertComment", method = RequestMethod.POST)
	public ModelAndView insertComment(@ModelAttribute("CommentDto") CommentDto commentDto, HttpSession session) {

		ModelAndView mav = new ModelAndView();

		// GET USERNO,USERID FROM SESSION
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userNo = userInfo.getUser_no();

		// SETTING COMMENT_DTO
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm:ss");

		commentDto.setUser_no(userNo);
		commentDto.setReg_dt(format.format(date));

		// INSERT COMMENT
		int insertCount = dao.insertComment(commentDto);

		mav.setViewName("redirect:/board/boardDetail?boardNo=" + commentDto.getBoard_no());

		return mav;
	}

	// DeleteComment
	@RequestMapping(value = "/deleteComment", method = RequestMethod.GET)
	public ModelAndView deleteComment(@RequestParam("commentNo") int commentNo, @RequestParam("boardNo") int boardNo) {

		ModelAndView mav = new ModelAndView();

		int deleteCount = dao.deleteComment(commentNo);

		mav.setViewName("redirect:/board/boardDetail?boardNo=" + boardNo);

		return mav;
	}

	// InsertBoardPage
	@RequestMapping(value = "/insertBoardPage", method = RequestMethod.GET)
	public ModelAndView insertBoardPage() {

		ModelAndView mav = new ModelAndView();

		List<BoardTypeDto> dtoList = dao.getBoardTypeList();

		mav.addObject("boardTypeList", dtoList);

		mav.setViewName("registerBoard");

		return mav;
	}

	// InsertBoard
	@RequestMapping(value = "/insertBoard", method = RequestMethod.POST)
	public ModelAndView insertBoard(@ModelAttribute("BoardDto") BoardDto boardDto, HttpServletRequest request,
			HttpSession session) {

		ModelAndView mav = new ModelAndView();

		// GET USERNO,USERID FROM SESSION
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userNo = userInfo.getUser_no();
		String userId = userInfo.getUser_id();

		// SETTING BOARD_DTO
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm:ss");

		boardDto.setReg_dt(format.format(date));
		boardDto.setReg_id(userId);
		boardDto.setUser_no(userNo);
		boardDto.setView_count(0);

		// INSERT INTO BOARD
		int insertCount = dao.insertBoard(boardDto);

		// SETTING BOARDFILE_DTO & INSERT INTO FILE
		if (boardDto.getFile_list().get(0).getSize() > 0) {
			List<MultipartFile> fileList = boardDto.getFile_list();
			String real_path = request.getRealPath("/");
			uploadMultipartFile(fileList, boardDto.getBoard_no(), real_path);
		}

		mav.setViewName("redirect:/board/boardDetail?boardNo=" + boardDto.getBoard_no());

		return mav;
	}

	// UpdateBoardPage
	@RequestMapping(value = "/updateBoardPage", method = RequestMethod.GET)
	public ModelAndView updateBoardPage(@RequestParam("boardNo") int boardNo) {

		ModelAndView mav = new ModelAndView();

		// GET BOARD_TYPE_LIST FOR SEARCH
		List<BoardTypeDto> dtoList = dao.getBoardTypeList();

		mav.addObject("boardTypeList", dtoList);

		// GET BAORD DTAIL INFO
		BoardDto boardDto = dao.getBoardDetail(boardNo);

		mav.addObject("boardDto", boardDto);

		mav.setViewName("modifyBoard");

		return mav;

	}

	// UpdateBoard
	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	public ModelAndView updateBoard(@ModelAttribute("BoardDto") BoardDto boardDto, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int updateCount = dao.updateBoard(boardDto);

		// SETTING BOARDFILE_DTO & INSERT INTO FILE
		if (boardDto.getFile_list().get(0).getSize() > 0) {
			List<MultipartFile> fileList = boardDto.getFile_list();
			String real_path = request.getRealPath("/");
			uploadMultipartFile(fileList, boardDto.getBoard_no(), real_path);
		}

		mav.setViewName("redirect:/board/boardDetail?boardNo=" + boardDto.getBoard_no());

		return mav;
	}

	// DeleteBoard
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public ModelAndView deleteBoard(@RequestParam("boardNo") int boardNo) {

		ModelAndView mav = new ModelAndView();

		int deleteCount = dao.deleteBoard(boardNo);

		mav.setViewName("redirect:/board/boardList");

		return mav;
	}

	// FileUpload
	public void uploadMultipartFile(List<MultipartFile> fileList, int boardNo, String real_path) {

		BoardFileDto boardFileDto = new BoardFileDto();
		boardFileDto.setBoard_no(boardNo);

		String prefix_path = real_path + "resources\\uploadFile\\";
		String originalfile_name = "";
		String physicalfile_name = "";
		String physicalfile_path = "";
		String file_ext = "";

		for (MultipartFile e : fileList) {

			// originalfile_name
			originalfile_name = e.getOriginalFilename();
			// physicalfile_name
			physicalfile_name = UUID.randomUUID().toString();
			// file_ext
			file_ext = originalfile_name.substring(originalfile_name.indexOf("."));
			// physicalfile_path
			physicalfile_path = prefix_path + physicalfile_name + file_ext;

			boardFileDto.setOriginalfile_name(originalfile_name);
			boardFileDto.setPhysicalfile_name(physicalfile_name);
			boardFileDto.setPhysicalfile_path(physicalfile_path);
			boardFileDto.setFile_ext(file_ext);

			// CREATE FILE
			try {
				e.transferTo(new File(physicalfile_path));
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			dao.insertBoardFile(boardFileDto);

		}
	}

	// PageInfo
	public PageMakerDto getPageMakerInfo(int currentPage) {

		PageMakerDto pageMakerDto = new PageMakerDto();

		pageMakerDto.setTotal_count(dao.getBoardTotalCount());
		pageMakerDto.setTotal_page(pageMakerDto.getTotal_page());
		pageMakerDto.setCurrent_page(currentPage);
		pageMakerDto.setEnd_page(pageMakerDto.getEnd_page());
		pageMakerDto.setStart_page(pageMakerDto.getStart_board());
		pageMakerDto.checkEnd_page();

		return pageMakerDto;
	}

}
