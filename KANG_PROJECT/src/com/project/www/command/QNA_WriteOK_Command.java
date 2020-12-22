package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.QnADAO;
import com.project.www.dto.QnADTO;

public class QNA_WriteOK_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		QnADAO dao = QnADAO.getQnADAO();
		QnADTO dto = new QnADTO();
		
		dto.setFrame(request.getParameter("frame"));
		dto.setTitle(request.getParameter("title"));
		dto.setContents(request.getParameter("contents"));
		dto.setId(request.getParameter("id"));
		
		dao.writeDAO(dto);
	}

}
