package com.test.java;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/ex03.do")
public class Ex03 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Ex03.java
		
		//ex03.do로 부르는 경우 -> 처음 방문
		//ex03.do?id=hong으로 부르는 경우 -> 데이터 가지고 방문
		
		//id값이 존재할때에만 값을 전달
		String id = req.getParameter("id");
		if (id != null) {
			req.setAttribute("id", id);
		}
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex03.jsp");
		dispatcher.forward(req, resp);
	}
}