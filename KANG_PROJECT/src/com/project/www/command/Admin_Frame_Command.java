package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.QnADAO;
import com.project.www.dao.ShopDAO;
import com.project.www.dto.QnADTO;
import com.project.www.dto.ShopDTO;

public class Admin_Frame_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
//		=========== QNA FRAME ==============
		
		QnADAO qdao = QnADAO.getQnADAO();
		
		ArrayList<QnADTO>list = qdao.frameListDAO();
		request.setAttribute("list", list);
		
//		=========== SHOP FRAME ================
		
		ShopDAO sdao = ShopDAO.getDAO();
		
		ArrayList<ShopDTO> slist = sdao.frameListDAO();
		request.setAttribute("slist", slist);
	}

}
