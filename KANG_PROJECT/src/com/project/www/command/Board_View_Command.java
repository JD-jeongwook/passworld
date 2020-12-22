package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.BoardDAO;
import com.project.www.dao.CommentDAO;
import com.project.www.dao.InfoDAO;
import com.project.www.dto.BoardDTO;
import com.project.www.dto.CommentDTO;
import com.project.www.dto.InfoDTO;

public class Board_View_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		InfoDAO idao = InfoDAO.getInfoDAO();
		InfoDAO cdao = InfoDAO.getInfoDAO();
		
		String path = request.getSession().getServletContext().getRealPath("profile_pic");
		
		////////////////////////////////////////////////////////////////////////////
		
		BoardDAO dao = BoardDAO.getBoardDAO();
		
		BoardDTO dto = dao.viewDAO(Integer.parseInt(request.getParameter("no")));
		
		InfoDTO idto = idao.getProfile(dto.getId());
		InfoDTO cdto = cdao.getProfile((String)session.getAttribute("id"));
		
		request.setAttribute("dto",dto);
		request.setAttribute("idto", idto);
		request.setAttribute("cdto", cdto);
		
		////////////////////////////////////////////////////////////////////////////////
		
		CommentDAO commentdao = CommentDAO.getCommentDAO();
		
		int count = commentdao.setCount(dto.getNo());
		ArrayList<CommentDTO> list = commentdao.commentListDAO(dto.getNo());
		request.setAttribute("list",list);
		request.setAttribute("count",count);
		
//		int returnPage = Integer.parseInt(request.getParameter("returnPage"));
		int returnPage = 0;
		if(request.getParameter("returnPage") != null) {
			returnPage = Integer.parseInt(request.getParameter("returnPage"));
		}
		request.setAttribute("returnPage", returnPage);
		request.setAttribute("select",request.getParameter("select"));
		request.setAttribute("keyword",request.getParameter("keyword"));
	}

}
