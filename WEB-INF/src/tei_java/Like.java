package tei_java;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import api.DAO;
import database.UserBean;

public class Like  extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		UserBean ubean= (UserBean)session.getAttribute("login_account");
		String quote = request.getParameter("quote");
		String registerOrDelete = request.getParameter("registerOrDelete");

		try {
			if(registerOrDelete.equals("register")) {
				DAO.registerLike(ubean.getPk_id(),quote);
			}else if(registerOrDelete.equals("delete")) {
				DAO.deleteLike(ubean.getPk_id(), quote);
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}


		request.getRequestDispatcher("/main_content/company?quote="+quote).forward(request, response);
	}
}
