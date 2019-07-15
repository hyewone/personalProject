package com.exciform.board.dao;

import org.springframework.stereotype.Repository;

import com.exciform.board.dto.UserDto;

@Repository
public interface UserDaoInter {
	
	// SIGN UP
	public int insertUser(UserDto UserDto);
	
	// CHECK USER ID EXIST
	public int getExistId(String userId);
	
	// CHECK ID AND PASSWORD
	public int checkLoginInfo(UserDto userDto);
	
	// GET USER INFO
	public UserDto getUserInfo(String userId);
}
