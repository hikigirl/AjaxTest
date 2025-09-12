package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.model.AjaxDAO;
import com.test.java.model.UserDTO;

@WebServlet(value = "/ex08data.do")
public class Ex08Data extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Ex08Data.java
		String m = req.getParameter("m");
		
		if(m.equals("1")) {
			m1(req, resp);
		} else if(m.equals("2")) {
			m2(req, resp);
		} else if(m.equals("3")) {
			m3(req, resp);
		} else if(m.equals("4")) {
			m4(req, resp);
		}
	
	} //doGet
	

	private void m4(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// TODO Auto-generated method stub
		
	}


	private void m3(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 서버가 XML 반환 +단일값
		AjaxDAO dao = new AjaxDAO();
		String question = dao.getSurvey(1).getQuestion();
		
		resp.setContentType("text/xml"); //MIME 
		resp.setCharacterEncoding("UTF-8");
		
		/*
			well-formed xml
			<?xml version="1.0" encoding="UTF-8"?>
			<question id="q1">질문</question>
		*/
		
		PrintWriter writer = resp.getWriter();
		writer.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		writer.printf("<question id=\"q1\">%s</question>", question);
		writer.close();
	}


	private void m2(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//서버가 > 텍스트 반환 + 다중값
		AjaxDAO dao = new AjaxDAO();
		
		List<UserDTO> list = dao.getUsers();
		
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		String temp = "";
		for (UserDTO dto:list) {
			temp += String.format("%s, %s, %s, %s\r\n"
							, dto.getId()
							, dto.getPw()
							, dto.getName()
							, dto.getGrade());
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print(temp); //토큰
		//writer.print("<h1>데이터</h1>");
		writer.close();

	}


	private void m1(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 서버가 텍스트 반환 +단일값
		AjaxDAO dao = new AjaxDAO();
		String question = dao.getSurvey(1).getQuestion();
		
		//서버가 클라이언트에게 돌려주는 데이터의 형식 지정
		// 응답 헤더(response header) 설정
		resp.setContentType("text/plain"); //mime -> 문자열
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.print(question); //토큰
		//writer.print("<h1>데이터</h1>");
		writer.close();
		
	} //m1
}