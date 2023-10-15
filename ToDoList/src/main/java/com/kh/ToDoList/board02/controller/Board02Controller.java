package com.kh.ToDoList.board02.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.ToDoList.board02.model.service.Board02Service;

@Controller
public class Board02Controller {

	@Autowired
	private Board02Service board02Service;
	
	
}
