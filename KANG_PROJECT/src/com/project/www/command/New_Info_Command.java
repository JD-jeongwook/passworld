package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.InfoDAO;

public class New_Info_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int admin = 0;
		if(request.getParameter("admin") != null) {
			admin = Integer.parseInt(request.getParameter("admin"));
		}
		request.setAttribute("admin",admin);
	}

}
