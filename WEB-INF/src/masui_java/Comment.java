package masui_java;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import api.DAO;
import database.UserBean;

public class Comment extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String scode = request.getParameter("quote");
		String iname = request.getParameter("iname");
		String comment = request.getParameter("comment");
		UserBean ubean= (UserBean)session.getAttribute("login_account");

		if(comment!=null && !(comment.equals(""))) {
			try {
				if(scode != null) {
					DAO.registerCompanyComment(ubean.getPk_id(),scode, comment);
				}else if(iname != null) {
					DAO.registerIndustryComment(ubean.getPk_id(),iname, comment);
				}else {
					DAO.registerMarketComment(ubean.getPk_id(),comment);
				}
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
		}else {
			request.setAttribute("error", "[エラー] コメントを入力してください");
		}

		if(scode != null) {
			request.setAttribute("quote", scode);
		}else if(iname != null) {
			request.setAttribute("iname", iname);
		}

		request.getRequestDispatcher("/masui_jsp/comment_posted.jsp").forward(request, response);
	}

}
