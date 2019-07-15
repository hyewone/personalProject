package com.exciform.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.exciform.board.dto.UserDto;

@Component
public class Interceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		
		if(userInfo == null) {
			response.sendRedirect("/user/loginPage");
			return false;
		}
		
		return true;
	}
	
	

}
