package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.InfoDAO;
import com.project.www.dao.ReserveDAO;
import com.project.www.dto.ReserveDTO;

public class Reserve_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		InfoDAO idao = InfoDAO.getInfoDAO();
		ReserveDAO dao = ReserveDAO.getDAO();
		ReserveDTO dto = new ReserveDTO();
		
		dto.setId(id);
		dto.setSt_country(request.getParameter("st_country"));
		dto.setSt_airport(request.getParameter("st_airport"));
		dto.setArr_country(request.getParameter("arr_country"));
		dto.setArr_airport(request.getParameter("arr_airport"));
		dto.setSt_day(request.getParameter("st_day"));
		dto.setArr_day(request.getParameter("arr_day"));
		dto.setAir_line(request.getParameter("air_line"));
		dto.setAdult(Integer.parseInt(request.getParameter("adult")));
		dto.setChild(Integer.parseInt(request.getParameter("child")));
		
		int count = dao.auto_delete_cnt(id);
		
		dao.reserveDAO(dto);
		idao.reservePoint(id);
		dao.auto_delete_2();
		
		if(count >= 5) {
			dao.auto_delete(id);
		}
		
	}

}
