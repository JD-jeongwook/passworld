package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.BoardDAO;
import com.project.www.dao.CommentDAO;

public class Board_Delete_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		BoardDAO dao = BoardDAO.getBoardDAO();
		dao.deleteDAO(Integer.parseInt(request.getParameter("no")));
		
		CommentDAO cdao = CommentDAO.getCommentDAO();
		cdao.groupDeleteDAO(Integer.parseInt(request.getParameter("no")));
	}
}
