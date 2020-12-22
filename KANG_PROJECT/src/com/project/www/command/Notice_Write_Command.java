package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.NoticeDAO;
import com.project.www.dto.NoticeDTO;

public class Notice_Write_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		NoticeDAO dao = NoticeDAO.getDAO();
		NoticeDTO dto = new NoticeDTO();
		
		dto.setTitle(request.getParameter("title"));
		dto.setContents(request.getParameter("contents"));
		dao.writeDAO(dto);
	}

}
