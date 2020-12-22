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

import com.oreilly.servlet.MultipartRequest;
import com.project.www.dto.EventDTO;

public class EventDAO {
	private static EventDAO dao = new EventDAO();
	private final String TABLE_NAME = "event_table";
	private final String CONN_POOL_SOURCE = "jdbc/testdb";
	private DataSource dataSource;
	private int doingPage = 8;
	private int numOfPage = 20;
	private final String GET_DOING_COUNT_SQL = "select count(*) from " + TABLE_NAME + " where state='doing'";
	private final String GET_COUNT_SQL = "select count(*) from " + TABLE_NAME;
	private final String GET_MAX_NO_SQL = "select max(no) from " + TABLE_NAME;
	private final String UPDATE_STATE_SQL = "update " + TABLE_NAME + " set state='done' where end < now()";
	private final String EVENT_WRITE_SQL = "insert into " + TABLE_NAME + " (title,comment,thumbnail,img1,img2,img3,img4,img5,img6,img7,img8,img9,start,end) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final String DOING_LIST_SQL = "select * from " + TABLE_NAME + " where state='doing' order by no desc limit ?,?";
	private final String DONE_LIST_SQL = "select * from " + TABLE_NAME + " where state='done' order by no desc limit 15";
	private final String EVENT_LIST_SQL = "select * from " + TABLE_NAME + " order by no desc limit ?,?";
	private final String UPDATE_HIT_SQL = "update " + TABLE_NAME + " set hit=hit+1 where no=?";
	private final String GET_DTO_SQL = "select * from " + TABLE_NAME + " where no=?";
	private final String EVENT_DELETE_SQL = "delete from " + TABLE_NAME + " where no=?";
	private final String MODIFY_NO_SQL = "update " + TABLE_NAME + " set no=no-1 where no > ?";
	private final String UPDATE_MAX_NO_SQL = "update " + TABLE_NAME + " set no=? where no=?";
	
