package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.NoticeDAO;
import com.project.www.dto.NoticeDTO;

public class Admin_Notice_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		NoticeDAO dao = NoticeDAO.getDAO();
		int count = dao.getCount();
		int maxPage = dao.getMaxPage(count);
		if(maxPage < 0) 
			maxPage = 0;
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<NoticeDTO>list = dao.listDAO(curPage);
		
		request.setAttribute("count",count);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("list",list);
	}

}
