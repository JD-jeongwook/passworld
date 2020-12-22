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

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;
import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;
import com.oreilly.servlet.MultipartRequest;
import com.project.www.dto.BoardDTO;

public class BoardDAO {
	private static BoardDAO dao = new BoardDAO();
	private DataSource dataSource;
	private final String CONN_POOL_SOURCE = "jdbc/testdb";
	private final String TABLE_NAME = "user_board"; 
	private int numOfPage = 20;
	private final String GET_COUNT_SQL = "select count(*) from " + TABLE_NAME;
	private final String LIST_SQL = "select * from " + TABLE_NAME + " order by no desc limit ?,?";
	private final String TITLE_LIST_SQL = "select * from " + TABLE_NAME + " where title like ? order by no desc limit ?,?";
	private final String TNC_LIST_SQL = "select * from " + TABLE_NAME + " where title like ? or contents like ? order by no desc limit ?,?";
	private final String WRITER_LIST_SQL = "select * from " + TABLE_NAME + " where id like ? order by no desc limit ?,?";
	private final String WRITE_SQL = "insert into " + TABLE_NAME + " (title,img,contents,id,admin) values(?,?,?,?,?)";
	private final String UPDATE_HIT_SQL = "update " + TABLE_NAME + " set hit=hit+1 where no=?";
	private final String GET_ALL_SQL = "select * from " + TABLE_NAME + " where no=?";
	private final String DELETE_SQL = "delete from "  + TABLE_NAME + " where no=?";
	private final String MODIFY_OK_SQL = "update " + TABLE_NAME + " set title=?,img=?,contents=? where no=?";
	private final String UPDATE_COMMENT_SQL = "update " + TABLE_NAME + " set comment=? where no=?";
	private final String GET_CNT_SQL = "select count(*) from comment where list_no=?";
	private final String GET_TITLE_COUNT_SQL = "select count(*) from " + TABLE_NAME + " where title like ? order by no desc";
	private final String GET_TNC_COUNT_SQL = "select count(*) from " + TABLE_NAME + " where title like ? or contents like ? order by no desc";
	private final String GET_WRITER_COUNT_SQL = "select count(*) from " + TABLE_NAME + " where id like ? order by no desc";
	private final String BEST_LIST_SQL = "select * from " + TABLE_NAME + " order by recommend desc limit 7";
	private final String MY_LIST_SQL = "select * from " + TABLE_NAME + " where id=? order by no desc limit 7";
	private final String GET_IMG_LIST_SQL =  "select img,no,title from " + TABLE_NAME + " where not img and id=? order by wTime desc";
	private final String NOW_SQL = "select now()";
	private final String IMG_SLIDE_SQL = "select id,img from " + TABLE_NAME + " where wTime between date_add(now(),interval-1 month) and now() and not img is null order by recommend desc limit 10";
	private final String UPDATE_RECOMMEND_SQL = "update " + TABLE_NAME + " set recommend=recommend+1 where no=?";
	private final String GET_RECOMMEND_SQL = "select recommend from " + TABLE_NAME + " where no=?";
	private final String UPDATE_POINT_100_SQL = "update user_info set point=point+100 where id=?";
	private final String UPDATE_POINT_150_SQL = "update user_info set point=point+150 where id=?";
	
