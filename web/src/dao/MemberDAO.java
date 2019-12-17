package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.MemberVO;

public class MemberDAO {

	final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final static String URL = "jdbc:oracle:thin:@192.168.0.35:1521:orcl";
	String user = "scott";
	String pwd = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public MemberDAO() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, user, pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public MemberVO isExists(String id, String pwd) {
		sb.setLength(0);
		sb.append("SELECT mno, id, name, pwd, point " + "FROM MEMBER " + "WHERE ID = ? " + "AND PWD = ? ");

		MemberVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int mno = rs.getInt("mno");
				String name = rs.getString("name");
				int point = rs.getInt("point");

				vo = new MemberVO();
				vo.setId(id);
				vo.setMno(mno);
				vo.setName(name);
				vo.setPoint(point);
				vo.setPwd(pwd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return vo;
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}

	public boolean insertOne(String email, String name, String pwd) {
		sb.setLength(0);
		boolean b = false;
		sb.append("INSERT INTO MEMBER(mno, id, name, pwd, point) VALUES(member_mno_seq.nextval,?,?,?,10000)");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			pstmt.setString(3, pwd);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		try {
			b = pstmt.execute();
			System.out.println(b + ": 의 리턴값입니다");
		} catch (SQLException e) {
			e.printStackTrace();
			return true;
		} finally {
			this.close();
		}
		return b;
	}

}
