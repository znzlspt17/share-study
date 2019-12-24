package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.net.aso.s;
import vo.ProductVO;

public class ProductDAO {
	// jdbc:oracle:thin:@192.168.0.35:1521:orcl
	// aws-oracle.cojg4lvzztxm.ap-northeast-2.rds.amazonaws.com
	final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final static String URL = "jdbc:oracle:thin:@192.168.0.35:1521:orcl";
	String user = "scott";
	String pwd = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	ProductVO vo = null;

	public ProductDAO() {
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
		sb.append("SELECT pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile FROM product");
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
		sb.append("SELECT pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile FROM product where pno = ?");
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

		sb.append("INSERT INTO PRODUCT(pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile) "
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
		sb.append("INSERT INTO PRODUCT(pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile) "
				+ "VALUES(PRODUCT_PNO_SEQ.nextval,?,?,?,?,?,?,?)");
		int pno = vo.getPno();
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ProductVO findByName(String name) {
		ProductVO vo = null;
		sb.setLength(0);
		sb.append("SELECT pno, pname, price, dcratio, prodesc, qty, imgfile, bigfile FROM PRODUCT WHERE pname = ?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new ProductVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getString(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	public void delete(int pno) {
		sb.setLength(0);
		sb.append("DELETE * FROM MEMBER WHERE PNO = ?");
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
