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

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;
import com.project.www.dto.ShopDTO;

public class ShopDAO {
	private static ShopDAO dao = new ShopDAO();
	private int numOfPage = 18;
	private int adminPage = 100;
	private final String TABLE_NAME = "shop_table";
	private final String FRAME_TABLE = "shop_frame";
	private final String CONN_POOL_SOURCE = "jdbc/testdb";
	private DataSource dataSource;
	private final String FRAME_LIST_SQL = "select * from " + FRAME_TABLE + " order by frame";
	private final String INSERT_FRAME_SQL = "insert into " + FRAME_TABLE + " (frame) values(?)";
	private final String DELETE_FRAME_SQL = "delete from " + FRAME_TABLE + " where no=?";
	private final String GET_ALL_COUNT_SQL = "select count(*) from " + TABLE_NAME;
	private final String GET_COUNT_SQL = "select count(*) from " + TABLE_NAME + " where frame=?";
	private final String INSERT_ITEM_SQL = "insert into " + TABLE_NAME + " (market,item,frame,img,price) values(?,?,?,?,?)";
	private final String GET_ADMIN_ALL_LIST = "select * from " + TABLE_NAME + " order by no desc limit ?,?";
	private final String GET_ADMIN_LIST = "select * from " + TABLE_NAME + " where frame=? order by no desc limit ?,?";
	private final String DELETE_SQL = "delete from " + TABLE_NAME + " where no=?";
	
	private ShopDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/" + CONN_POOL_SOURCE);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static ShopDAO getDAO() {
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
	public ArrayList<ShopDTO> frameListDAO() {
		ArrayList<ShopDTO> list = new ArrayList<ShopDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(FRAME_LIST_SQL);
			rs = pst.executeQuery();
			while(rs.next()) {
				ShopDTO dto = new ShopDTO();
				dto.setFrame(rs.getString("frame"));
				dto.setNo(rs.getInt("no"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public void insertDAO(String frame) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(INSERT_FRAME_SQL);
			pst.setString(1,frame);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void deleteFrameDAO(int no) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(DELETE_FRAME_SQL);
			pst.setInt(1, no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public int getCount() {
		int count = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_ALL_COUNT_SQL);
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
	public int getSelectCount(String frame) {
		int count = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_COUNT_SQL);
			pst.setString(1,frame);
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
		maxPage = count%numOfPage == 0 ? maxPage-1 : maxPage;
		
		return maxPage;
	}
	public void insertItemDAO(ShopDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(INSERT_ITEM_SQL);
			pst.setString(1,dto.getMarket());
			pst.setString(2,dto.getItem());
			pst.setString(3,dto.getFrame());
			pst.setString(4,dto.getImg());
			pst.setInt(5,dto.getPrice());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public int maxPageDAO(int count) {
		int maxPage = count/adminPage;
		maxPage = count%adminPage == 0 ? maxPage-1 : maxPage;
		return maxPage;
	}
	public ArrayList<ShopDTO> allListDAO(int curPage,String frame) {
		ArrayList<ShopDTO> list = new ArrayList<ShopDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			if(frame == null || frame.matches("all") || frame.equals("")) {	
				pst = conn.prepareStatement(GET_ADMIN_ALL_LIST);
				pst.setInt(1,curPage*numOfPage);
				pst.setInt(2,numOfPage);
			} else {
				pst = conn.prepareStatement(GET_ADMIN_LIST);
				pst.setString(1,frame);
				pst.setInt(2,curPage*numOfPage);
				pst.setInt(3,numOfPage);
			}
			
			rs = pst.executeQuery();
			while(rs.next()) {
				ShopDTO dto = new ShopDTO();
				dto.setNo(rs.getInt("no"));
				dto.setMarket(rs.getString("market"));
				dto.setItem(rs.getString("item"));
				dto.setFrame(rs.getString("frame"));
				dto.setImg(rs.getString("img"));
				dto.setPrice(rs.getInt("price"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public ArrayList<ShopDTO> getAdminList(int curPage,String frame) {
		ArrayList<ShopDTO> list = new ArrayList<ShopDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			if(frame == null || frame.matches("all") || frame.equals("")) {	
				pst = conn.prepareStatement(GET_ADMIN_ALL_LIST);
				pst.setInt(1,curPage*adminPage);
				pst.setInt(2,adminPage);
			} else {
				pst = conn.prepareStatement(GET_ADMIN_LIST);
				pst.setString(1,frame);
				pst.setInt(2,curPage*adminPage);
				pst.setInt(3,adminPage);
			}
			
			rs = pst.executeQuery();
			while(rs.next()) {
				ShopDTO dto = new ShopDTO();
				dto.setNo(rs.getInt("no"));
				dto.setMarket(rs.getString("market"));
				dto.setItem(rs.getString("item"));
				dto.setFrame(rs.getString("frame"));
				dto.setImg(rs.getString("img"));
				dto.setPrice(rs.getInt("price"));
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
