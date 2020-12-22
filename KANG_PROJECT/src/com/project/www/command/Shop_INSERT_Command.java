package com.project.www.command;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.www.dao.ShopDAO;
import com.project.www.dto.ShopDTO;

public class Shop_INSERT_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		ShopDAO dao = ShopDAO.getDAO();
		ShopDTO dto = new ShopDTO();
		String path = request.getSession().getServletContext().getRealPath("picture/item_pic");
		int size = 1024 * 1024 * 10;
		
		try {
			MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			if(files.hasMoreElements()) {
				String str = (String)files.nextElement();
				dto.setImg(multi.getFilesystemName(str));
				dto.setMarket(multi.getParameter("market"));
				dto.setItem(multi.getParameter("item"));
				dto.setFrame(multi.getParameter("frame"));
				dto.setPrice(Integer.parseInt(multi.getParameter("price")));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		dao.insertItemDAO(dto);
	}

}
