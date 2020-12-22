package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.QnADAO;
import com.project.www.dto.QnADTO;

public class QNA_Board_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		QnADAO dao = QnADAO.getQnADAO();
		
		int maxPage = dao.maxPageDAO(id);
		if( maxPage < 0)
			maxPage = 0;
		
		int curPage = 0;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		
		ArrayList<QnADTO> list = dao.qnaListDAO(id,curPage);
		request.setAttribute("list",list);
	}

}
