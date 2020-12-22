package com.project.www.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.project.www.dao.AirDAO;
import com.project.www.dao.BoardDAO;
import com.project.www.dao.InfoDAO;
import com.project.www.dao.MainImgDAO;
import com.project.www.dao.QnADAO;
import com.project.www.dto.AirDTO;
import com.project.www.dto.BoardDTO;
import com.project.www.dto.InfoDTO;
import com.project.www.dto.MainImgDTO;

public class Main_Page_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		InfoDAO dao = InfoDAO.getInfoDAO();
		String id = (String)session.getAttribute("id");
		InfoDTO dto = dao.mainDAO(id);
		
		request.setAttribute("dto", dto);
		
//============================== 메인페이지 추천여행지 리스트 ==========================
		
		MainImgDAO mdao = MainImgDAO.getMIDAO();
		ArrayList<MainImgDTO> mlist = mdao.listDAO();
		request.setAttribute("mlist",mlist);

		QnADAO qdao = QnADAO.getQnADAO();
		boolean flag = qdao.flagDAO(id);
		request.setAttribute("flag",flag);
		
//	=========================== 메인페이지 이미지 슬라이드 ===============================
		
		BoardDAO bdao = BoardDAO.getBoardDAO();
		ArrayList<BoardDTO> imglist = bdao.imgSlideDAO();
		request.setAttribute("imglist", imglist);
		
//		========================= 항공사 ========================================
		
		AirDAO adao = AirDAO.getDAO();
		ArrayList<AirDTO> alist = adao.getAirLine();
		request.setAttribute("alist", alist);
		
//		========================= 출발 공항 =====================================
		
		ArrayList<AirDTO> startport = adao.getStartPort();
		request.setAttribute("startport", startport);
	}
}
