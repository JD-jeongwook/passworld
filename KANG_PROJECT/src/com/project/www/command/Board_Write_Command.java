package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.www.dao.BoardDAO;
import com.project.www.dto.BoardDTO;

public class Board_Write_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		BoardDAO dao = BoardDAO.getBoardDAO();
		BoardDTO dto = new BoardDTO();
		
		String path = request.getSession().getServletContext().getRealPath("picture/user_picture");
		int size = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		dto.setTitle(multi.getParameter("title"));
		dto.setContents(multi.getParameter("contents"));
		dto.setId(multi.getParameter("id"));
		dto.setAdmin(Integer.parseInt(multi.getParameter("admin")));
		
		dao.writeDAO(dto,multi);
	}

}
