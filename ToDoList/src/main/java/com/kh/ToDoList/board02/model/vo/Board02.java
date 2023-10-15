package com.kh.ToDoList.board02.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Board02 {
	
	private int boardNo;		// BOARD_NO	NUMBER
	private String boardTitle;  // BORAD_TITLE	VARCHAR2(250 BYTE)
	private String boardDesc;	// BORAD_DESC	VARCHAR2(2000 BYTE)
	private String createDate;	// CREATE_DATE	DATE
	private String status;		// STATUS	CHAR(1 BYTE)
	private int userNo;			// USER_NO	NUMBER
	private int category;		// CATEGORY	NUMBER

}
