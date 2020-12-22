package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.EventDAO;
import com.project.www.dto.BoardDTO;
import com.project.www.dto.EventDTO;

public class Event_View_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		EventDAO dao = EventDAO.getEventDAO();
		EventDTO dto = dao.viewDAO(no);
		request.setAttribute("dto",dto);

		EventDTO bdto = dao.BnAEvent(no-1);
		EventDTO adto = dao.BnAEvent(no+1);
		
		request.setAttribute("bdto",bdto);
		request.setAttribute("adto",adto);
	}

}
