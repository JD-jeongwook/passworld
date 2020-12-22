package com.project.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.project.www.dto.MainImgDTO;

public class MainImgDAO {
	private DataSource dataSource;
	private static MainImgDAO dao = new MainImgDAO();
	private final String TABLE_NAME = "admin_main";
	private final String CONN_POOL_SOURCE = "jdbc/testdb";
	private final String MODIFY_SQL = "update " + TABLE_NAME + " set img=?,country=?,city=? where no=?";
	private final String LIST_SQL = "select * from " + TABLE_NAME;
	
	private MainImgDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONN_POOL_SOURCE);
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static MainImgDAO getMIDAO() {
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
	public String getImg(MultipartRequest multi) {
		String img = null;
		try {
			Enumeration file = multi.getFileNames();
			if(file.hasMoreElements()) {
				String str = (String)file.nextElement();
				img = multi.getFilesystemName(str);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return img;
	}
	public void modifyDAO(MainImgDTO dto,MultipartRequest multi) {
		String img = getImg(multi);
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(MODIFY_SQL);
			pst.setString(1,img);
			pst.setString(2,dto.getCountry());
			pst.setString(3,dto.getCity());
			pst.setInt(4,dto.getNo());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public ArrayList<MainImgDTO> listDAO() {
		ArrayList<MainImgDTO> list = new ArrayList<MainImgDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(LIST_SQL);
			rs = pst.executeQuery();
			while(rs.next()) {
				MainImgDTO dto = new MainImgDTO();
				dto.setCity(rs.getString("city"));
				dto.setCountry(rs.getString("country"));
				dto.setImg(rs.getString("img"));
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
}
