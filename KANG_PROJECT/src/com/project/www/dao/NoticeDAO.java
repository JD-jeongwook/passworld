package com.project.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.project.www.dto.NoticeDTO;

public class NoticeDAO {
	private static NoticeDAO dao = new NoticeDAO();
	private int numOfPage = 20;
	private int boardPage = 10;
	private final String TABLE_NAME = "notice_table";
	private final String CONN_POOL_SOURCE = "jdbc/testdb";
	private DataSource dataSource;
	private final String GET_COUNT_SQL = "select count(*) from " + TABLE_NAME;
	private final String GET_LIST_SQL = "select * from " + TABLE_NAME + " order by no desc limit ?,?";
	private final String NOTICE_WRITE_SQL = "insert into " + TABLE_NAME + " (title,contents) values(?,?)";
	private final String UPDATE_HIT_SQL = "update " + TABLE_NAME + " set hit=hit+1 where no=?";
	private final String GET_DTO_SQL = "select * from " + TABLE_NAME + " where no=?";
	private final String MODIFY_SQL = "update " + TABLE_NAME + " set title=?,contents=? where no=?";
	private final String DELETE_SQL = "delete from " + TABLE_NAME + " where no=?";
	
	private NoticeDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/" + CONN_POOL_SOURCE);
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static NoticeDAO getDAO() {
		return dao;
	}
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public void close(Connection conn,PreparedStatement pst,ResultSet rs) {
		try {
			if(conn != null) conn.close();
			if(pst != null) pst.close();
			if(rs != null) rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void close(Connection conn,PreparedStatement pst) {
		try {
			if(conn != null) conn.close();
			if(pst != null) pst.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public int getCount() {
		int count = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			 pst = conn.prepareStatement(GET_COUNT_SQL);
			 rs = pst.executeQuery();
			 if(rs.next()) {
				 count = rs.getInt(1);
			 }
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return count;
	}
	public int getMaxPage(int count) {
		int maxPage = count/numOfPage;
		maxPage = count%numOfPage==0? maxPage-1 : maxPage;
		return maxPage;
	}
	public int boardMaxPage(int count) {
		int maxPage = count/boardPage;
		maxPage = count%boardPage==0? maxPage-1 : maxPage;
		return maxPage;
	}
	public ArrayList<NoticeDTO> listDAO(int curPage) {
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_LIST_SQL);
			pst.setInt(1,curPage * numOfPage);
			pst.setInt(2,numOfPage);
			rs = pst.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				dto.setwTime(rs.getString("wTime"));
				dto.setHit(rs.getInt("hit"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public ArrayList<NoticeDTO> listBoardDAO(int curPage) {
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_LIST_SQL);
			pst.setInt(1,curPage * boardPage);
			pst.setInt(2,boardPage);
			rs = pst.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				dto.setwTime(rs.getString("wTime"));
				dto.setHit(rs.getInt("hit"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public void writeDAO(NoticeDTO dto ) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(NOTICE_WRITE_SQL);
			pst.setString(1,dto.getTitle());
			pst.setString(2,dto.getContents());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void updateHit(int no) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(UPDATE_HIT_SQL);
			pst.setInt(1,no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public NoticeDTO getDTO(int no) {
		NoticeDTO dto = new NoticeDTO();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_DTO_SQL);
			pst.setInt(1,no);
			rs = pst.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				dto.setwTime(rs.getString("wTime"));
				dto.setHit(rs.getInt("hit"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return dto;
	}
	public NoticeDTO viewDAO(int no) {
		updateHit(no);
		NoticeDTO dto = getDTO(no);
		return dto;
	}
	public void modifyDAO(NoticeDTO dto ) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(MODIFY_SQL);
			pst.setString(1,dto.getTitle());
			pst.setString(2,dto.getContents());
			pst.setInt(3,dto.getNo());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void deleteDAO(int no) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(DELETE_SQL);
			pst.setInt(1,no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally { 
			close(conn,pst);
		}
	}
}
