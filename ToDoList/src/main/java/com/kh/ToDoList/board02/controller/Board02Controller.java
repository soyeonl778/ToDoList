package com.kh.ToDoList.board02.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ToDoList.board02.model.service.Board02Service;
import com.kh.ToDoList.board02.model.vo.Board02;
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
	
	/**
	 * 전체 게시글 조회 및 페이지네이션 처리
	 * @param page
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectBoardList", method=RequestMethod.GET, produces="application/json")
	public Map<String, Object> selectBoardList(@RequestParam(value="page", defaultValue="1") int page) {
		
		int pageSize = 10;
		
		List<Board02> list = board02Service.selectBoardList(page, pageSize);
		
		int totalPosts = board02Service.selectTotalCount();
		
		int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
		
		Map<String, Object> result = new HashMap<>();
		result.put("list", list);
		result.put("currentPage", page);
		result.put("totalPages", totalPages);

		return result;
		
	}
	
	/**
	 * 새 글 추가
	 * @param titleInput
	 * @param nameInput
	 * @param descTextArea
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="insertPost")
	public int insertPost(@RequestParam(value="titleInput") String titleInput,
						  @RequestParam String nameInput,
						  @RequestParam String descTextArea) {
		
		int result = board02Service.insertPost(titleInput, nameInput, descTextArea);
		
		return result;
	}
	
	
	/**
	 * 게시글 상세 조회
	 * @param hiddenNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("selectBoardOne")
	public String selectBoardOne(int hiddenNo) {

		Board02 list = board02Service.selectBoardOne(hiddenNo);
		
		return new Gson().toJson(list);
		
	}
	
	
	/**
	 * 게시글 수정
	 * @param boardTitle
	 * @param boardDesc
	 * @param boardNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("confirmUpdate")
	public int confirmUpdate(String boardTitle, String boardDesc, int boardNo) {
		
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("boardTitle", boardTitle);
		parameter.put("boardDesc", boardDesc);
		parameter.put("boardNo", boardNo);
		
		int result = board02Service.confirmUpdate(parameter);
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("deletePost")
	public int deletePost(int boardNo) {
		
		int result = board02Service.deletePost(boardNo);
		
		return result;
	}
	
}
