package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.QnADAO;
import com.project.www.dto.QnADTO;

public class Admin_QNA_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		QnADAO dao = QnADAO.getQnADAO();
		int curPage = 0;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		int maxPage = dao.maxPage();
		if(maxPage < 0)
			maxPage = 0;
		
		int count = dao.allCountDAO();
		
		ArrayList<QnADTO>list = dao.allQnaList(curPage);
		request.setAttribute("count",count);
		request.setAttribute("maxPage",maxPage);
		request.setAttribute("list",list);
	}

}
