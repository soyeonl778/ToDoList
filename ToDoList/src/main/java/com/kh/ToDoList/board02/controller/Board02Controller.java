package com.kh.ToDoList.board02.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ToDoList.board02.model.service.Board02Service;
import com.kh.ToDoList.board02.model.vo.TodoList02;

@Controller
public class Board02Controller {

	@Autowired
	private Board02Service board02Service;
	
	/**
	 * 할 일 조회
	 * @param date
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectList")
	public String selectList(String date) {
		
		ArrayList<TodoList02> list = board02Service.selectList(date);
		
		System.out.println(list);
		
		return new Gson().toJson(list);
	};
	
	
	/**
	 * 일정 추가
	 * @param task
	 * @param date
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="insertList")
	public String inserList(String task, String date) {
		
		int result = board02Service.insertList(task, date);
		
		if(result > 0) {
			return "{\"result\":\"success\"}";
		} else {
			return "{\"result\":\"error\"}";
		}
	};
	
	/**
	 * 할 일 삭제
	 * @param hiddenNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="deleteList")
	public String deleteList(int hiddenNo) {
		
		int result = board02Service.deleteList(hiddenNo);
		
		if(result > 0) {
			return "{\"result\":\"success\"}";
		} else {
			return "{\"result\":\"error\"}";
		}
	};
	
	/**
	 * 하루 일정 삭제
	 * @param date
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="deleteDayList")
	public int deleteDayList(String date) {
		
		int result = board02Service.deleteDayList(date);
		
		return result;
		
	}
	
	/**
	 * 잔체 일정 초기화
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="deleteAllDay")
	public int deleteAllDay() {
		
		int result = board02Service.deleteAllDay();
		
		return result;
	}
	
}
