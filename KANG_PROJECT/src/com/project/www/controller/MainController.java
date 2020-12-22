package com.project.www.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.www.command.Admin_Board_Command;
import com.project.www.command.Admin_Event_Command;
import com.project.www.command.Admin_Frame_Command;
import com.project.www.command.Admin_Frame_Delete_Command;
import com.project.www.command.Admin_Frame_insert_Command;
import com.project.www.command.Admin_Notice_Command;
import com.project.www.command.Admin_QNA_Command;
import com.project.www.command.Admin_ShopFrame_Delete_Command;
import com.project.www.command.Admin_ShopFrame_Insert_Command;
import com.project.www.command.Admin_Shop_Command;
import com.project.www.command.Admin_User_Command;
import com.project.www.command.Board_Comment_Command;
import com.project.www.command.Board_Delete_Command;
import com.project.www.command.Board_ModifyOK_Command;
import com.project.www.command.Board_Modify_Command;
import com.project.www.command.Board_Recommend_Command;
import com.project.www.command.Board_View_Command;
import com.project.www.command.Board_WriteR_Command;
import com.project.www.command.Board_Write_Command;
import com.project.www.command.Change_Profile_Command;
import com.project.www.command.Check_ID_Command;
import com.project.www.command.Command;
import com.project.www.command.Comment_Delete_Command;
import com.project.www.command.Comment_Modify_Command;
import com.project.www.command.Coupon_Book_Command;
import com.project.www.command.Coupon_Buy_Command;
import com.project.www.command.Create_info_Command;
import com.project.www.command.Delete_Info_Command;
import com.project.www.command.Event_Board_Command;
import com.project.www.command.Event_Delete_Command;
import com.project.www.command.Event_View_Command;
import com.project.www.command.Event_Write_Command;
import com.project.www.command.Give_Point_Command;
import com.project.www.command.Info_Modify_Command;
import com.project.www.command.Log_Out_Command;
import com.project.www.command.Log_in_Command;
import com.project.www.command.Main_IMG_Command;
import com.project.www.command.Main_Img_Modify_Command;
import com.project.www.command.Main_Page_Command;
import com.project.www.command.My_Page_Command;
import com.project.www.command.My_Picture_Command;
import com.project.www.command.My_Reserve_Command;
import com.project.www.command.New_Info_Command;
import com.project.www.command.Notice_Command;
import com.project.www.command.Notice_Delete_Command;
import com.project.www.command.Notice_Modify_Command;
import com.project.www.command.Notice_View_Command;
import com.project.www.command.Notice_Write_Command;
import com.project.www.command.QNA_Answer_Command;
import com.project.www.command.QNA_Board_Command;
import com.project.www.command.QNA_Delete_Command;
import com.project.www.command.QNA_Modify_Command;
import com.project.www.command.QNA_View_Command;
import com.project.www.command.QNA_WriteOK_Command;
import com.project.www.command.QNA_Write_Command;
import com.project.www.command.Reserve_Command;
import com.project.www.command.Reserve_Delete_Command;
import com.project.www.command.Search_Board_Command;
import com.project.www.command.Search_Country_Command;
import com.project.www.command.Search_Info_Command;
import com.project.www.command.Shop_Delete_Command;
import com.project.www.command.Shop_INSERT_Command;
import com.project.www.command.Shop_Page_Command;
import com.project.www.command.User_Board_Command;
import com.project.www.command.WelCome_Command;
import com.project.www.command.Z_Insert_Command;
@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MainController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		Command command = null;
		String cName = request.getServletPath();
		boolean flag = false;
		
		if(cName.equals("/main_page.do")) {
			command = new Main_Page_Command();
			command.execute(request, response);
			viewPage=  "main_page.jsp";
		} else if (cName.equals("/newInfo.do")) {
			command = new New_Info_Command();
			command.execute(request, response);
			viewPage = "newInfo.jsp";
		} else if (cName.equals("/create_info.do")) {
			command = new Create_info_Command();
			command.execute(request, response);
			viewPage = "create_info.jsp";
			flag = true;
		} else if (cName.equals("/login.do")) {
			command = new Log_in_Command();
			command.execute(request, response);
			viewPage = "main_page.do";
		} else if (cName.equals("/logOut.do")) {
			command = new Log_Out_Command();
			command.execute(request, response);
			viewPage = "main_page.do";
		} else if (cName.equals("/my_page.do")) {
			command = new My_Page_Command();
			command.execute(request, response);
			viewPage = "my_page.jsp";
		} else if (cName.equals("/idCheckOK.do")) {
			command = new Check_ID_Command();
			command.execute(request, response);
			viewPage = "idCheckOK.jsp";
		} else if (cName.equals("/delete_info.do")) {
			command = new Delete_Info_Command();
			command.execute(request, response);
			viewPage = "main_page.do";
		} else if (cName.equals("/my_info_modify.do")) {
			command = new Info_Modify_Command();
			command.execute(request, response);
			viewPage = "main_page.do";
		} else if (cName.equals("/profile_OK.do")) {
			command = new Change_Profile_Command();
			command.execute(request, response);
			viewPage = "change_profile.jsp";
		} else if (cName.equals("/user_board.do")) {
			command = new User_Board_Command(); 
			command.execute(request, response);
			viewPage = "user_board.jsp";
		} else if (cName.equals("/logOut_board.do")) {
			command = new Log_Out_Command();
			command.execute(request, response);
			viewPage = "user_board.do";
		} else if (cName.equals("/logOut_search_board.do")) {
			command = new Log_Out_Command();
			command.execute(request, response);
			viewPage = "search_board.do";
		} else if (cName.equals("/login_board.do")) {
			command = new Log_in_Command();
			command.execute(request, response);
			viewPage = "user_board.do";
		} else if(cName.equals("/login_search_board.do")) {
			command = new Log_in_Command();
			command.execute(request, response);
			viewPage = "search_board.do";
		} else if (cName.equals("/board_write.do")) {
			command = new Board_WriteR_Command();
			command.execute(request, response);
			viewPage = "board_write.jsp";
		} else if (cName.equals("/search_board.do")) {
			command = new Search_Board_Command();
			command.execute(request, response);
			viewPage = "search_board.jsp";
		} else if (cName.equals("/board_writeOK.do")) {
			command = new Board_Write_Command();
			command.execute(request, response);
			viewPage = "user_board.do";
			flag = true;
		} else if (cName.equals("/board_view.do")) {
			command = new Board_View_Command();
			command.execute(request, response);
			viewPage = "board_view.jsp";
		} else if (cName.equals("/search_view.do")) {
			command = new Board_View_Command();
			command.execute(request, response);
			viewPage = "search_view.jsp";
		} else if (cName.equals("/board_delete.do")) {
			command = new Board_Delete_Command();
			command.execute(request, response);
			viewPage = "user_board.do";
		} else if (cName.equals("/admin_board_delete.do")) {
			command = new Board_Delete_Command();
			command.execute(request, response);
			viewPage = "admin_board.do";
		} else if (cName.equals("/board_modify.do")) {
			command = new Board_Modify_Command();
			command.execute(request, response);
			viewPage = "board_modify.jsp";
		} else if (cName.equals("/board_modifyOK.do")) {
			command = new Board_ModifyOK_Command();
			command.execute(request, response);
			viewPage = "user_board.do";
		} else if (cName.equals("/comment.do")) {
			command = new Board_Comment_Command();
			command.execute(request, response);
			viewPage = "board_view.do?no="+request.getParameter("list_no")+"&returnPage="+request.getParameter("returnPage");
			flag = true;
		} else if (cName.equals("/board_recommend.do")) {
			command = new Board_Recommend_Command();
			command.execute(request, response);
			viewPage = "board_view.do?no="+request.getParameter("no");
		} else if (cName.equals("/comment_modify.do")) {
			command = new Comment_Modify_Command();
			command.execute(request, response);
			viewPage = "board_view.do?no="+request.getParameter("view_no")+"&returnPage="+request.getParameter("returnPage");
			flag = true;
		} else if (cName.equals("/comment_delete.do")) {
			command = new Comment_Delete_Command();
			command.execute(request, response);
			viewPage = "board_view.do?no="+request.getParameter("view_no")+"&returnPage="+request.getParameter("returnPage");
		} else if (cName.equals("/search_comment.do")) {
			command = new Board_Comment_Command();
			command.execute(request, response);
			viewPage = "search_view.do?no="+request.getParameter("list_no")+"&returnPage="+request.getParameter("returnPage")+"&select="+request.getParameter("select")+"&keyword="+request.getParameter("keyword");
			flag = true;
		} else if (cName.equals("/search_comment_modify.do")) {
			command = new Comment_Modify_Command();
			command.execute(request, response);
			viewPage = "search_view.do?no="+request.getParameter("view_no")+"&returnPage="+request.getParameter("returnPage")+"&select="+request.getParameter("select")+"&keyword="+request.getParameter("keyword");
			flag = true;
		} else if (cName.equals("/search_comment_delete.do")) {
			command = new Comment_Delete_Command();
			command.execute(request, response);
			viewPage = "search_view.do?no="+request.getParameter("view_no")+"&returnPage="+request.getParameter("returnPage")+"&select="+request.getParameter("select")+"&keyword="+request.getParameter("keyword");
		} else if (cName.equals("/admin_user.do")) {
			command = new Admin_User_Command();
			command.execute(request, response);
			viewPage = "admin_user.jsp";
		} else if (cName.equals("/kick.do")) {
			command = new Delete_Info_Command();
			command.execute(request, response);
			viewPage = "admin_user.do";
		} else if (cName.equals("/givePoint.do")) {
			command = new Give_Point_Command();
			command.execute(request, response);
			viewPage = "admin_user.do";
		} else if (cName.equals("/myPicture.do")) {
			command = new My_Picture_Command();
			command.execute(request, response);
			viewPage = "myPicture.jsp";
		} else if (cName.equals("/page_img_set.do")) {
			command = new Main_IMG_Command();
			command.execute(request, response);
			viewPage = "page_img_set.jsp";
		} else if (cName.equals("/main_img_modify.do")) {
			command = new Main_Img_Modify_Command();
			command.execute(request, response);
			viewPage = "change_main_img.jsp";
		} else if (cName.equals("/admin_page.do")) {
			viewPage = "admin_page.jsp";
		} else if (cName.equals("/admin_notice.do")) {
			command = new Admin_Notice_Command();
			command.execute(request, response);
			viewPage = "admin_notice.jsp";
		} else if (cName.equals("/admin_board.do")) {
			command = new Admin_Board_Command();
			command.execute(request, response);
			viewPage = "admin_board.jsp";
		} else if (cName.equals("/admin_event.do")) {
			command = new Admin_Event_Command();
			command.execute(request, response);
			viewPage = "admin_event.jsp";
		} else if (cName.equals("/admin_frame.do")) {
			command = new Admin_Frame_Command();
			command.execute(request, response);
			viewPage = "admin_frame.jsp";
		} else if (cName.equals("/admin_frame_insert.do")) {
			command = new Admin_Frame_insert_Command();
			command.execute(request, response);
			viewPage = "admin_frame.do";
			flag=true;
		} else if (cName.equals("/admin_shopframe_insert.do")) {
			command = new Admin_ShopFrame_Insert_Command();
			command.execute(request, response);
			viewPage = "admin_frame.do";
			flag=true;
		} else if (cName.equals("/admin_frame_delete.do")) {
			command = new Admin_Frame_Delete_Command();
			command.execute(request, response);
			viewPage = "admin_frame.do";
			flag = true;
		} else if (cName.equals("/admin_shopframe_delete.do")) {
			command = new Admin_ShopFrame_Delete_Command();
			command.execute(request, response);
			viewPage = "admin_frame.do";
			flag = true;
		} else if (cName.equals("/admin_qna.do")) {
			command = new Admin_QNA_Command();
			command.execute(request, response);
			viewPage = "admin_qna.jsp";
		} else if (cName.equals("/admin_shop.do")) {
			command = new Admin_Shop_Command();
			command.execute(request, response);
			viewPage = "admin_shop.jsp";
		} else if (cName.equals("/shop_insert.do")) {
			command = new Shop_INSERT_Command();
			command.execute(request, response);
			viewPage = "admin_shop.do";
			flag = true;
		} else if (cName.equals("/shop_delete.do")) {
			command = new Shop_Delete_Command();
			command.execute(request, response);
			viewPage = "admin_shop.do";
			flag = true;
		} else if (cName.equals("/qnaBoard.do")) {
			command = new QNA_Board_Command();
			command.execute(request, response);
			viewPage = "qnaBoard.jsp";
		} else if (cName.equals("/qnaWrite.do")) {
			command = new QNA_Write_Command();
			command.execute(request, response);
			viewPage = "qnaWrite.jsp";
		} else if (cName.equals("/qnawriteOK.do")) {
			command = new QNA_WriteOK_Command();
			command.execute(request, response);
			viewPage = "qnaBoard.do";
			flag = true;
		} else if (cName.equals("/qnaView.do")) {
			command = new QNA_View_Command();
			command.execute(request, response);
			viewPage = "qnaView.jsp";
		} else if (cName.equals("/qnaDelete.do")) {
			command = new QNA_Delete_Command();
			command.execute(request, response);
			viewPage = "qnaBoard.do";
			flag = true;
		} else if (cName.equals("/admin_qnaDelete.do")) {
			command = new QNA_Delete_Command();
			command.execute(request, response);
			viewPage = "admin_qna.do";
			flag = true;
		} else if (cName.equals("/qnaModify.do")) {
			command = new QNA_Modify_Command();
			command.execute(request, response);
			viewPage = "qnaView.do?no="+request.getParameter("no");
			flag = true;
		} else if (cName.equals("/qna_answer.do")) {
			command = new QNA_Answer_Command();
			command.execute(request, response);
			viewPage = "admin_qna.do";
			flag = true;
		} else if (cName.equals("/welcome.do")) {
			viewPage = "welcome.jsp";
		} else if (cName.equals("/infoSearch.do")) {
			viewPage = "infoSearch.jsp";
		} else if (cName.equals("/search_info.do")) {
			command = new Search_Info_Command();
			command.execute(request, response);
			viewPage = "infoSearchOK.jsp";
		} else if (cName.equals("/event_page.do")) {
			command = new Event_Board_Command();
			command.execute(request, response);
			viewPage = "event_page.jsp";
		} else if (cName.equals("/event_write.do")) {
			viewPage = "event_write.jsp";
		} else if (cName.equals("/event_writeOK.do")) {
			command = new Event_Write_Command();
			command.execute(request, response);
			viewPage = "event_page.do";
			flag = true;
		} else if (cName.equals("/event_view.do")) {
			command = new Event_View_Command();
			command.execute(request, response);
			viewPage= "event_view.jsp";
		} else if (cName.equals("/event_delete.do")) {
			command = new Event_Delete_Command();
			command.execute(request, response);
			viewPage = "admin_event.do";
		} else if (cName.equals("/notice_page.do")) {
			command = new Notice_Command();
			command.execute(request, response);
			viewPage = "notice_page.jsp";
		} else if (cName.equals("/notice_write.do")) {
			viewPage = "notice_write.jsp";
		} else if (cName.equals("/notice_writeOK.do")) {
			command = new Notice_Write_Command();
			command.execute(request, response);
			viewPage = "admin_notice.do";
			flag = true;
		} else if (cName.equals("/notice_view.do")) {
			command = new Notice_View_Command();
			command.execute(request, response);
			viewPage = "notice_view.jsp";
		} else if (cName.equals("/notice_modify.do")) {
			command = new Notice_Modify_Command();
			command.execute(request, response);
			viewPage = "notice_view.do?no="+Integer.parseInt(request.getParameter("no"));
		} else if (cName.equals("/notice_delete.do")) {
			command = new Notice_Delete_Command();
			command.execute(request, response);
			viewPage = "admin_notice.do";
		} else if (cName.equals("/shop_page.do")) {
			command = new Shop_Page_Command();
			command.execute(request, response);
			viewPage = "shop_page.jsp";
		} else if (cName.equals("/coupon_buy.do")) {
			command = new Coupon_Buy_Command();
			command.execute(request, response);
			viewPage = "shop_page.do";
			flag = true;
		} else if (cName.equals("/couponBook.do")) {
			command = new Coupon_Book_Command();
			command.execute(request, response);
			viewPage = "couponBook.jsp";
		} else if (cName.equals("/search_arrive.do")) {
			command = new Search_Country_Command();
			command.execute(request, response);
			viewPage = "search_arrive.jsp";
		} else if (cName.equals("/search_start.do")) {
			command = new Search_Country_Command();
			command.execute(request, response);
			viewPage = "search_start.jsp";
		} else if( cName.equals("/reserve.do")) {
			command = new Reserve_Command();
			command.execute(request, response);
			viewPage = "main_page.do";
			flag = true;
		} else if (cName.equals("/my_reserve.do")) {
			command = new My_Reserve_Command();
			command.execute(request, response);
			viewPage = "my_reserve.jsp";
		} else if (cName.equals("/delete_reserve.do")) {
			command = new Reserve_Delete_Command();
			command.execute(request, response);
			viewPage = "my_reserve.do";
		}
		
		
		
		
		
		else if (cName.equals("/insert.do")) {
			command = new Z_Insert_Command();
			command.execute(request, response);
			viewPage = "insertJSP.jsp";
			flag = true;
		}
		
		if(flag) {
			response.sendRedirect(viewPage);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(viewPage);
			rd.forward(request,response);
		}
	}

}
