package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.protocol.x.Notice;
import com.project.www.dao.NoticeDAO;

public class Notice_Delete_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		NoticeDAO dao = NoticeDAO.getDAO();
		dao.deleteDAO(Integer.parseInt(request.getParameter("no")));
	}

}
