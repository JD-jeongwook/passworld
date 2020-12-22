package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.www.dao.MainImgDAO;
import com.project.www.dto.MainImgDTO;

public class Main_Img_Modify_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		MainImgDAO dao = MainImgDAO.getMIDAO();
		MainImgDTO dto = new MainImgDTO();
		
		String path = request.getSession().getServletContext().getRealPath("picture/main_picture");
		int size = 1024 * 1024 * 10;
		
		MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		dto.setNo(Integer.parseInt(multi.getParameter("no")));
		dto.setCountry(multi.getParameter("country"));
		dto.setCity(multi.getParameter("city"));
		
		dao.modifyDAO(dto,multi);
	}

}
