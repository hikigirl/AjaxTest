package com.test.java.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.util.DBUtil;

public class AjaxDAO {

	private DBUtil util;
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public AjaxDAO() {
		try {
			util = new DBUtil();
			conn = util.open();
			stat = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//기본키를 넘겨서 select문
	public SurveyDTO getSurvey(int seq) {
		try {
			String sql = "SELECT * FROM tblSurvey WHERE seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, seq);
			
			rs = pstat.executeQuery();
			
			SurveyDTO dto = new SurveyDTO();
			if(rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setQuestion(rs.getString("question"));
				dto.setItem1(rs.getString("item1"));
				dto.setItem2(rs.getString("item2"));
				dto.setItem3(rs.getString("item3"));
				dto.setItem4(rs.getString("item4"));
				dto.setCnt1(rs.getInt("cnt1"));
				dto.setCnt2(rs.getInt("cnt2"));
				dto.setCnt3(rs.getInt("cnt3"));
				dto.setCnt4(rs.getInt("cnt4"));
				
				return dto;
			}
			
			
		} catch (Exception e) {
			// handle exception
			System.out.println("AjaxDAO.getSurvey()");
			e.printStackTrace();
		}
		return null;
	}
	
	public String getInsa(String num3) {
		
		try {
			
			String sql = "select name from tblInsa where num = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, num3);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("name");
			}
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.getInsa()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int checkId(String id) {
		try {
			String sql = "SELECT count(*) AS cnt FROM TBLUSER WHERE id=?";
			pstat=conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			// handle exception
			System.out.println("AjaxDAO.checkId()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int searchZipcode(String dong) {
		try {
			String sql = "SELECT * FROM ZIPCODE WHERE dong LIKE '%?%'";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dong);
			rs = pstat.executeQuery();
			
			
		} catch (Exception e) {
			// handle exception
			System.out.println("AjaxDAO.searchZipcode()");
			e.printStackTrace();
		}
		return 0;
	}

	public List<UserDTO> getUsers() {
		try {
			String sql = "select * from tblUser";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			List<UserDTO> list = new ArrayList<UserDTO>();
			
			while(rs.next()) {
				//레코드1줄 -> dto1개
				UserDTO dto = new UserDTO();
				
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setGrade(rs.getString("grade"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			// handle exception
			System.out.println("AjaxDAO.getUsers()");
			e.printStackTrace();
		}
		return null;
	}

}