package com.exam.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.exam.dto.BbsDto;

public class BbsDao {
	private static BbsDao bbsDao = new BbsDao();
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result = 0;
	
	private BbsDao() {
		super();
	}

	public static BbsDao getInstance() {
		return bbsDao;
	}
	
	//DB연결
	public Connection getConnect() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "scott", pw = "tiger";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//게시글 숫자 세기
	public int nextval() {
		con = getConnect();
		StringBuffer query = new StringBuffer();
		query.append("SELECT MAX(bbsId) ").append("FROM bbs");
		
		try {
			pstmt = con.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt("MAX(bbsId)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return result;
	}
	
	//글쓰기
	public int write(BbsDto bbsDto) {
		con = getConnect();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO bbs ");
		query.append("(bbsId, bbsTitle, bbsContent, bbsDate, bbsHit, bbsCategory, id) ");
		query.append("VALUES (?, ?, ?, sysdate, 0, ?, ?)");
		try {
			pstmt = con.prepareStatement(query.toString());
			pstmt.setInt(1, bbsDto.getBbsId());
			pstmt.setString(2, bbsDto.getBbsTitle());
			pstmt.setString(3, bbsDto.getBbsContent());
			pstmt.setString(4, bbsDto.getBbsCategory());
			pstmt.setString(5, bbsDto.getId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, null);
		}
		return result;
	}
	
	//전체 보기
	
	public List<BbsDto> selectList(){
		List<BbsDto> list = new ArrayList<>();
		
		try {
			con = getConnect();
			String sql ="SELECT * FROM bbs ORDER BY bbsId DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BbsDto bbsDto = new BbsDto();
				bbsDto.setBbsId(rs.getInt("bbsId"));
				bbsDto.setBbsTitle(rs.getString("bbsTitle"));
				bbsDto.setBbsContent(rs.getString("bbsContent"));
				bbsDto.setBbsDate(rs.getTimestamp("bbsDate"));
				bbsDto.setBbsHit(rs.getInt("bbsHit"));
				bbsDto.setBbsCategory(rs.getString("bbsCategory"));
				bbsDto.setId(rs.getString("id"));
				list.add(bbsDto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public int hitUpdate(String bbsId) {
		con = getConnect();
		String sql = "UPDATE bbs SET bbsHit = bbsHit + 1 WHERE bbsId = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbsId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, null);
		}
		return result;
	}
	
	public BbsDto selectById(String bbsId) {
		BbsDto bbsDto = new BbsDto();
		con = getConnect();
		String sql = "SELECT * FROM bbs WHERE bbsId = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbsId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bbsDto.setBbsId(rs.getInt("bbsid"));
				bbsDto.setBbsTitle(rs.getString("bbstitle"));
				bbsDto.setBbsContent(rs.getString("bbscontent"));
				bbsDto.setBbsDate(rs.getTimestamp("bbsdate"));
				bbsDto.setBbsHit(rs.getInt("bbshit"));
				bbsDto.setBbsCategory(rs.getString("bbscategory"));
				bbsDto.setId(rs.getString("id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return bbsDto;
	}
	
	//게시글 삭제
	public int del(int bbsId) {
		con = getConnect();
		String sql = "DELETE FROM bbs WHERE bbsId = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bbsId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, null);
		}
		return result;
	}
	
	//게시글 수정
	public int update(BbsDto bbsDto) {
		con = getConnect();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE bbs1 SET bbsTitle = ?, ");
		query.append("bbsContent = ?, ");
		query.append("bbsCategory = ? ");
		query.append("WHERE bbsId = ?");
		
		try {
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1, bbsDto.getBbsTitle());
			pstmt.setString(2, bbsDto.getBbsContent());
			pstmt.setString(3, bbsDto.getBbsCategory());
			pstmt.setInt(4, bbsDto.getBbsId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, null);
		}
		return result;
	}

}