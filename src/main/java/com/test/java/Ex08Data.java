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
		} else if(m.equals("5")) {
			m5(req, resp);
		} else if(m.equals("6")) {
			m6(req, resp);
		}
	
	} //doGet
	

	private void m6(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//서버가 json 반환 + 다중값 -> m2()와 동일
		AjaxDAO dao = new AjaxDAO();
		
		List<UserDTO> list = dao.getUsers();
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		/*
			[
				{
					"id": "hong",
					"pw": "1111",
					"name": "홍길동",
					"grade": 1
				},
				{
					"id": "hong",
					"pw": "1111",
					"name": "홍길동",
					"grade": 1
				}
			]
		*/
		
		String temp = "";
		
		temp += "[";
		
		for (UserDTO dto:list) {
			temp += """
				{
					"id": "%s",
					"pw": "%s",
					"name": "%s",
					"grade": %s
				},""".formatted(dto.getId(), dto.getPw(), dto.getName(), dto.getGrade());
		}
		
		temp = temp.substring(0, temp.length()-1);
		
		temp += "]";
		
		PrintWriter writer = resp.getWriter();
		writer.print(temp); //토큰
		//writer.print("<h1>데이터</h1>");
		writer.close();
	}


	private void m5(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//서버가 json 반환 + 단일값 -> m1()
		AjaxDAO dao = new AjaxDAO();
		String question = dao.getSurvey(1).getQuestion();
		
		//서버가 클라이언트에게 돌려주는 데이터의 형식 지정
		// 응답 헤더(response header) 설정
		resp.setContentType("application/json"); //mime -> 문자열
		resp.setCharacterEncoding("UTF-8");
		
		/* 모든 따옴표는 쌍따옴표로
			{
				"question": "질문"
			}
		*/
		
		PrintWriter writer = resp.getWriter();
		writer.printf("""
			{
				"question": "%s"
			}		
		""", question); //토큰
		writer.close();
	}


	private void m4(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//서버가 xml 반환+ 다중값 -> m2()와 동일
		AjaxDAO dao = new AjaxDAO();
		
		List<UserDTO> list = dao.getUsers();
		
		resp.setContentType("text/xml");
		resp.setCharacterEncoding("UTF-8");
		String temp = "";
		/*
			<list>
				<user>
					<id>hong</id>
					<pw>1111</pw>
					<name>홍길동</name>
					<grade>1</grade>
				</user>
				<user>
					<id>dog</id>
					<pw>1111</pw>
					<name>강아지</name>
					<grade>1</grade>
				</user>
				<user>
					<id>cat</id>
					<pw>1111</pw>
					<name>고양이</name>
					<grade>2</grade>
				</user>
			</list>
		*/
		
		temp += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		
		temp += "<list>";
		for (UserDTO dto:list) { //for문 돌면서 xml을 작성
			
//			temp += String.format("%s, %s, %s, %s\r\n", dto.getId(), dto.getPw(), dto.getName(), dto.getGrade());
			
			temp += "<user>";
				temp += "<id>" + dto.getId() + "</id>";
				temp += "<pw>" + dto.getPw() + "</pw>";
				temp += "<name>" + dto.getName() + "</name>";
				temp += "<grade>" + dto.getGrade() + "</grade>";	
			temp += "</user>";
			
		}
		temp += "</list>";
		
		PrintWriter writer = resp.getWriter();
		writer.print(temp); //토큰
		//writer.print("<h1>데이터</h1>");
		writer.close();

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