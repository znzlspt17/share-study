package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MemoVO;;

public class MemoDAO {

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn = null;
	MemoVO vo = null;
	StringBuffer sb = new StringBuffer();

	public MemoDAO() {
		this.conn = MakeConnection.getInstance().getConnection(this);
	}

	@Deprecated
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) FROM MEMO");
		int totalCount = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next())
				totalCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	public ArrayList<MemoVO> selectAll() {
		sb.setLength(0);
		sb.append("SELECT NO, WRITER, CONTENTS, IP, HITS, STATUS FROM MEMO");
		ArrayList<MemoVO> voList = new ArrayList<MemoVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new MemoVO();
				vo.setNo(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setContents(rs.getString(3));
				vo.setIp(rs.getString(4));
				vo.setHits(rs.getInt(5));
				vo.setStatus(rs.getInt(6));
				voList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return voList;
	}

	@Deprecated
	public MemoVO selectOne(int bno) {
		sb.setLength(0);
		sb.append("");
		vo = new MemoVO();
		try {
			pstmt = this.conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	public void add(MemoVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO MEMO VALUES(MEMO_BNO_SEQ.nextval, ?,?,?,0,1) ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getContents());
			pstmt.setString(3, vo.getIp());

			pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Deprecated
	public void modify(int bno, String title, String contents) {
		sb.setLength(0);
		sb.append("UPDATE MEMO  SET CONTENTS = ?  WHERE NO = ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setInt(3, bno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Deprecated
	public void raiseHits(int no) {
		sb.setLength(0);
		sb.append("UPDATE MEMO SET HITS = HITS + 1 WHERE no = ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Deprecated
	public void delete(int no) {
		sb.setLength(0);
		sb.append("DELETE MEMO WHERE NO = ?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Deprecated
	public void delete(int[] no) {
		for (int i = 0; i < no.length; i++) {
			delete(no[i]);
		}
	}

	@Deprecated
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
