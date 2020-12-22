package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.InfoDAO;
import com.project.www.dto.InfoDTO;

public class Search_Info_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		InfoDAO dao = InfoDAO.getInfoDAO();
		InfoDTO dto = new InfoDTO();
		int flag = 0;
		String pw = null;
		
		dto.setF_phone(Integer.parseInt(request.getParameter("f_phone")));
		dto.setS_phone(Integer.parseInt(request.getParameter("s_phone")));
		dto.setT_phone(Integer.parseInt(request.getParameter("t_phone")));
		dto.setMail(request.getParameter("mail"));
		if(request.getParameter("name") != null) {
			dto.setName(request.getParameter("name"));
			ArrayList<InfoDTO> list = dao.searchID(dto);
			if(list.size() != 0) 
				flag = 1;
			request.setAttribute("list",list);
		} else if (request.getParameter("id") != null) {
			dto.setId(request.getParameter("id"));
			pw = dao.searchPW(dto);
			if(pw != null)
				flag = 2;
			request.setAttribute("id", request.getParameter("id"));
			request.setAttribute("pw",pw);
		}
		request.setAttribute("flag",flag);
	}

}
