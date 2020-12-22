package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.ShopDAO;

public class Admin_ShopFrame_Delete_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ShopDAO dao = ShopDAO.getDAO();
		dao.deleteFrameDAO(Integer.parseInt(request.getParameter("no")));
	}

}
