package com.exciform.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface ChartDaoInter {
	
	
	//GET AVERAGE CREDIT CHART
	public Map<String, Object> getAverageCredit(int userNo);
	//GET COMPLETE CREDIT CHART
	public Map<String, Object> getCompleteCredit(int userNo);
	//GET GRADE PERCENT CHART
	public List<Map<String, Object>> getGradePercent(int userNo);
	//GET AVERAGE WHOLE&MY CREDIT CHART
	public List<Map<String, Object>> getAverageWholeAndMyCredit(int userNo);

}
