package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.dao.QnADAO;
import com.project.www.dto.QnADTO;

public class QNA_Answer_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		QnADAO dao = QnADAO.getQnADAO();
		QnADTO dto = new QnADTO();
		
		dto.setContents(request.getParameter("answer"));
		dto.setQna_no(Integer.parseInt(request.getParameter("qna_no")));
		dao.answerDAO(dto);
	}

}
