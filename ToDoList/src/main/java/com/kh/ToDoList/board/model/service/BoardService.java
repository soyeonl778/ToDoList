package com.kh.ToDoList.board.model.service;

import java.util.ArrayList;

import com.kh.ToDoList.board.model.vo.Board;
import com.kh.ToDoList.board.model.vo.todolist;
import com.kh.ToDoList.common.model.vo.PageInfo;

public interface BoardService {
	
	ArrayList<todolist> selectDoList(String date);
	
	int insertToDoList(String task, String date);

	int deleteListDay(String date);

	int deleteOneList(int hiddenNo);
	
	int deleteAllDayList();

	//여기서부터 게시판
	
	int selectListCount();

	ArrayList<Board> selectListView(PageInfo pi);

	int insertBoard(Board b);
	

}
