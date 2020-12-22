package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.InfoDAO;
import com.project.www.dto.InfoDTO;

public class Give_Point_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		InfoDAO dao = InfoDAO.getInfoDAO();
		InfoDTO dto = new InfoDTO();
		dto.setId(request.getParameter("id"));
		dto.setPoint(Integer.parseInt(request.getParameter("point")));
		dao.givePointDAO(dto);
	}

}
