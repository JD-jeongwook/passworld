package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.BoardDAO;
import com.project.www.dto.BoardDTO;

public class Admin_Board_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		BoardDAO dao = BoardDAO.getBoardDAO();
		int curPage = 0;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		int pagecnt = dao.getCount();
		int maxPage = dao.getMaxPage();
		if(maxPage < 0)
			maxPage = 0;
		ArrayList<BoardDTO>list = dao.listDAO(curPage);
		
		request.setAttribute("list",list);
		request.setAttribute("pagecnt",pagecnt);
		request.setAttribute("maxPage",maxPage);
		
		String now = dao.getNow();
		request.setAttribute("now",now);
	}

}
