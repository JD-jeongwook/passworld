package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.QnADAO;
import com.project.www.dto.QnADTO;

public class QNA_View_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		boolean flag = false;
		if(request.getParameter("admin") != null) {
			flag = true;
		}
		
		QnADAO dao = QnADAO.getQnADAO();
		QnADTO dto = dao.viewDAO(Integer.parseInt(request.getParameter("no")));
		
		request.setAttribute("flag",flag);
		request.setAttribute("dto",dto);
		
		ArrayList<QnADTO> list = dao.frameListDAO();
		request.setAttribute("list",list);
		
		QnADTO ans = dao.ans_viewDAO(Integer.parseInt(request.getParameter("no")));
		request.setAttribute("ans",ans);
	}

}
