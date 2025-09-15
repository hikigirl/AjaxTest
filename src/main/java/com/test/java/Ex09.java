package com.test.java;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/ex09.do")
public class Ex09 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Ex09.java
		
		//이전 구현 ->SSR(server-side)
		//1. 서블릿 호출(ex09.do)
		//2. db작업 -> 목록
		//3. 목록 -> jsp 전달 -> 출력
		
		//이번 구현 ->CSR(client-side) + ajax
		//1. 서블릿(ex09.do) -> 아무것도 안함
		//2. JSP 페이지 -> ajax 사용 -> 서버에게 목록 요청
		//3. 서블릿(ex09data.do) 응답 -> db작업 -> 목록 -> ajax에게 반환
		//4. 반환받은 목록을 jsp가 화면에 출력(JavaScript 사용)
		
		//CSR
		// - Vue, React, Angular
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex09.jsp");
		dispatcher.forward(req, resp);
	}
}