package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.BoardDAO;
import com.project.www.dto.BoardDTO;

public class My_Picture_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		BoardDAO dao = BoardDAO.getBoardDAO();
		ArrayList<BoardDTO>list = dao.getImgList(id);

		request.setAttribute("list",list);
	}

}
