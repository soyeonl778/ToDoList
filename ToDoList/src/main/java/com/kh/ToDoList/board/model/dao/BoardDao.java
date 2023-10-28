package com.kh.ToDoList.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ToDoList.board.model.vo.Board;
import com.kh.ToDoList.board.model.vo.todolist;
import com.kh.ToDoList.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	public ArrayList<todolist> selectDoList(SqlSessionTemplate sqlSession, String date) {
		return (ArrayList)sqlSession.selectList("todoListMapper.selectDoList", date);
	}

	public int insertToDoList(SqlSessionTemplate sqlSession, String task, String date) {
		
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("task", task);
		parameter.put("date", date);
		return sqlSession.insert("todoListMapper.insertToDoList",parameter);
	}

	public int deleteListDay(SqlSessionTemplate sqlSession, String date) {
		return sqlSession.update("todoListMapper.deleteListDay", date);
	}

	public int deleteOneList(SqlSessionTemplate sqlSession, int hiddenNo) {
		return sqlSession.update("todoListMapper.deleteOneList", hiddenNo);
	}

	public int deleteAllDayList(SqlSessionTemplate sqlSession) {
		return sqlSession.update("todoListMapper.deleteAllDayList");
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public ArrayList<Board> selectListView(SqlSessionTemplate sqlSession, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectListView", pi);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
}