	private BoardDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONN_POOL_SOURCE);
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static BoardDAO getBoardDAO() {
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
	public int getSearchCount(String select,String keyword) {
		int count = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			if (select.equals("title")) {
				pst = conn.prepareStatement(GET_TITLE_COUNT_SQL);
				pst.setString(1,"%" + keyword + "%");
			}
			if (select.equals("titleandcontents")) {
				pst = conn.prepareStatement(GET_TNC_COUNT_SQL);
				pst.setString(1,"%" + keyword + "%");
				pst.setString(2,"%" + keyword + "%");
			}
			if (select.equals("writer")) {
				pst = conn.prepareStatement(GET_WRITER_COUNT_SQL);
				pst.setString(1,"%" + keyword + "%");
			}
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
		maxPage = count % numOfPage == 0 ? maxPage-1 : maxPage;
		return maxPage;
	}
	public int getSearchMaxPage(String search,String keyword) {
		int count = getSearchCount(search,keyword);
		int maxPage = count/numOfPage;
		maxPage = count % numOfPage == 0 ? maxPage-1 : maxPage;
		return maxPage;
	}
	public ArrayList<BoardDTO> listDAO(int curPage) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(LIST_SQL);
			pst.setInt(1, curPage*numOfPage);
			pst.setInt(2, numOfPage);
			rs = pst.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setHit(rs.getInt("hit"));
				dto.setContents(rs.getString("contents"));
				dto.setImg(rs.getString("img"));
				dto.setwTime(rs.getString("wTime"));
				dto.setComment(rs.getInt("comment"));
				dto.setAdmin(rs.getInt("admin"));
				updateComment(dto.getNo());
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public ArrayList<BoardDTO> Search_listDAO(String select,String keyword,int curPage) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			if (select.equals("title")) {
				pst = conn.prepareStatement(TITLE_LIST_SQL);
				pst.setString(1,"%" + keyword + "%");
				pst.setInt(2, curPage*numOfPage);
				pst.setInt(3, numOfPage);
			}
			if (select.equals("titleandcontents")) {
				pst = conn.prepareStatement(TNC_LIST_SQL);
				pst.setString(1,"%" + keyword + "%");
				pst.setString(2,"%" + keyword + "%");
				pst.setInt(3, curPage*numOfPage);
				pst.setInt(4, numOfPage);
			}
			if (select.equals("writer")) {
				pst = conn.prepareStatement(WRITER_LIST_SQL);
				pst.setString(1,"%" + keyword + "%");
				pst.setInt(2, curPage*numOfPage);
				pst.setInt(3, numOfPage);
			}
			rs = pst.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setHit(rs.getInt("hit"));
				dto.setContents(rs.getString("contents"));
				dto.setImg(rs.getString("img"));
				dto.setwTime(rs.getString("wTime"));
				dto.setComment(rs.getInt("comment"));
				dto.setAdmin(rs.getInt("admin"));
				updateComment(dto.getNo());
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public String uploadFile(MultipartRequest multi) {
		String fileName = "";
		try {
			Enumeration file = multi.getFileNames();
			if(file.hasMoreElements()) {
				String str = (String)file.nextElement();
				fileName = multi.getFilesystemName(str);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return fileName;
	}
	public void updatePoint(String id,String fileName) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			if(fileName != null)
				pst = conn.prepareStatement(UPDATE_POINT_150_SQL);
			else
				pst = conn.prepareStatement(UPDATE_POINT_100_SQL);
			pst.setString(1,id);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void writeDAO(BoardDTO dto,MultipartRequest multi) {
		String fileName = uploadFile(multi);
		updatePoint(dto.getId(),fileName);
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(WRITE_SQL);
			pst.setString(1,dto.getTitle());
			pst.setString(2,fileName);
			pst.setString(3,dto.getContents());
			pst.setString(4,dto.getId());
			pst.setInt(5,dto.getAdmin());
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
	public BoardDTO getDTO(int no) {
		BoardDTO dto = new BoardDTO();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_ALL_SQL);
			pst.setInt(1,no);
			rs = pst.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setHit(rs.getInt("hit"));
				dto.setContents(rs.getString("contents"));
				dto.setImg(rs.getString("img"));
				dto.setwTime(rs.getString("wTime"));
				dto.setAdmin(rs.getInt("admin"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return dto;
	}
	public BoardDTO viewDAO(int no) {
		updateHit(no);
		BoardDTO dto = getDTO(no);
		return dto;
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
	public BoardDTO modifyDAO(int no) {
		BoardDTO dto = getDTO(no);
		return dto;
	}
	public void modifyOKDAO(BoardDTO dto,MultipartRequest multi) {
		String fileName = uploadFile(multi);
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(MODIFY_OK_SQL);
			pst.setString(1,dto.getTitle());
			if(fileName != null)
				pst.setString(2,fileName);
			else
				pst.setString(2,dto.getImg());
			pst.setString(3,dto.getContents());
			pst.setInt(4,dto.getNo());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public int getCnt(int no) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_CNT_SQL);
			pst.setInt(1,no);
			rs = pst.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return cnt;
	}
	public void updateComment(int no) {
		int cnt = getCnt(no);
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(UPDATE_COMMENT_SQL);
			pst.setInt(1,cnt);
			pst.setInt(2,no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public ArrayList<BoardDTO> bestDAO() {
		ArrayList<BoardDTO> b_list = new ArrayList<BoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(BEST_LIST_SQL);
			rs = pst.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setRecommend(rs.getInt("recommend"));
				b_list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return b_list;
	}
	public ArrayList<BoardDTO> mylistDAO(String id) {
		ArrayList<BoardDTO> m_list = new ArrayList<BoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(MY_LIST_SQL);
			pst.setString(1,id);
			rs = pst.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				m_list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return m_list;
	}
	public ArrayList<BoardDTO> getImgList(String id) {
		ArrayList<BoardDTO>list = new ArrayList<BoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_IMG_LIST_SQL);
			pst.setString(1,id);
			rs = pst.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setImg(rs.getString("img"));
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public String getNow() {
		String now = "";
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(NOW_SQL);
			rs = pst.executeQuery();
			if(rs.next()) {
				now = rs.getString(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return now;
	}
	public ArrayList<BoardDTO> imgSlideDAO() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(IMG_SLIDE_SQL);
			rs = pst.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getString("id"));
				dto.setImg(rs.getString("img"));
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public void updateRecommend(int no) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(UPDATE_RECOMMEND_SQL);
			pst.setInt(1,no);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public int getRecommend(int no) {
		int recommend = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_RECOMMEND_SQL);
			pst.setInt(1,no);
			rs = pst.executeQuery();
			if(rs.next()) {
				recommend = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		System.out.println(recommend);
		return recommend;
	}
}
