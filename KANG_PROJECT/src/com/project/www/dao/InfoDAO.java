package com.project.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.project.www.dto.BoardDTO;
import com.project.www.dto.InfoDTO;

public class InfoDAO {
	private static InfoDAO i_dao = new InfoDAO();
	private DataSource dataSource;
	private int numOfPage = 20;
	private final String TABLE_NAME = "user_info";
	private final String CONN_POOL_SOURCE = "jdbc/testdb";
	private final String INSERT_INFO_SQL = "insert into " + TABLE_NAME +
			 "(id,pw,name,person_num,postcode,address_1,address_2,detail_address,extra_address,phone_company,f_phone,s_phone,t_phone,mail,get_email,get_sns,gender,point,profile,admin) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final String LOG_DATA_SQL = "select name,id,point,profile,gender,admin from " + TABLE_NAME + " where id=?";
	private final String GET_SESSION_SQL = "select id,pw from " + TABLE_NAME; 
	private final String SET_DTO_SQL = "select * from " + TABLE_NAME + " where id=?";
	private final String CHECK_ID_SQL = "select id from " + TABLE_NAME;
	private final String DELETE_SQL = "delete from " + TABLE_NAME + " where id=?";
	private final String INFO_UPDATE_SQL = "update " + TABLE_NAME + " set pw=?,postcode=?,address_1=?,address_2=?,detail_address=?,extra_address=?,phone_company=?,f_phone=?,s_phone=?,t_phone=?,mail=? where id=?";
	private final String UPDATE_PROFILE_SQL = "update " + TABLE_NAME + " set profile=? where id=?";
	private final String GET_PROFILE_SQL = "select profile,gender,id,admin from " + TABLE_NAME + " where id=?";
	private final String GET_ADMIN_SQL = "select admin from " + TABLE_NAME + " where id=?";
	private final String GET_USER_LIST = "select * from " + TABLE_NAME + " where admin=? order by createtime desc,name limit ?,?";
	private final String POINT_SET_SQL = "update " + TABLE_NAME + " set point=? where id=?";
	private final String USER_COUNT_SQL = "select count(*) from " + TABLE_NAME + " where admin=?"; 
	private final String SEARCH_ID_SQL = "select id from " + TABLE_NAME + " where name=? and f_phone=? and s_phone=? and t_phone=? and mail=?";
	private final String SEARCH_PW_SQL = "select pw from " + TABLE_NAME + " where id=? and f_phone=? and s_phone=? and t_phone=? and mail=?";
	private final String USE_POINT_SQL = "update " + TABLE_NAME + " set point = point-? where id=?";
	private final String UPDATE_POINT_300_SQL = "update " + TABLE_NAME +" set point=point+300 where id=?";
	
//	위에 시퀄문 로그인했을때 보이는것들 셀렉트 name,id,point
	
