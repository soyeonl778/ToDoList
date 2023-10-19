package com.kh.ToDoList.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Board {
	
	private int boardNo;  // 글번호
	private String boardTitle; // 글제목
	private String boardDesc; // 글내용
	private String createDate; // 글쓴날짜
	private String status;
	private int userNo; 
	private int category;
	

}
