package com.test.java.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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

}