	private EventDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONN_POOL_SOURCE);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static EventDAO getEventDAO() {
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
	public void updateState() {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
		 	pst = conn.prepareStatement(UPDATE_STATE_SQL);
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
	public int getMaxNo() {
		int maxNo = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_MAX_NO_SQL);
			rs = pst.executeQuery();
			if(rs.next()) {
				maxNo = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return maxNo;
	}
	public int getDoingCount() {
		int count = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_DOING_COUNT_SQL);
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
	public int getMaxPage() {
		int count = getCount();
		int maxPage = count/numOfPage;
		maxPage = count%numOfPage==0 ? maxPage-1 : maxPage;
		return maxPage;
	}
	public int getDoingMaxPage() {
		int count = getDoingCount();
		int maxPage = count/doingPage;
		maxPage = count%doingPage==0 ? maxPage-1 : maxPage;
		return maxPage;
	}
	public void writeDAO(EventDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(EVENT_WRITE_SQL);
			pst.setString(1,dto.getTitle());
			pst.setString(2,dto.getComment());
			pst.setString(3,dto.getThumbnail());
			pst.setString(4,dto.getImg1());
			pst.setString(5,dto.getImg2());
			pst.setString(6,dto.getImg3());
			pst.setString(7,dto.getImg4());
			pst.setString(8,dto.getImg5());
			pst.setString(9,dto.getImg6());
			pst.setString(10,dto.getImg7());
			pst.setString(11,dto.getImg8());
			pst.setString(12,dto.getImg9());
			pst.setString(13,dto.getStart());
			pst.setString(14,dto.getEnd());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public ArrayList<EventDTO> doingListDAO(int curPage) {
		ArrayList<EventDTO>list = new ArrayList<EventDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(DOING_LIST_SQL);
			pst.setInt(1,curPage * doingPage);
			pst.setInt(2,doingPage);
			rs = pst.executeQuery();
			while(rs.next()) {
				EventDTO dto = new EventDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setComment(rs.getString("comment"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setImg1(rs.getString("img1"));
				dto.setImg2(rs.getString("img2"));
				dto.setImg3(rs.getString("img3"));
				dto.setImg4(rs.getString("img4"));
				dto.setImg5(rs.getString("img5"));
				dto.setImg6(rs.getString("img6"));
				dto.setImg7(rs.getString("img7"));
				dto.setImg8(rs.getString("img8"));
				dto.setImg9(rs.getString("img9"));
				dto.setHit(rs.getInt("hit"));
				dto.setStart(rs.getString("start"));
				dto.setEnd(rs.getString("end"));
				dto.setState(rs.getString("state"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
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
	public EventDTO getDTO(int no) {
		EventDTO dto = new EventDTO();
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
				dto.setComment(rs.getString("comment"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setImg1(rs.getString("img1"));
				dto.setImg2(rs.getString("img2"));
				dto.setImg3(rs.getString("img3"));
				dto.setImg4(rs.getString("img4"));
				dto.setImg5(rs.getString("img5"));
				dto.setImg6(rs.getString("img6"));
				dto.setImg7(rs.getString("img7"));
				dto.setImg8(rs.getString("img8"));
				dto.setImg9(rs.getString("img9"));
				dto.setHit(rs.getInt("hit"));
				dto.setStart(rs.getString("start"));
				dto.setEnd(rs.getString("end"));
				dto.setState(rs.getString("state"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return dto;
	}
	public ArrayList<EventDTO> doneListDAO() {
		ArrayList<EventDTO> list = new ArrayList<EventDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(DONE_LIST_SQL);
			rs = pst.executeQuery();
			while(rs.next()) {
				EventDTO dto = new EventDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setComment(rs.getString("comment"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setImg1(rs.getString("img1"));
				dto.setImg2(rs.getString("img2"));
				dto.setImg3(rs.getString("img3"));
				dto.setImg4(rs.getString("img4"));
				dto.setImg5(rs.getString("img5"));
				dto.setImg6(rs.getString("img6"));
				dto.setImg7(rs.getString("img7"));
				dto.setImg8(rs.getString("img8"));
				dto.setImg9(rs.getString("img9"));
				dto.setHit(rs.getInt("hit"));
				dto.setStart(rs.getString("start"));
				dto.setEnd(rs.getString("end"));
				dto.setState(rs.getString("state"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public EventDTO viewDAO(int no) {
		updateHit(no);
		EventDTO dto = getDTO(no);
		return dto;
	}
	public EventDTO BnAEvent(int no) {
		EventDTO dto = getDTO(no);
		return dto;
	}
	public ArrayList<EventDTO> eventList(int curPage) {
		ArrayList<EventDTO>list = new ArrayList<EventDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(EVENT_LIST_SQL);
			pst.setInt(1,curPage * numOfPage);
			pst.setInt(2,numOfPage);
			rs = pst.executeQuery();
			while(rs.next()) {
				EventDTO dto = new EventDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setComment(rs.getString("comment"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setImg1(rs.getString("img1"));
				dto.setImg2(rs.getString("img2"));
				dto.setImg3(rs.getString("img3"));
				dto.setImg4(rs.getString("img4"));
				dto.setImg5(rs.getString("img5"));
				dto.setImg6(rs.getString("img6"));
				dto.setImg7(rs.getString("img7"));
				dto.setImg8(rs.getString("img8"));
				dto.setImg9(rs.getString("img9"));
				dto.setHit(rs.getInt("hit"));
				dto.setStart(rs.getString("start"));
				dto.setEnd(rs.getString("end"));
				dto.setState(rs.getString("state"));
				list.add(dto);
			}
		} catch (SQLException e) {
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
			pst = conn.prepareStatement(EVENT_DELETE_SQL);
			pst.setInt(1,no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void modifyNoDAO(int no) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(MODIFY_NO_SQL);
			pst.setInt(1,no);
			result= pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void updateMaxNo() {
		int count = getCount();
		int maxNo = getMaxNo();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(UPDATE_MAX_NO_SQL);
			pst.setInt(1,count);
			pst.setInt(2,maxNo);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
}
