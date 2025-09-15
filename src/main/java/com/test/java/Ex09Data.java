package com.test.java;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.java.model.AddressDTO;
import com.test.java.model.AjaxDAO;

@WebServlet(value = "/ex09data.do")
public class Ex09Data extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Ex09Data.java
		AjaxDAO dao = new AjaxDAO();
		List<AddressDTO> list = dao.addressList();
		
		//list>json 생성 + 반환
		//System.out.println(list);
		
		//자바 데이터를 json으로 변환해주는 라이브러리 -> json-simple
		//1. json을 자바데이터
		//2. 자바데이터를 json문자열
		
		//list -> json
		JSONArray arr = new JSONArray();
		
		for (AddressDTO dto: list) {
			//addressdto -> jsonobject로 변환
			JSONObject obj = new JSONObject();
			obj.put("seq", dto.getSeq());
			obj.put("name", dto.getName());
			obj.put("age", dto.getAge());
			obj.put("gender", dto.getGender());
			obj.put("tel", dto.getTel());
			obj.put("address", dto.getAddress());
			obj.put("regdate", dto.getRegdate());
			
			arr.add(obj);
			//System.out.println(obj.toString()); //JSONObject 형태

		}
		//System.out.println(arr.toString()); //JSONArray 형태
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().print(arr.toString());
		resp.getWriter().close();
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 주소록 추가하기
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		
		System.out.println(name);
		System.out.println(age);
		System.out.println(gender);
		System.out.println(tel);
		System.out.println(address);
		
		AjaxDAO dao = new AjaxDAO();
		
		AddressDTO dto = new AddressDTO();
		dto.setName(name);
		dto.setAge(age);
		dto.setGender(gender);
		dto.setTel(tel);
		dto.setAddress(address);
		
		int result = dao.addAddress(dto); //성공하면 1, 실패하면 0
		String seq = dao.getAddressSeq();
		
		
		resp.setContentType("application/json");
//		{
//			"result": 1,
//			"seq": 100
//		}

		JSONObject obj = new JSONObject();
		obj.put("result", result);
		obj.put("seq", seq);
		
		resp.getWriter().print(obj.toString());
		resp.getWriter().close();
		
	}
	
}