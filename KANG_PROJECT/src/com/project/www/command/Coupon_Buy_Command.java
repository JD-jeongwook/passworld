package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.CouponDAO;
import com.project.www.dao.InfoDAO;
import com.project.www.dto.CouponDTO;

public class Coupon_Buy_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		InfoDAO idao = InfoDAO.getInfoDAO();
		idao.usePointDAO(Integer.parseInt(request.getParameter("price")),id);
		
//		================= 포인트 사용 =====================
		
		CouponDAO cdao = CouponDAO.getDAO();
		CouponDTO cdto = new CouponDTO();
		
		cdto.setId(id);
		cdto.setMarket(request.getParameter("market"));
		cdto.setItem(request.getParameter("item"));
		cdto.setImg(request.getParameter("img"));
		
		cdao.buyCouponDAO(cdto);
		cdao.updateEndCoupon();
	}

}
