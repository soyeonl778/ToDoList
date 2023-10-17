package com.kh.ToDoList.board.model.service;

import java.util.ArrayList;

import com.kh.ToDoList.board.model.vo.todolist;

public interface BoardService {
	
	ArrayList<todolist> selectDoList(String date);
	
	int insertToDoList(String task, String date);

	int deleteListDay(String date);

	int deleteOneList(int hiddenNo);
	
	int deleteAllDayList();

}
