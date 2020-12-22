package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.InfoDAO;

public class Delete_Info_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(request.getParameter("id") != null) {
			id = request.getParameter("id");
		}
		InfoDAO dao = InfoDAO.getInfoDAO();
		session.invalidate();
		dao.deleteDAO(id);
	}

}
