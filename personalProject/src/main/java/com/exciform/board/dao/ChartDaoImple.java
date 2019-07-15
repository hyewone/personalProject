package com.exciform.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDaoImple implements ChartDaoInter {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//GET AVERAGE CREDIT CHART
	@Override
	public Map<String, Object> getAverageCredit(int userNo) {
		
		Map<String, Object> map = sqlSession.selectOne("chartMapper.getAverageCredit", userNo);
		
		return map;
	}

	//GET COMPLETE CREDIT CHART
	@Override
	public Map<String, Object> getCompleteCredit(int userNo) {
		
		Map<String, Object> map = sqlSession.selectOne("chartMapper.getCompleteCredit", userNo);
		
		return map;
	}
	
	//GET GRADE PERCENT CHART
	@Override
	public List<Map<String, Object>> getGradePercent(int userNo) {
		
		List<Map<String, Object>> map = sqlSession.selectList("chartMapper.getGradePercent", userNo);
		
		return map;
	}

	//GET AVERAGE WHOLE&MY CREDIT CHART
	@Override
	public List<Map<String, Object>> getAverageWholeAndMyCredit(int userNo) {
		
		List<Map<String, Object>> map = sqlSession.selectList("chartMapper.getAverageWholeAndMyCredit", userNo);
		
		return map;
	}
	
}
