package com.kh.ToDoList.board02.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ToDoList.board02.model.dao.Board02Dao;
import com.kh.ToDoList.board02.model.vo.Board02;
import com.kh.ToDoList.board02.model.vo.TodoList02;

@Service
public class Board02ServiceImpl implements Board02Service {

	@Autowired
	private Board02Dao board02Dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<TodoList02> selectList(String date) {
		return board02Dao.selectList(sqlSession, date);
	}

	@Override
	public int insertList(String task, String date) {
		return board02Dao.insertList(sqlSession, task, date);
	}

	@Override
	public int deleteList(int hiddenNo) {
		return board02Dao.deleteList(sqlSession, hiddenNo);
	}

	@Override
	public int deleteDayList(String date) {
		return board02Dao.deleteDayList(sqlSession, date);
	}

	@Override
	public int deleteAllDay() {
		return board02Dao.deleteAllDay(sqlSession);
	}

	@Override
	public List<Board02> selectBoardList(int page, int pageSize) {
		
		int offset = (page - 1) * pageSize;
		int end = page * pageSize;
		Map<String, Integer> paramMap = new HashMap<>();
		paramMap.put("start", offset + 1);
		paramMap.put("end", end);
		
		return board02Dao.selectBoardList(sqlSession, paramMap);
	}

	@Override
	public int selectTotalCount() {
		return board02Dao.selectTotalCount(sqlSession);
	}
	
}
