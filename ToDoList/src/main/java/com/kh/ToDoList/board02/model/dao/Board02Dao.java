package com.kh.ToDoList.board02.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ToDoList.board02.model.vo.TodoList02;

@Repository
public class Board02Dao {

	public ArrayList<TodoList02> selectList(SqlSessionTemplate sqlSession, String date) {
		return (ArrayList)sqlSession.selectList("todoList02Mapper.selectList", date);
	}

	public int insertList(SqlSessionTemplate sqlSession, String task, String date) {
		
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("task", task);
		parameter.put("date", date);
		
		return sqlSession.insert("todoList02Mapper.insertList", parameter);
	}

	public int deleteList(SqlSessionTemplate sqlSession, int hiddenNo) {
		return sqlSession.update("todoList02Mapper.deleteList", hiddenNo);
	}

}
