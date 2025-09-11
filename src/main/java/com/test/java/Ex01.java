package com.test.java;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.model.AjaxDAO;
import com.test.java.model.SurveyDTO;

@WebServlet(value = "/ex01.do")
public class Ex01 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Ex01.java
		//1. db작업 -> select
		AjaxDAO dao = new AjaxDAO();
		
		//2.
		SurveyDTO dto = dao.getSurvey(1);
		
		//3.
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex01.jsp");
		dispatcher.forward(req, resp);
	}
}