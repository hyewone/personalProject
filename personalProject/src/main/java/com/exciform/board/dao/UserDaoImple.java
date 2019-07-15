package com.exciform.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exciform.board.dto.UserDto;

@Repository
public class UserDaoImple implements UserDaoInter{

	@Autowired
	private SqlSessionTemplate sqlSession;

	// SIGN UP
	@Override
	public int insertUser(UserDto UserDto) {
		
		int insertCount = sqlSession.insert("userMapper.signUpUser", UserDto);
		
		return insertCount;
	}

	// CHECK USER ID EXIST
	@Override
	public int getExistId(String userId) {
		
		int existCount = sqlSession.selectOne("userMapper.getExistId", userId);
		
		return existCount;
	}

	// CHECK ID AND PASSWORD
	@Override
	public int checkLoginInfo(UserDto userDto) {
		
		int checkCount = sqlSession.selectOne("userMapper.checkLoginInfo", userDto);
		
		return checkCount;
	}
	
	// GET USER INFO
	@Override
	public UserDto getUserInfo(String userId) {
		
		UserDto userInfo = sqlSession.selectOne("userMapper.selectUserInfo", userId);
		
		return userInfo;
	}
	
}
