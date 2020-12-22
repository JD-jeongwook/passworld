package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.BoardDAO;
import com.project.www.dto.BoardDTO;

public class Board_Modify_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		BoardDAO dao = BoardDAO.getBoardDAO();
		BoardDTO dto = dao.modifyDAO(Integer.parseInt(request.getParameter("no")));
		
		request.setAttribute("dto", dto);
	}

}
