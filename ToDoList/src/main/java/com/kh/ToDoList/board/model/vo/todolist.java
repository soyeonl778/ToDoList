package com.kh.ToDoList.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class todolist {
	
	private int todoNo;	//	TODO_NO
	private String todoDesc; //	TODO_DESC
	private Date todoDate; //	TODO_DATE
	private String status; //	STATUS

}
