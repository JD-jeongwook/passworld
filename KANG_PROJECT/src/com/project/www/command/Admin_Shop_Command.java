package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.ShopDAO;
import com.project.www.dto.ShopDTO;

public class Admin_Shop_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ShopDAO dao = ShopDAO.getDAO();
		ArrayList<ShopDTO> flist = dao.frameListDAO();
		request.setAttribute("flist", flist);
		boolean flag = false;
		
		int curPage = 0;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
			flag = true;
		}
		
		String frame = request.getParameter("frame2");
		
		int count = 0;
		if(frame==null || frame.equals("all")) {
			count = dao.getCount();
			flag = true;
		} else {
			count = dao.getSelectCount(frame);
			flag = true;
		}
		ArrayList<ShopDTO> mlist = dao.getAdminList(curPage,frame);
		
		int maxPage = dao.maxPageDAO(count);
		if(maxPage < 0)
			maxPage=0;
		
		request.setAttribute("maxPage",maxPage);
		request.setAttribute("mlist", mlist);
		request.setAttribute("frame",frame);
		request.setAttribute("count",count);
		request.setAttribute("flag", flag);
//		ArrayList<ShopDTO> mlist = dao.listDAO(curPage);
	}

}
