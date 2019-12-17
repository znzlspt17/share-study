package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import oracle.net.aso.s;
import vo.ProductVO;

public class GProductDAO {
	//jdbc:oracle:thin:@192.168.0.35:1521:orc
	//aws-oracle.cojg4lvzztxm.ap-northeast-2.rds.amazonaws.com
	final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final static String URL = "jdbc:oracle:thin:@aws-oracle.cojg4lvzztxm.ap-northeast-2.rds.amazonaws.com:1521:orcl";
	String user = "znzlspt17";
	String pwd = "rootroot";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	ProductVO vo = null;

	public GProductDAO() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, user, pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ProductVO> selectAll() {
		sb.setLength(0);
		sb.append("SELECT pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile FROM gproduct");
		ArrayList<ProductVO> voList = new ArrayList<ProductVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new ProductVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getString(8));
				voList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return voList;
	}

	public ProductVO selectOne(int pno) {
		sb.setLength(0);
		sb.append("SELECT pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile FROM gproduct where pno = ?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new ProductVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public boolean insertOne(int price, int dcratio, int qty, String pname, String prodesc, String imgfile,
			String bigfile) {
		sb.setLength(0);
		boolean b = false;

		sb.append("INSERT INTO gproduct(pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile) "
				+ "VALUES(PRODUCT_PNO_SEQ.nextval,?,?,?,?,?,?,?)");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, pname);
			pstmt.setInt(2, price);
			pstmt.setInt(3, dcratio);
			pstmt.setString(4, prodesc);
			pstmt.setInt(5, qty);
			pstmt.setString(6, imgfile);
			pstmt.setString(7, bigfile);
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public void modify(ProductVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO gproduct(pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile) "
				+ "VALUES(gproduct_PNO_SEQ.nextval,?,?,?,?,?,?,?)");
		int pno = vo.getPno();
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(int pno) {
		sb.setLength(0);
		sb.append("DELETE * FROM GPRODUCT WHERE PNO = ?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
}
