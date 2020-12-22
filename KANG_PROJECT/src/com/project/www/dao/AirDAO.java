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

import com.project.www.dto.AirDTO;

public class AirDAO {
	private static AirDAO dao = new AirDAO();
	private DataSource dataSource;
	private final String CONN_POOL_SOURCE = "jdbc/testdb";
	private final String AL_TABLE = "airline"; 
	private final String AP_TABLE = "airport"; 
	private final String INSERT_AL_SQL = "insert into " + AL_TABLE + " values(?)";
	private final String GET_AIRLINE_LIST_SQL = "select * from " + AL_TABLE + " order by airline";
	private final String INSERT_AP_SQL = "insert into " + AP_TABLE + " values(?,?,?)";
	private final String GET_START_PORT_LIST = "select airport from " + AP_TABLE + " where country='대한민국'";
	private final String GET_AIRPORT_LIST_SQL = "select * from " + AP_TABLE + " where country=?";
	private final String COUNTRY_FLAG_SQL = "select distinct country from " + AP_TABLE;
	
	private AirDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONN_POOL_SOURCE);
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static AirDAO getDAO() {
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
	public void insertal(String al) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(INSERT_AL_SQL);
			pst.setString(1,al);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public ArrayList<AirDTO> getAirLine() {
		ArrayList<AirDTO> list = new ArrayList<AirDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_AIRLINE_LIST_SQL);
			rs = pst.executeQuery();
			while(rs.next()) {
				AirDTO dto = new AirDTO();
				dto.setAirline(rs.getString(1));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public ArrayList<AirDTO> getStartPort() {
		ArrayList<AirDTO> list = new ArrayList<AirDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_START_PORT_LIST);
			rs = pst.executeQuery();
			while(rs.next()) {
				AirDTO dto = new AirDTO();
				dto.setAirport(rs.getString(1));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public void insertap(AirDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(INSERT_AP_SQL);
			pst.setString(1,dto.getCountry());
			pst.setString(2,dto.getCity());
			pst.setString(3,dto.getAirport());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public ArrayList<AirDTO> getPortList(String country) {
		ArrayList<AirDTO> list = new ArrayList<AirDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs =null;
		try {
			pst = conn.prepareStatement(GET_AIRPORT_LIST_SQL);
			pst.setString(1,country);
			rs = pst.executeQuery();
			while(rs.next()) {
				AirDTO dto = new AirDTO();
				dto.setCity(rs.getString("city"));
				dto.setAirport(rs.getString("airport"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs); 
		}
		return list;
	}
	public boolean countryFlag(String country) {
		boolean flag = false;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(COUNTRY_FLAG_SQL);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(country.equals(rs.getString("country"))) {
					flag = true;
					break;
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return flag;
	}
}
