package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.ReserveDAO;
import com.project.www.dto.ReserveDTO;

public class My_Reserve_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ReserveDAO dao = ReserveDAO.getDAO();
		ArrayList<ReserveDTO> list = dao.listDAO(id);
		int list_size = list.size();
		list_size = 5-list_size;
		request.setAttribute("list",list);
		request.setAttribute("list_size",list_size);
	}

}
