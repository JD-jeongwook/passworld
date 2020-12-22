package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.InfoDAO;
import com.project.www.dao.ShopDAO;
import com.project.www.dto.InfoDTO;
import com.project.www.dto.ShopDTO;

public class Shop_Page_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
//		=============== 회원정보 관리 ==================
		
		InfoDAO idao = InfoDAO.getInfoDAO();
		InfoDTO idto = idao.getDTO(id);
		request.setAttribute("idto", idto);
		
//		=============== Frame 관리 ====================
		
		ShopDAO sdao = ShopDAO.getDAO();
		ArrayList<ShopDTO> flist = sdao.frameListDAO();
		request.setAttribute("flist", flist);
	
	
//		=============== Paging 및 list 관리 ===================
	
		String frame = request.getParameter("frame");
		
		int count = 0;
		if(frame==null || frame.equals("all") || frame.equals("")) {
			count = sdao.getCount();
		} else {
			count = sdao.getSelectCount(frame);
		}
		
		int maxPage = sdao.getMaxPage(count);
		if(maxPage < 0)
			maxPage = 0;
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		
		ArrayList<ShopDTO>list =  sdao.allListDAO(curPage,frame);
		
		request.setAttribute("list",list);
		request.setAttribute("frame", frame);
		request.setAttribute("maxPage",maxPage);
		request.setAttribute("curPage",curPage);
	}
}
