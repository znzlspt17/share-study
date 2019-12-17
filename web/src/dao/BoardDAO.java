package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BoardVO;

public class BoardDAO {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn = null;
	BoardVO vo = null;
	StringBuffer sb = new StringBuffer();

	public BoardDAO() {
		this.conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<BoardVO> selectAll() {

		sb.setLength(0);
		sb.append("SELECT BNO, WRITER, TITLE, CONTENTS, to_char(regdate, 'yyyy/mm/dd') REGDATE, HITS, IP ,STATUS FROM BOARD");
		ArrayList<BoardVO> voList = new ArrayList<BoardVO>();
		try {
			pstmt = this.conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new BoardVO();
				vo.setBno(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContents(rs.getString(4));
				vo.setRegdate(rs.getString(5));
				vo.setHits(rs.getInt(6));
				vo.setIp(rs.getString(7));
				vo.setStatus(rs.getInt(8));
				voList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return voList;
	}

	public BoardVO selectOne(int bno) {
		sb.setLength(0);
		sb.append("SELECT BNO, WRITER, TITLE, CONTENTS, to_char(regdate, 'yyyy/mm/dd') REGDATE, HITS, IP ,STATUS FROM BOARD WHERE BNO = ?");
		vo = new BoardVO();
		try {
			pstmt = this.conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.setBno(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContents(rs.getString(4));
				vo.setRegdate(rs.getString(5));
				vo.setHits(rs.getInt(6));
				vo.setIp(rs.getString(7));
				vo.setStatus(rs.getInt(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	public void add(BoardVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO BOARD VALUES(BOARD_BNO_SEQ.nextval,?,?,?,SYSDATE,0,?,1) ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
			pstmt.setString(4, vo.getIp());
			pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void modify(int bno, String title, String contents) {
		sb.setLength(0);
		sb.append("UPDATE BOARD  SET TITLE = ? , CONTENTS = ?  WHERE BNO = ? ");
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

	public void delete(int bno) {
		sb.setLength(0);
		sb.append("DELETE BOARD WHERE BNO = ?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
