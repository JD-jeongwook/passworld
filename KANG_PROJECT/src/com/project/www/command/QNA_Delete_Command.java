package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.QnADAO;

public class QNA_Delete_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		QnADAO dao = QnADAO.getQnADAO();
		dao.qnaDeleteDAO(Integer.parseInt(request.getParameter("no")));
		dao.ansDeleteDAO(Integer.parseInt(request.getParameter("no")));
	}

}
