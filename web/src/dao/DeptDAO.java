package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import vo.DeptVO;

public class DeptDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@aws-oracle.cojg4lvzztxm.ap-northeast-2.rds.amazonaws.com:1521:orcl";
	String user = "znzlspt17";
	String password = "rootroot";
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	StringBuffer sb = new StringBuffer();
	ArrayList<DeptVO> deptList = new ArrayList<DeptVO>();

	public DeptDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("����̹� ȣ�� ����");
		} catch (SQLException e) {
			System.out.println("SQL ���� ����");
		}
	}

	public DeptVO selectOne(int deptno) {
		sb.setLength(0);
		sb.append("SELECT DEPTNO, DNAME, LOC FROM DEPT WHERE DEPTNO = ?");
		DeptVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			rs.next();
			String dname = rs.getString("dname");
			String loc = rs.getString("loc");

			vo = new DeptVO();
			vo.setDeptno(deptno);
			vo.setDname(dname);
			vo.setLoc(loc);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	public void insertOne(String dname, String loc) {
		sb.setLength(0);
		sb.append("INSERT INTO DEPT VALUES (DEPT_DEPTNO.NEXTVAL, ?, ?)");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
	}

	public void deleteOn(int deptno) {
		sb.setLength(0);
		sb.append("DELETE FROM DEPT WHERE DEPTNO = ?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, deptno);

			int result = pstmt.executeUpdate();
			if (result == 0)
				System.out.println("�ֹ��͵� ���� : 0");
			else if (result == 1)
				System.out.println("�ϳ��� ���� : 1");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
	}

	public void updateOne(int deptno, String dname, String loc) {
		sb.setLength(0);
		sb.append("UPDATE DEPT SET DNAME= ? , LOC =  ?  WHERE DEPTNO = ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);
			pstmt.setInt(3, deptno);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<DeptVO> selectAll() {
		sb.setLength(0);
		sb.append("SELECT deptno, dname, loc FROM dept");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				DeptVO vo = new DeptVO();
				vo.setDeptno(deptno);
				vo.setDname(dname);
				vo.setLoc(loc);
				deptList.add(vo);
			}
		} catch (Exception e) {
		}
		return deptList;
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}

}