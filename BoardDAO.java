package com.conan.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.beans.d.MemberDAO;
import org.beans.d.MemberDTO;

public class BoardDAO {

	
	// singleton
	private static BoardDAO dao = new BoardDAO(); //

	public static BoardDAO getInstance() {
		return dao;
	}
	//Singleton 클래스를 만들기 위해 생성자를 private로 선언
	//기본 생성자
	private BoardDAO()  {
	
	}
	//DB 연결 객체 반환
	public Connection getConnection() {
		System.out.println("test");
		Connection conn = null;
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			conn = ds.getConnection();// 연결
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	//DB 연결 닫기
	public void close (Connection conn, PreparedStatement pstmt, ResultSet rs) {
		//실행된 순서 반대로 닫기
		
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	//DB 연결 닫기
	public void close (Connection conn, PreparedStatement pstmt) {
		//실행된 순서 반대로 닫기
		
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//게시글 전체 목록 반환	
	public List <BoardVO> selectBoardAll() {
		
		/*List<BoardVO> boardList = new ArrayList<BoardVO>(); //리스트에 데이터 담을 공간 생성*/		
		List<BoardVO> bList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null; 
		
		try {
			bList = new ArrayList<BoardVO>();
			conn = dao.getConnection();
			sql = "select * from boardtest";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) { // 여러 값을 넣을 때만
				//int boardNo, String userId, String title, String content, String regDate)
				bList.add(new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
										  rs.getString(4), rs.getString(5), rs.getInt(6)));

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {close(conn, pstmt, rs);}
		return bList;

		
	}
	
	
	  //특정 게시글 정보 반환 
	public BoardVO selectBoard(Integer boardNo) { 
	BoardVO vo = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn = null;
	String sql = null;
	  
	  try { 
		  sql = "selet * from boardtest where boardNo=?"; //Integer boardNo
		  conn = dao.getConnection();
		  pstmt = conn.prepareStatement(sql);
		  rs = pstmt.executeQuery();
		  rs.next(); 
	  
	  //int boardNo, String userId, String title, String content, String regDate)
	  vo = new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3),
			  			rs.getString(4), rs.getString(5), rs.getInt(6)); 
	  } catch (Exception e) { // TODO Auto-generated catch block e.printStackTrace(); }
		  e.printStackTrace();
	  } finally {close(conn, pstmt, rs);} return vo;
	 
	}
	  //게시글 저장 
	  public int insertBoard(BoardVO vo) { //삽입하기 
		int result = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		String sql = null;
		
		 try { 
			  sql = "insert into boardtest values(bsequence.nextval,?,?,?,to_char(sysdate, 'yyyy/mm/d hh24:mi:ss'),0)"; 
			  conn = dao.getConnection();
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, vo.getUserId()); //기본생성자 지정해야 하는 이유
			  pstmt.setString(2, vo.getTitle()); 
			  pstmt.setString(3, vo.getContent());
			  result = pstmt.executeUpdate();
			  //dao.close(conn, pstmt);
		 } catch(Exception e) {
			 e.printStackTrace();
		 }finally {close(conn, pstmt);} return result;
	  }
	  //게시글 번호에 해당하는 게시글 수정 
	  public int updateBoard(BoardVO vo) {
		  int result = 0;
			PreparedStatement pstmt = null;
			Connection conn = null;
			String sql = null;
			
			try {
				sql = "update boardtest set title=?, content=? where boardNo=?";
				conn = dao.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getContent());
				result = pstmt.executeUpdate();
				//dao.close(conn, pstmt);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {close(conn, pstmt);}return result;
	  } 
	  
	  //게시글 번호에 해당하는 게시글 삭제 
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
				//dao.close(conn, pstmt);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {close(conn, pstmt);}return result;
	  } 
	 
	  //게시글 개수 반환 
	  public int getListCount() {
		  int result = 0;
			PreparedStatement pstmt = null;
			Connection conn = null;
			String sql = null;
			ResultSet rs = null;
			
			try {
				sql = "select count(*) from boardtest";
				conn = dao.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				result = rs.getInt(1);
				//dao.close(conn, pstmt, rs);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {close(conn, pstmt, rs);}return result;
		}
		  

	  //조회수 증가 //현재 조회수를 읽어와서 1 증가 시킨 후 테이블에 저장 
	  public int increaseHit(Integer boardNo) {
			int result = 0;
			int orgHit = 0;
			PreparedStatement pstmt = null;
			Connection conn = null;
			String sql = null;
			ResultSet rs = null;
			
			try {
				sql = "select hit from boardtest where boardNo=?";
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
				
				//dao.close(conn, pstmt, rs);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {close(conn, pstmt, rs);}return result;
		}

	}
	 