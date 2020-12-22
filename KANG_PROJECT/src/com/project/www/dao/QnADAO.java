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

import com.project.www.dto.QnADTO;

public class QnADAO {
	private static QnADAO dao = new QnADAO();
	private int numOfPage = 10;
	private final String TABLE_NAME = "user_qna";
	private final String FRAME_TABLE = "qnaframe";
	private final String ANSWER_TABLE = "answer";
	private DataSource dataSource;
	private final String CONN_POOL_SOURCE = "jdbc/testdb";
	private final String INSERT_FRAME_SQL = "insert into " + FRAME_TABLE + "(qnaframe) values (?)";
	private final String FRAME_LIST_SQL = "select qnaframe,no from " + FRAME_TABLE + " order by qnaframe";
	private final String FRAME_DELETE_SQL = "delete from " + FRAME_TABLE + " where no=?";
	private final String COUNT_ID_SQL = "select count(*) from " + TABLE_NAME + " where id=?";
	private final String ALL_COUNT_ID_SQL = "select count(*) from " + TABLE_NAME;
	private final String QNA_LIST_SQL = "select * from " + TABLE_NAME + " where id=? order by complete,wTime desc limit ?,?";
	private final String ALL_QNA_LIST_SQL = "select * from " + TABLE_NAME + " order by complete,wTime desc limit ?,?";
	private final String WRITE_SQL = "insert into " + TABLE_NAME + " (id,title,contents,frame) values(?,?,?,?)";
	private final String SET_DTO_SQL = "select * from " + TABLE_NAME + " where no=?";
	private final String UPDATE_COMPLETE_SQL = "update " + TABLE_NAME + " set complete='yes' where no=? and complete='await'";
	private final String UPDATE_COMPLETE_SQL_2 = "update " + TABLE_NAME + " set complete='await' where no=? and complete='no'";
	private final String QNA_DELETE_SQL = "delete from " + TABLE_NAME + " where no=?";
	private final String ANS_DELETE_SQL = "delete from " + ANSWER_TABLE + " where qna_no=?";
	private final String QNA_MODIFY_SQL = "update " + TABLE_NAME + " set frame=?,title=?,contents=? where no=?";
	private final String ANSWER_SQL = "insert into " + ANSWER_TABLE + " (answer,qna_no) values(?,?)";
	private final String GET_ANSWER_SQL = "select * from " + ANSWER_TABLE + " where qna_no=?";
	private final String SEARCH_AWAIT_SQL = "select * from " + TABLE_NAME + " where id=? and complete='await'";
	
	private QnADAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONN_POOL_SOURCE);
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static QnADAO getQnADAO() {
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
	public void insertDAO(String frame) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result=0;
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
	public ArrayList<QnADTO> frameListDAO() {
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try { 
			pst = conn.prepareStatement(FRAME_LIST_SQL);
			rs = pst.executeQuery();
			while(rs.next()) {
				QnADTO dto = new QnADTO();
				dto.setFrame(rs.getString(1));
				dto.setFrame_no(rs.getInt(2));
				list.add(dto);
			}
		} catch(SQLException e) {
			
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public void frameDeleteDAO(int no) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(FRAME_DELETE_SQL);
			pst.setInt(1,no);
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
			pst = conn.prepareStatement(COUNT_ID_SQL);
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
	public int maxPageDAO(String id) {
		int count = countDAO(id);
		int maxPage = count/numOfPage;
		maxPage = count%numOfPage==0? maxPage-1 : maxPage;
		return maxPage;
	}
	public int allCountDAO() {
		int count = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(ALL_COUNT_ID_SQL);
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
	public int maxPage() {
		int count = allCountDAO();
		int maxPage = count/numOfPage;
		maxPage = count%numOfPage==0? maxPage-1 : maxPage;
		return maxPage;
	}
	public ArrayList<QnADTO> allQnaList(int curPage) {
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(ALL_QNA_LIST_SQL);
			pst.setInt(1,curPage * numOfPage);
			pst.setInt(2,numOfPage);
			rs = pst.executeQuery();
			while(rs.next()) {
				QnADTO dto = new QnADTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setwTime(rs.getString("wTime"));
				dto.setTitle(rs.getString("title"));
				dto.setFrame(rs.getString("frame"));
				dto.setComplete(rs.getString("complete"));
				dto.setAdmin(rs.getInt("admin"));
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
	public ArrayList<QnADTO> qnaListDAO(String id,int curPage) {
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(QNA_LIST_SQL);
			pst.setString(1,id);
			pst.setInt(2,curPage * numOfPage);
			pst.setInt(3,numOfPage);
			rs = pst.executeQuery();
			while(rs.next()) {
				QnADTO dto = new QnADTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setwTime(rs.getString("wTime"));
				dto.setTitle(rs.getString("title"));
				dto.setFrame(rs.getString("frame"));
				dto.setComplete(rs.getString("complete"));
				dto.setAdmin(rs.getInt("admin"));
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
	public void writeDAO(QnADTO dto) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(WRITE_SQL);
			pst.setString(1,dto.getId());
			pst.setString(2,dto.getTitle());
			pst.setString(3,dto.getContents());
			pst.setString(4,dto.getFrame());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public QnADTO getDTO(int no) {
		QnADTO dto = new QnADTO();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(SET_DTO_SQL);
			pst.setInt(1,no);
			rs = pst.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setwTime(rs.getString("wTime"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				dto.setFrame(rs.getString("frame"));
				dto.setComplete(rs.getString("complete"));
				dto.setAdmin(rs.getInt("admin"));
				dto.setHit(rs.getInt("hit"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return dto;
	}
	public void updateComplete(int no) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(UPDATE_COMPLETE_SQL);
			pst.setInt(1,no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void updateComplete_2(int no) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(UPDATE_COMPLETE_SQL_2);
			pst.setInt(1,no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public QnADTO viewDAO(int no) {
		updateComplete(no);
		QnADTO dto = getDTO(no);
		return dto;
	}
	public QnADTO ans_viewDAO(int no) {
		QnADTO dto = new QnADTO();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_ANSWER_SQL);
			pst.setInt(1,no);
			rs = pst.executeQuery();
			if(rs.next()) {
				dto.setContents(rs.getString("answer"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return dto;
	}
	public void qnaDeleteDAO(int no) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(QNA_DELETE_SQL);
			pst.setInt(1,no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void ansDeleteDAO(int no) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(ANS_DELETE_SQL);
			pst.setInt(1,no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void qnaModifyDAO(QnADTO dto) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(QNA_MODIFY_SQL);
			pst.setString(1,dto.getFrame());
			pst.setString(2,dto.getTitle());
			pst.setString(3,dto.getContents());
			pst.setInt(4,dto.getNo());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void answerDAO(QnADTO dto) {
		updateComplete_2(dto.getQna_no());
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0 ;
		try {
			pst = conn.prepareStatement(ANSWER_SQL);
			pst.setString(1,dto.getContents());
			pst.setInt(2,dto.getQna_no());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public boolean flagDAO(String id) {
		boolean flag = false;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			 pst = conn.prepareStatement(SEARCH_AWAIT_SQL);
			 pst.setString(1,id);
			 rs = pst.executeQuery();
			 while(rs.next()) {
				 flag = true;
			 }
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return flag;
	}
 }
