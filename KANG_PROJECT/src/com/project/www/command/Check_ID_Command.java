package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.InfoDAO;

public class Check_ID_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		InfoDAO dao = InfoDAO.getInfoDAO();
		
		String id = request.getParameter("id");
		boolean flag = dao.checkIDDAO(id);
		
		request.setAttribute("id",id);
		request.setAttribute("flag",flag);
	}

}