	private InfoDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONN_POOL_SOURCE);
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static InfoDAO getInfoDAO() {
		return i_dao;
	}
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
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
	public int adminDAO(String id) {
		int admin = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_ADMIN_SQL);
			pst.setString(1,id);
			rs = pst.executeQuery();
			if(rs.next()) {
				admin = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return admin;
	}
	public void create_info_DAO(InfoDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pst =null;
		int result = 0;
		try {
			pst = conn.prepareStatement(INSERT_INFO_SQL);
			pst.setString(1,dto.getId());
			pst.setString(2,dto.getPw());
			pst.setString(3,dto.getName());
			pst.setString(4,dto.getPerson_num());
			pst.setInt(5,dto.getPostcode());
			pst.setString(6,dto.getAddress_1());
			pst.setString(7,dto.getAddress_2());
			pst.setString(8,dto.getDetail_address());
			pst.setString(9,dto.getExtra_address());
			pst.setString(10,dto.getPhone_company());
			pst.setInt(11,dto.getF_phone());
			pst.setInt(12,dto.getS_phone());
			pst.setInt(13,dto.getT_phone());
			pst.setString(14,dto.getMail());
			pst.setString(15,dto.getGet_email());
			pst.setString(16,dto.getGet_sns());
			pst.setString(17,dto.getGender());
			pst.setInt(18, 0);
			pst.setString(19,null);
			pst.setInt(20,dto.getAdmin());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public InfoDTO mainDAO(String id) {
		InfoDTO dto = new InfoDTO();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(LOG_DATA_SQL);
			pst.setString(1,id);
			rs = pst.executeQuery();
			if(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPoint(rs.getInt("point"));
				dto.setProfile(rs.getString("profile"));
				dto.setGender(rs.getString("gender"));
				dto.setAdmin(rs.getInt("admin"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return dto;
	}
	public boolean getSession(String id,String pw) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			pst = conn.prepareStatement(GET_SESSION_SQL);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(id.matches(rs.getString("id")) && pw.matches(rs.getString("pw"))) {
					flag = true;
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return flag;
	}
	public InfoDTO getDTO(String id) {
		InfoDTO dto = new InfoDTO();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(SET_DTO_SQL);
			pst.setString(1,id);
			rs = pst.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setPerson_num(rs.getString("person_num"));
				dto.setPostcode(rs.getInt("postcode"));
				dto.setAddress_1(rs.getString("address_1"));
				dto.setAddress_2(rs.getString("address_2"));
				dto.setDetail_address(rs.getString("detail_address"));
				dto.setExtra_address(rs.getString("extra_address"));
				dto.setPhone_company(rs.getString("phone_company"));
				dto.setF_phone(rs.getInt("f_phone"));
				dto.setS_phone(rs.getInt("s_phone"));
				dto.setT_phone(rs.getInt("t_phone"));
				dto.setMail(rs.getString("mail"));
				dto.setGet_email(rs.getString("get_email"));
				dto.setGet_sns(rs.getString("get_sns"));
				dto.setGender(rs.getString("gender"));
				dto.setPoint(rs.getInt("point"));
				dto.setAdmin(rs.getInt("admin"));
				dto.setCreatetime(rs.getString("createtime"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return dto;
	}
	public InfoDTO myPageDAO(String id) {
		InfoDTO dto = getDTO(id);
		return dto;
	}
	public boolean checkIDDAO(String id) {
		boolean flag = false;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(CHECK_ID_SQL);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(id.matches(rs.getString("id"))) {
					flag = false;
					break;
				}
			}
			if(!rs.next()) {
				flag = true;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return flag;
	}
	public void deleteDAO(String id) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(DELETE_SQL);
			pst.setString(1,id);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void updateDAO(InfoDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(INFO_UPDATE_SQL);
			pst.setString(1,dto.getPw());
			pst.setInt(2,dto.getPostcode());
			pst.setString(3,dto.getAddress_1());
			pst.setString(4,dto.getAddress_2());
			pst.setString(5,dto.getDetail_address());
			pst.setString(6,dto.getExtra_address());
			pst.setString(7,dto.getPhone_company());
			pst.setInt(8,dto.getF_phone());
			pst.setInt(9,dto.getS_phone());
			pst.setInt(10,dto.getT_phone());
			pst.setString(11,dto.getMail());
			pst.setString(12,dto.getId());
			result = pst.executeUpdate();
		} catch(SQLException e ) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public String uploadProfile(MultipartRequest multi) {
		String fileName="";
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
	public void profileDAO(String id,MultipartRequest multi) {
		String fileName = uploadProfile(multi);
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(UPDATE_PROFILE_SQL);
			pst.setString(1,fileName);
			pst.setString(2,id);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public InfoDTO getProfile(String id) {
		InfoDTO dto = new InfoDTO();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(GET_PROFILE_SQL);
			pst.setString(1,id);
			rs = pst.executeQuery();
			if(rs.next()) {
				dto.setProfile(rs.getString(1));
				dto.setGender(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setAdmin(rs.getInt(4));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return dto;
	}
	public ArrayList<InfoDTO> userDAO(int admin,int curPage) {
		ArrayList<InfoDTO> list = new ArrayList<InfoDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		String extra_address = null;
	
		try {
			pst = conn.prepareStatement(GET_USER_LIST);
			pst.setInt(1,admin);
			pst.setInt(2, curPage * numOfPage);
			pst.setInt(3, numOfPage);
			rs = pst.executeQuery();
			while(rs.next()) {
				InfoDTO dto = new InfoDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setPerson_num(rs.getString("person_num"));
				dto.setPostcode(rs.getInt("postcode"));
				dto.setAddress_1(rs.getString("address_1"));
				dto.setAddress_2(rs.getString("address_2"));
				dto.setDetail_address(rs.getString("detail_address"));
				dto.setExtra_address(rs.getString("extra_address"));
				dto.setPhone_company(rs.getString("phone_company"));
				dto.setF_phone(rs.getInt("f_phone"));
				dto.setS_phone(rs.getInt("s_phone"));
				dto.setT_phone(rs.getInt("t_phone"));
				dto.setMail(rs.getString("mail"));
				dto.setGet_email(rs.getString("get_email"));
				dto.setGet_sns(rs.getString("get_sns"));
				dto.setGender(rs.getString("gender"));
				dto.setPoint(rs.getInt("point"));
				dto.setProfile(rs.getString("profile"));
				dto.setAdmin(rs.getInt("admin"));
				dto.setCreatetime(rs.getString("createtime"));
				dto.setPhone( "0" + dto.getF_phone() + "-" + dto.getS_phone() + "-" + dto.getT_phone());
				if(rs.getString("extra_address") != null) {
					extra_address = "( " + dto.getExtra_address() + " )";
				}
				dto.setAddress(dto.getAddress_2() + " / " + dto.getDetail_address() + extra_address);
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public void givePointDAO(InfoDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(POINT_SET_SQL);
			pst.setInt(1,dto.getPoint());
			pst.setString(2,dto.getId());
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public int maxCount(int admin) {
		int count = 0;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(USER_COUNT_SQL);
			pst.setInt(1,admin);
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
	public int adminPage(int admin) {
		int count = maxCount(admin);
		int maxPage = count/numOfPage;
		maxPage = count%numOfPage == 0? maxPage-1 : maxPage;
		
		return maxPage;
	}
	public ArrayList<InfoDTO> searchID(InfoDTO dto) {
		ArrayList<InfoDTO>list = new ArrayList<InfoDTO>();
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(SEARCH_ID_SQL);
//where name=? and f_phone=? and s_phone=? and t_phone=? and mail=?
			pst.setString(1,dto.getName());
			pst.setInt(2,dto.getF_phone());
			pst.setInt(3,dto.getS_phone());
			pst.setInt(4,dto.getT_phone());
			pst.setString(5,dto.getMail());
			rs = pst.executeQuery();
			while(rs.next()) {
				InfoDTO dto2 = new InfoDTO();
				dto2.setId(rs.getString("id"));
				list.add(dto2);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return list;
	}
	public String searchPW(InfoDTO dto) {
		String pw = null;
		Connection conn = getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(SEARCH_PW_SQL);
//where name=? and f_phone=? and s_phone=? and t_phone=? and mail=?
			pst.setString(1,dto.getId());
			pst.setInt(2,dto.getF_phone());
			pst.setInt(3,dto.getS_phone());
			pst.setInt(4,dto.getT_phone());
			pst.setString(5,dto.getMail());
			rs = pst.executeQuery();
			if(rs.next()) {
				pw = rs.getString(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst,rs);
		}
		return pw;
	}
	public void usePointDAO(int price,String id) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try { 
			pst = conn.prepareStatement(USE_POINT_SQL);
			pst.setInt(1,price);
			pst.setString(2,id);
			result = pst.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
	public void reservePoint(String id) {
		Connection conn = getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(UPDATE_POINT_300_SQL);
			pst.setString(1,id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn,pst);
		}
	}
}
