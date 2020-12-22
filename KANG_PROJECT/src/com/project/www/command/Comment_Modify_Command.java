package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.CommentDAO;
import com.project.www.dto.CommentDTO;

public class Comment_Modify_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		CommentDAO dao = CommentDAO.getCommentDAO();
		CommentDTO dto = new CommentDTO();
		
		dto.setComment(request.getParameter("comment"));
		dto.setNo(Integer.parseInt(request.getParameter("no")));
		
		dao.modifyDAO(dto);
	}

}
