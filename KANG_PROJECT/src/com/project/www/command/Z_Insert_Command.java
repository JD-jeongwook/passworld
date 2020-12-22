package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.AirDAO;
import com.project.www.dto.AirDTO;

public class Z_Insert_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		AirDAO dao = AirDAO.getDAO();
		AirDTO dto = new AirDTO();
		
		dto.setCountry(request.getParameter("country"));
		dto.setCity(request.getParameter("city"));
		dto.setAirport(request.getParameter("airport"));
		
		dao.insertap(dto);
		
	}

}
