package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.InfoDAO;
import com.project.www.dto.InfoDTO;

public class Info_Modify_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		InfoDAO dao = InfoDAO.getInfoDAO();
		InfoDTO dto = new InfoDTO();
		
		dto.setId((String)session.getAttribute("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setPostcode(Integer.parseInt(request.getParameter("postcode")));
		dto.setAddress_1(request.getParameter("address_1"));
		dto.setAddress_2(request.getParameter("address_2"));
		dto.setDetail_address(request.getParameter("detail_address"));
		dto.setExtra_address(request.getParameter("extra_address"));
		dto.setPhone_company(request.getParameter("phone_company"));
		dto.setF_phone(Integer.parseInt(request.getParameter("f_phone")));;
		dto.setS_phone(Integer.parseInt(request.getParameter("s_phone")));;
		dto.setT_phone(Integer.parseInt(request.getParameter("t_phone")));;
		dto.setMail(request.getParameter("mail"));
		
		dao.updateDAO(dto);
	}

}
