package com.kh.ToDoList.board02.model.service;

import java.util.ArrayList;

import com.kh.ToDoList.board02.model.vo.TodoList02;

public interface Board02Service {

	ArrayList<TodoList02> selectList(String date);

	int insertList(String task, String date);

	int deleteList(int hiddenNo);

	int deleteDayList(String date);

	int deleteAllDay();

}
