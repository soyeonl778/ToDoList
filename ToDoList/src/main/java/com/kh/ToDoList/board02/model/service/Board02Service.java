package com.kh.ToDoList.board02.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.ToDoList.board02.model.vo.Board02;
import com.kh.ToDoList.board02.model.vo.TodoList02;

public interface Board02Service {

	ArrayList<TodoList02> selectList(String date);

	int insertList(String task, String date);

	int deleteList(int hiddenNo);

	int deleteDayList(String date);

	int deleteAllDay();

	List<Board02> selectBoardList(int page, int pageSize);

	int selectTotalCount();

	int insertPost(String titleInput, String nameInput, String descTextArea);

	Board02 selectBoardOne(int hiddenNo);

	int confirmUpdate(Map<String, Object> parameter);

	int deletePost(int boardNo);

}
