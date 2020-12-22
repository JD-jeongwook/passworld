package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.InfoDAO;
import com.project.www.dto.InfoDTO;

public class Admin_User_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		InfoDAO idao = InfoDAO.getInfoDAO();
		
// =========================== 페이징 =====================================

		int curPage = 0;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		int maxPage = idao.adminPage(0);
		if(maxPage < 0) {
			maxPage = 0;
		}
		request.setAttribute("maxPage", maxPage);
		
		int user_count = idao.maxCount(0);
		int admin_count = idao.maxCount(1);
		
		request.setAttribute("user_count", user_count);
		request.setAttribute("admin_count", admin_count);
		
//============================ 어드민 리스트 ===============================
		ArrayList<InfoDTO>admin_list = idao.userDAO(1,curPage);
		request.setAttribute("admin_list",admin_list);
		
//============================ 유저 리스트 ===============================
		ArrayList<InfoDTO>user_list = idao.userDAO(0,curPage);
		request.setAttribute("user_list",user_list);
		
		
		

	}

}
