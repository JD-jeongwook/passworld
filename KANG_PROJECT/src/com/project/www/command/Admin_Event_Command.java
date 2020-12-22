package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.EventDAO;
import com.project.www.dto.EventDTO;

public class Admin_Event_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		EventDAO dao = EventDAO.getEventDAO();
		
		int maxPage = dao.getMaxPage();
		if(maxPage < 0)
			maxPage = 0;
		
		int count = dao.getCount();
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		
		ArrayList<EventDTO> list  = dao.eventList(curPage);
		request.setAttribute("list",list);
		request.setAttribute("count",count);
		request.setAttribute("maxPage",maxPage);
	}

}
