package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.core.ApplicationContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.www.dao.InfoDAO;

public class Change_Profile_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		
		String path = request.getSession().getServletContext().getRealPath("profile_pic/");
		String id = (String)session.getAttribute("id");
		int size = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, path,size,"utf-8",new DefaultFileRenamePolicy());
		
		InfoDAO dao = InfoDAO.getInfoDAO();
		dao.profileDAO(id,multi);
	}

}
