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

import com.project.www.dto.ReserveDTO;

public class ReserveDAO {
	private static ReserveDAO dao = new ReserveDAO();
	private final String TABLE_NAME = "user_reserve";
	private final String CONN_POOL_SOURCE = "jdbc/testdb";
	private DataSource dataSource;
	private final String RESERVE_SQL = "insert into " + TABLE_NAME + " (id,st_country,st_airport,arr_country,arr_airport,st_day,arr_day,air_line,adult,child) values(?,?,?,?,?,?,?,?,?,?)";
	private final String USER_RESERVE_COUNT_SQL = "select count(*) from " + TABLE_NAME + " where id=?";
	private final String GET_MIN_NO_SQL = "select min(no) from " + TABLE_NAME + " where id=?";
	private final String AUTO_DELETE_OVER_SQL = "delete from " + TABLE_NAME + " where id=? and no=?";
	private final String AUTO_DELETE_TIME_SQL = "delete from " + TABLE_NAME + " where arr_day < now()";
	private final String GET_LIST_SQL = "select * from " + TABLE_NAME + " where id=? order by st_day";
	private final String DELETE_SQL = "delete from " + TABLE_NAME + " where no=?";
	
	private ReserveDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONN_POOL_SOURCE);
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static ReserveDAO getDAO() {
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
	public void reserveDAO(ReserveDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(RESERVE_SQL);
			pst.setString(1,dto.getId());
			pst.setString(2,dto.getSt_country());
			pst.setString(3,dto.getSt_airport());
			pst.setString(4,dto.getArr_country());
			pst.setString(5,dto.getArr_airport());
			pst.setString(6,dto.getSt_day());
			pst.setString(7,dto.getArr_day());
			pst.setString(8,dto.getAir_line());
			pst.setInt(9,dto.getAdult());
			pst.setInt(10,dto.getChild());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public int auto_delete_cnt(String id) {
		int count = 0;
		Connection conn = getConnection();
		PreparedStatement pst= null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(USER_RESERVE_COUNT_SQL);
			pst.setString(1,id);
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
	public int getMinNo(String id) {
		int no = 0;
		Connection conn =getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_MIN_NO_SQL);
			pst.setString(1,id);
			rs = pst.executeQuery();
			if(rs.next()) {
				no = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return no;
	}
	public void auto_delete(String id) {
		int no = getMinNo(id);
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try { 
			pst = conn.prepareStatement(AUTO_DELETE_OVER_SQL);
			pst.setString(1,id);
			pst.setInt(2,no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void auto_delete_2() {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(AUTO_DELETE_TIME_SQL);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public ArrayList<ReserveDTO> listDAO(String id) {
		ArrayList<ReserveDTO> list = new ArrayList<ReserveDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_LIST_SQL);
			pst.setString(1,id);
			rs = pst.executeQuery();
			while(rs.next()) {
				ReserveDTO dto = new ReserveDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(id);
				dto.setSt_country(rs.getString("st_country"));
				dto.setSt_airport(rs.getString("st_airport"));
				dto.setArr_country(rs.getString("arr_country"));
				dto.setArr_airport(rs.getString("arr_airport"));
				dto.setSt_day(rs.getString("st_day"));
				dto.setArr_day(rs.getString("arr_day"));
				dto.setAir_line(rs.getString("air_line"));
				dto.setAdult(rs.getInt("adult"));
				dto.setChild(rs.getInt("child"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
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
