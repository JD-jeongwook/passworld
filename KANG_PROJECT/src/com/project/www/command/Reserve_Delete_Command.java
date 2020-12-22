package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.ReserveDAO;

public class Reserve_Delete_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ReserveDAO dao = ReserveDAO.getDAO();
		dao.deleteDAO(Integer.parseInt(request.getParameter("no")));
	}

}
