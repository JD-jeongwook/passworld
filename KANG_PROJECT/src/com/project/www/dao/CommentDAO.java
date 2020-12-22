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

import com.project.www.dto.BoardDTO;
import com.project.www.dto.CommentDTO;

public class CommentDAO {
	private static CommentDAO dao = new CommentDAO();
	private DataSource dataSource;
	private final String TABLE_NAME = "comment";
	private final String CONN_POOL_SOURCE = "jdbc/testdb";
	private final String WRITE_COMMENT_SQL = "insert into " + TABLE_NAME + " (list_no,id,profile,comment,gender,admin) values (?,?,?,?,?,?)";
	private final String COMMENT_LIST_SQL = "select * from " + TABLE_NAME + " where list_no=? order by no desc";
	private final String SET_COUNT_SQL = "select count(*) from " + TABLE_NAME + " where list_no=?";
	private final String MODIFY_SQL = "update " + TABLE_NAME + " set comment=?,wTime=now() where no=?";
	private final String DELETE_SQL = "delete from " + TABLE_NAME + " where no=?";
	private final String GROUP_DELETE_SQL = "delete from " + TABLE_NAME + " where list_no=?";
	private final String UPDATE_50_POINT_SQL ="update user_info set point=point+50 where id=?";
	
	private CommentDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONN_POOL_SOURCE);
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static CommentDAO getCommentDAO() {
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
	public void updatePoint(String id) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(UPDATE_50_POINT_SQL);
			pst.setString(1,id);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	} 
	public void writeCommentDAO(CommentDTO dto) {
		Connection conn = getConnection();
		updatePoint(dto.getId());
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(WRITE_COMMENT_SQL);
			pst.setInt(1,dto.getList_no());
			pst.setString(2,dto.getId());
			pst.setString(3,dto.getProfile());
			pst.setString(4,dto.getComment());
			pst.setString(5,dto.getGender());
			pst.setInt(6,dto.getAdmin());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public ArrayList<CommentDTO> commentListDAO(int list_no) {
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(COMMENT_LIST_SQL);
			pst.setInt(1,list_no);
			rs = pst.executeQuery();
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setId(rs.getString("id"));
				dto.setProfile(rs.getString("profile"));
				dto.setComment(rs.getString("comment"));
				dto.setwTime(rs.getString("wTime"));
				dto.setGender(rs.getString("gender"));
				dto.setNo(rs.getInt("no"));
				dto.setAdmin(rs.getInt("admin"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public int setCount(int list_no) {
		int count = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(SET_COUNT_SQL);
			pst.setInt(1,list_no);
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
	public void modifyDAO(CommentDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(MODIFY_SQL);
			pst.setString(1,dto.getComment());
			pst.setInt(2,dto.getNo());
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
	public void groupDeleteDAO(int no) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(GROUP_DELETE_SQL);
			pst.setInt(1,no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
}
