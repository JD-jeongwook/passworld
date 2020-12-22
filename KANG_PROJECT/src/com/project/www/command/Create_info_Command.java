package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.InfoDAO;
import com.project.www.dto.InfoDTO;

public class Create_info_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		InfoDAO dao = InfoDAO.getInfoDAO();
		InfoDTO dto = new InfoDTO();
		
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setPerson_num(request.getParameter("person_num"));
		dto.setPostcode(Integer.parseInt(request.getParameter("postcode")));
		dto.setAddress_1(request.getParameter("address_1"));
		dto.setAddress_2(request.getParameter("address_2"));
		dto.setDetail_address(request.getParameter("detail_address"));
		dto.setExtra_address(request.getParameter("extra_address"));
		dto.setPhone_company(request.getParameter("phone_company"));
		dto.setF_phone(Integer.parseInt(request.getParameter("f_phone")));
		dto.setS_phone(Integer.parseInt(request.getParameter("s_phone")));
		dto.setT_phone(Integer.parseInt(request.getParameter("t_phone")));
		dto.setMail(request.getParameter("mail"));
		dto.setGet_email(request.getParameter("get_email"));
		dto.setGet_sns(request.getParameter("get_sns"));
		dto.setGender(request.getParameter("gender"));
		dto.setAdmin(Integer.parseInt(request.getParameter("admin")));
		
		dao.create_info_DAO(dto);
	}

}
