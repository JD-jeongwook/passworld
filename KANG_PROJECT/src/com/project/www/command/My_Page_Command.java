package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.InfoDAO;
import com.project.www.dto.InfoDTO;

public class My_Page_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();		
		String id = (String)session.getAttribute("id");
		
		InfoDAO dao = InfoDAO.getInfoDAO();
		InfoDTO dto = dao.myPageDAO(id);
		
		int rNum = (int)((Math.random()*21)+1);
		
		request.setAttribute("dto",dto);
		request.setAttribute("rNum", rNum);
	}

}
