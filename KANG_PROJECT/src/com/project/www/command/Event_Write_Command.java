package com.project.www.command;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.www.dao.EventDAO;
import com.project.www.dto.EventDTO;

public class Event_Write_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		EventDAO dao = EventDAO.getEventDAO();
		EventDTO dto = new EventDTO();
		
		String path = request.getSession().getServletContext().getRealPath("picture/event_picture");
		int size = 1024 * 1024 * 100;
		try {
			MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String str = (String)files.nextElement();
				if(str.equals("thumbnail"))
					dto.setThumbnail(multi.getFilesystemName(str));
				else if(str.equals("img1"))
					dto.setImg1(multi.getFilesystemName(str));
				else if(str.equals("img2"))
					dto.setImg2(multi.getFilesystemName(str));
				else if(str.equals("img3"))
					dto.setImg3(multi.getFilesystemName(str));
				else if(str.equals("img4"))
					dto.setImg4(multi.getFilesystemName(str));
				else if(str.equals("img5"))
					dto.setImg5(multi.getFilesystemName(str));
				else if(str.equals("img6"))
					dto.setImg6(multi.getFilesystemName(str));
				else if(str.equals("img7"))
					dto.setImg7(multi.getFilesystemName(str));
				else if(str.equals("img8"))
					dto.setImg8(multi.getFilesystemName(str));
				else if(str.equals("img9"))
					dto.setImg9(multi.getFilesystemName(str));
			}
			dto.setTitle(multi.getParameter("title"));
			dto.setComment(multi.getParameter("comment"));
			dto.setStart(multi.getParameter("start"));
			dto.setEnd(multi.getParameter("end"));
			
			dao.writeDAO(dto);
			dao.updateMaxNo();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
