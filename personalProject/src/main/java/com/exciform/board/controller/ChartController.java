package com.exciform.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.exciform.board.dao.ChartDaoImple;

@RequestMapping(value = "/board")
@Controller
public class ChartController {
	
	@Autowired
	private ChartDaoImple dao;

	@RequestMapping(value = "/chart")
	public ModelAndView averageChart() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("chart");
		
		return mav;
	}
	
	@RequestMapping(value = "/do.averageCredit",method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> getAverageCredit(@RequestParam("userNo")int userNo){
		
		Map<String, Object> map = dao.getAverageCredit(userNo);
		
		return map;
	}
	
	@RequestMapping(value = "/do.completeCredit",method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> getCompleteCredit(@RequestParam("userNo")int userNo){
		
		Map<String, Object> map = dao.getCompleteCredit(userNo);
		
		return map;
	}
	
	@RequestMapping(value = "/do.gradePercent",method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> getGradePercentChart(@RequestParam("userNo")int userNo){
		//JSONArray
		List<Map<String, Object>> map = dao.getGradePercent(userNo);
		
		//JSONArray jsonArray = new JSONArray();
		
		//return jsonArray.fromObject(map);
		return map;
	}
	
	@RequestMapping(value = "/do.gradeLineCredit",method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> getAverageWholeAndMyCredit(@RequestParam("userNo")int userNo){
		
		List<Map<String, Object>> map = dao.getAverageWholeAndMyCredit(userNo);
		
		return map;
	}
}
