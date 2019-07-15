package com.exciform.board.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.exciform.board.dao.UserDaoImple;
import com.exciform.board.dto.UserDto;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserDaoImple dao;

	// SIGN UP PAGE
	@RequestMapping(value = "/signupPage", method = RequestMethod.GET)
	public ModelAndView signupPage() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("user/signupPage");

		return mav;
	}

	// SIGN UP
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signupUser(@ModelAttribute("UserDto") UserDto userDto) {

		ModelAndView mav = new ModelAndView();
		
		// 101 : 내부 , 102 : 카카오, 103 : 네이버
		userDto.setJoin_type("101");
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
		userDto.setReg_dt(format.format(date));

		int insertCount = dao.insertUser(userDto);

		if (insertCount > 0) {
			mav.setViewName("redirect:/user/loginPage");
		}

		return mav;
	}

	// LOGINPAGE
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public ModelAndView loginPage() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("login");

		return mav;
	}

	// LOGIN
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView login(@ModelAttribute("UserDto") UserDto userDto, HttpServletRequest request
								,HttpSession session) {

		ModelAndView mav = new ModelAndView();

			if(dao.getExistId(userDto.getUser_id()) < 1) {
				
				if(userDto.getUser_name() == null) {
					userDto.setUser_name(userDto.getUser_id());
				}
				
				Date date = new Date();
				SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
				userDto.setReg_dt(format.format(date));
	
				dao.insertUser(userDto);
			}

		userDto = dao.getUserInfo(userDto.getUser_id());
		
		// 세션등록
		session.setAttribute("userInfo", userDto);

		//mav.setViewName("redirect:/board/boardList");
		mav.setViewName("redirect:/board/chart");

		return mav;
	}

	// LOGOUT
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {

		
		ModelAndView mav = new ModelAndView();
		
		session.invalidate();

		mav.setViewName("redirect:/user/loginPage");

		return mav;
	}

	// CHECK ID
	@RequestMapping(value = "/do.checkId", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int checkId(String userId) {

		int resultCount = dao.getExistId(userId);

		return resultCount;
	}

	// CHECK LOGIN
	@RequestMapping(value = "/do.checkLogin", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int checkLogin(UserDto userDto) {

		int resultCount = dao.checkLoginInfo(userDto);
		
		System.out.println(resultCount);

		return resultCount;
	}
	
	// LOGIN CALLBACK
	@RequestMapping(value = "/loginCallback")
	public String loginCallback() {
		return "loginCallback";
	}
}
