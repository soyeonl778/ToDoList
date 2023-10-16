package com.kh.ToDoList.board02.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TodoList02 {

	private int todoNo;
	private String todoDesc;
	private Date todoDate;
	private String status;
	
}
