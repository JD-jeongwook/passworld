package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.QnADAO;

public class Admin_Frame_insert_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		QnADAO dao = QnADAO.getQnADAO();
		String frame = request.getParameter("frame");
		dao.insertDAO(frame);
	}

}
