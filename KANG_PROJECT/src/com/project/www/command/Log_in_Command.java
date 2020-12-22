package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.project.www.dao.InfoDAO;
import com.project.www.dto.InfoDTO;

public class Log_in_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		
		InfoDAO dao = InfoDAO.getInfoDAO();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		boolean flag = dao.getSession(id,pw);
		
		if(flag) {
			session.setAttribute("id", id);
		} 
	}

}
