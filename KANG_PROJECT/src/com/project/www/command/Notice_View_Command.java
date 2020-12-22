package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.InfoDAO;
import com.project.www.dao.NoticeDAO;
import com.project.www.dto.NoticeDTO;

public class Notice_View_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		InfoDAO idao = InfoDAO.getInfoDAO();
		int admin = idao.adminDAO(id);
		request.setAttribute("admin",admin);

//				위는 어드민을 구분해줌
		
		NoticeDAO dao = NoticeDAO.getDAO();
		NoticeDTO dto = dao.viewDAO(Integer.parseInt(request.getParameter("no")));
		request.setAttribute("dto",dto);
	}

}
