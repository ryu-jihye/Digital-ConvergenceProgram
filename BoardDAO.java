package org.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	private BoardDAO() {}

	private static BoardDAO dao = new BoardDAO();

	public static BoardDAO getInstance() {
		return dao;
	}

	public Connection getConnection() {
		Connection conn = null;

		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
			conn = ds.getConnection();

		}catch (Exception e) {
			e.printStackTrace();
		}return conn;
	}
	
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			pstmt.close(); rs.close(); conn.close();
	
		}catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	public void close(Connection conn, PreparedStatement pstmt) {
		try {
			pstmt.close(); conn.close();
	
		}catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	public List<BoardVO> selectBoardAll(){
		List<BoardVO> bList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		String sql = null;
		
		try {
			bList = new ArrayList<BoardVO>();
		 	conn = dao.getConnection();
		 	sql = "select * from board order by boardNo asc";
		 	pstmt = conn.prepareStatement(sql);
		 	rs = pstmt.executeQuery();
		 	
		 	while(rs.next()) {
		 		bList.add(new BoardVO(rs.getInt(1),rs.getString(2),rs.getString(3)
		 				,rs.getString(4),rs.getString(5),rs.getInt(6)));
		 	}
		 	dao.close(conn, pstmt, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}return bList;
	}
	
	public BoardVO selectBoard(int boardNo) {
		BoardVO vo = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		String sql = null;
		
		try {
			sql = "select * from board where boardNo=?";
			conn = dao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo = new BoardVO(rs.getInt(1),rs.getString(2),rs.getString(3)
	 				,rs.getString(4),rs.getString(5),rs.getInt(6));
			
			dao.close(conn, pstmt, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}return vo;
	}
	
	public int insertBoard(BoardVO vo) {
		int result = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		String sql = null;
		
		try {
			sql = "insert into board values(bsequence.nextval,?,?,?,to_char(sysdate, 'yyyy/mm/d hh24:mi:ss'),0)";
			conn = dao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			result = pstmt.executeUpdate();
			dao.close(conn, pstmt);
		}catch (Exception e) {
			e.printStackTrace();
		}return result;
	}
	
	public int updateBoard(BoardVO vo) {
		int result = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		String sql = null;
		
		try {
			sql = "update board set title=?, content=? where boardNo=?";
			conn = dao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			result = pstmt.executeUpdate();
			dao.close(conn, pstmt);
		}catch (Exception e) {
			e.printStackTrace();
		}return result;
	}
	
	public int deleteBoard(BoardVO vo) {
		int result = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		String sql = null;
		
		try {
			sql = "delete table board where boardNo=?";
			conn = dao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBoardNo());
			result = pstmt.executeUpdate();
			dao.close(conn, pstmt);
		}catch (Exception e) {
			e.printStackTrace();
		}return result;
	}
	
	public int getListCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			sql = "select count(*) from board";
			conn = dao.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
			dao.close(conn, pstmt, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}return result;
	}
	
	public int increaseHit(Integer boardNo) {
		int result = 0;
		int orgHit = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			sql = "select hit from board where boardNo=?";
			conn = dao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			rs.next();
			orgHit = rs.getInt(1);
			
			sql = "update board set hit=? where boardNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orgHit+1);
			pstmt.setInt(2, boardNo);
			result = pstmt.executeUpdate();
			
			dao.close(conn, pstmt, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}return result;
	}

}
