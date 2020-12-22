package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.CouponDAO;
import com.project.www.dto.CouponDTO;

public class Coupon_Book_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		CouponDAO dao = CouponDAO.getDAO();
		dao.dismantDAO();
		
		int count = dao.countDAO(id);
		
		ArrayList<CouponDTO> list = dao.listDAO(id);
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
	}

}
