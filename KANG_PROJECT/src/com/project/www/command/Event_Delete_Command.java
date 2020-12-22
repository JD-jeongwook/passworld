package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.EventDAO;

public class Event_Delete_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		EventDAO dao = EventDAO.getEventDAO();
		dao.deleteDAO(Integer.parseInt(request.getParameter("no")));
		dao.modifyNoDAO(Integer.parseInt(request.getParameter("no")));
	}

}
