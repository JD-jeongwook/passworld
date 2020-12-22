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

import com.project.www.dto.CouponDTO;

public class CouponDAO {
	private static CouponDAO dao = new CouponDAO();
	private final String TABLE_NAME = "user_coupon";
	private final String CONN_POOL_SOURCE = "jdbc/testdb";
	private DataSource dataSource;
	private final String BUY_COUPON_SQL = "insert into " + TABLE_NAME + " (id,market,item,img) values(?,?,?,?)";
	private final String UPDATE_END_COUPON_SQL = "update " + TABLE_NAME + " set end = date_add(start,interval 1 month)";
	private final String DISMANT_COUPON_SQL = "delete from " + TABLE_NAME + " where end < now()";
	private final String GET_COUNT_SQL = "select count(*) from " + TABLE_NAME + " where id=?";
	private final String COUPON_LIST_DAO = "select * from " + TABLE_NAME + " where id=?";
	
	private CouponDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONN_POOL_SOURCE);
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static CouponDAO getDAO() {
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
	public void buyCouponDAO(CouponDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(BUY_COUPON_SQL);
			pst.setString(1,dto.getId());
			pst.setString(2,dto.getMarket());
			pst.setString(3,dto.getItem());
			pst.setString(4,dto.getImg());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void updateEndCoupon() {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(UPDATE_END_COUPON_SQL);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void dismantDAO() {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(DISMANT_COUPON_SQL);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public int countDAO(String id) {
		int count = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_COUNT_SQL);
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
	public ArrayList<CouponDTO> listDAO(String id) {
		ArrayList<CouponDTO> list = new ArrayList<CouponDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(COUPON_LIST_DAO);
			pst.setString(1,id);
			rs = pst.executeQuery();
			while(rs.next()) {
				CouponDTO dto = new CouponDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setMarket(rs.getString("market"));
				dto.setItem(rs.getString("item"));
				dto.setImg(rs.getString("img"));
				dto.setStart(rs.getString("start"));
				dto.setEnd(rs.getString("end"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;

	}
}
