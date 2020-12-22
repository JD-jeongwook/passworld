package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.www.dao.BoardDAO;
import com.project.www.dao.InfoDAO;
import com.project.www.dto.BoardDTO;
import com.project.www.dto.InfoDTO;

public class User_Board_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		InfoDAO dao = InfoDAO.getInfoDAO();
		String id = (String)session.getAttribute("id");
		InfoDTO dto = dao.mainDAO(id);
		
		request.setAttribute("dto", dto);
		
// ===================== 위 로그인 =======================================
		
		BoardDAO bdao = BoardDAO.getBoardDAO();
		int curPage = 0;
		if(request.getParameter("curPage") != null) 
			curPage = Integer.parseInt(request.getParameter("curPage"));
		int maxPage = bdao.getMaxPage();
		if(maxPage < 0) 
			maxPage = 0;
		ArrayList<BoardDTO> list = bdao.listDAO(curPage);
		request.setAttribute("list",list);
		request.setAttribute("maxPage",maxPage);
	
// ========================Best 리스트=====================================
		
		ArrayList<BoardDTO> b_list = bdao.bestDAO();
		request.setAttribute("b_list", b_list);
		
// =======================My 리스트 ========================================
		
		ArrayList<BoardDTO> m_list = bdao.mylistDAO(id);
		request.setAttribute("m_list",m_list);
	}


	
}
