package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/ex03data.do")
public class Ex03Data extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Ex03Data.java
		
		System.out.println("호출됨");
		
		//데이터 공급
		//String id = "hong"; //DB에서 가져왔다고 가정해보자
		
		//요청한 곳(ex03.do, 서블릿)에 돌려주기
		//resp.sendRedirect("/ajax/ex03.do?id=" + id);
		
		
		//ajax 객체 요청 -> 응답
		String id = "test"; //DB에서 가져왔다고 가정
		
		int n = 0;
		System.out.println(10/n);
		
		
		PrintWriter writer = resp.getWriter();
		writer.print(id);
		writer.close();
	}
}