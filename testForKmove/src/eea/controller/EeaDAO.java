package eea.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class EeaDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	public EeaDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/MySQL");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<EeaVO> eea() {
		List<EeaVO> articlesList = new ArrayList();
		try {
			conn = dataFactory.getConnection();
			String query = "select * from  articles where source='EEA'"; // SQL문 작성
			System.out.println(query);
			pstmt = conn.prepareStatement(query); // PrepareStatement 객체를 생성하면서 SQL문을 인자로 전달 
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				String source = rs.getString("source");
				String title = rs.getString("title");
				String link = rs.getString("link");
				EeaVO eeaVO = new EeaVO(no, source, title, link); // 조회한 기사정보를 레코드별로 EeaVO 객체의 속성에 저장
				articlesList.add(eeaVO); // articlesList에 eeaVO 객체들을 차례대로 저장
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return articlesList;
	}

	
}
