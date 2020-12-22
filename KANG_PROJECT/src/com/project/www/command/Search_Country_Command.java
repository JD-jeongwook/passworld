package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.AirDAO;
import com.project.www.dto.AirDTO;

public class Search_Country_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		AirDAO dao = AirDAO.getDAO();
		String country = request.getParameter("country");
		
		boolean flag = dao.countryFlag(country);
		
		ArrayList<AirDTO> list = dao.getPortList(country);
		
		request.setAttribute("flag", flag);
		request.setAttribute("list",list);
		request.setAttribute("country", country);
	}
}
