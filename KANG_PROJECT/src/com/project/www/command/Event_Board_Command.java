package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.EventDAO;
import com.project.www.dao.InfoDAO;
import com.project.www.dto.BoardDTO;
import com.project.www.dto.EventDTO;

public class Event_Board_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		InfoDAO idao = InfoDAO.getInfoDAO();
		int admin = idao.adminDAO(id);
		
		request.setAttribute("admin", admin);
		
///////////////// 위는 어드민인지 구분하기 위함. ///////////////////////

		EventDAO dao = EventDAO.getEventDAO();
		int doingMaxPage = dao.getDoingMaxPage();
		if(doingMaxPage < 0) {
			doingMaxPage = 0;
		}
		request.setAttribute("doingMaxPage", doingMaxPage);
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		
///////////////// 위는 페이징	///////////////////////////////////	
		
		dao.updateState();
		ArrayList<EventDTO>list = dao.doingListDAO(curPage);
		request.setAttribute("list",list);
		
		ArrayList<EventDTO>endlist = dao.doneListDAO();
		request.setAttribute("endlist",endlist);
	}
}
