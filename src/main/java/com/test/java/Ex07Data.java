package com.test.java;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.model.AjaxDAO;

@WebServlet(value = "/ex07data.do")
public class Ex07Data extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Ex07Data.java
		String dong = req.getParameter("dong");
		AjaxDAO dao = new AjaxDAO();
		
		int result = dao.searchZipcode(dong);
		
		resp.getWriter().print(result);
		resp.getWriter().close();
		
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex07data.jsp");
//		dispatcher.forward(req, resp);
	}
}