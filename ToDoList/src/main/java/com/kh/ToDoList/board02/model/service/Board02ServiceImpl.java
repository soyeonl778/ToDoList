package com.kh.ToDoList.board02.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ToDoList.board02.model.dao.Board02Dao;

@Service
public class Board02ServiceImpl implements Board02Service {

	@Autowired
	private Board02Dao board02Dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
