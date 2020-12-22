package com.project.www.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JsonObject;

import com.project.www.dao.BoardDAO;

public class Board_Recommend_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		BoardDAO dao = BoardDAO.getBoardDAO();
		dao.updateRecommend(no);
		
		int recommend = dao.getRecommend(no);
		
		JsonObject obj = new JsonObject();
//		JSONObject obj = new JSONObject();
		obj.put("recommend", recommend);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);
	}

}
