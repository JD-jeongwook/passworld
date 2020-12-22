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
import com.project.www.dto.CommentDTO;
import com.project.www.dto.InfoDTO;

public class Board_Comment_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		CommentDAO dao = CommentDAO.getCommentDAO();
		CommentDTO dto = new CommentDTO();
		
		InfoDAO idao = InfoDAO.getInfoDAO();
		InfoDTO gdto = idao.getDTO(id);
		
		dto.setList_no(Integer.parseInt(request.getParameter("list_no")));
		dto.setId(request.getParameter("id"));
		dto.setProfile(request.getParameter("profile"));
		dto.setComment(request.getParameter("comment"));
		dto.setGender(gdto.getGender());
		dto.setAdmin(Integer.parseInt(request.getParameter("admin")));
		
		dao.writeCommentDAO(dto);
		int cnt = dao.setCount(dto.getList_no());
		
		/*======================== board메인에 댓글 보여지게하는것. ===============================*/
		
//		BoardDAO bdao = BoardDAO.getBoardDAO();
//		bdao.updateComment(dto.getList_no(),cnt);
	}

}
