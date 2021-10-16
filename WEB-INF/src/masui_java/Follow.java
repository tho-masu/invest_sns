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

public class Follow extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		UserBean ubean= (UserBean)session.getAttribute("login_account");
		int followedUserPkId = Integer.parseInt(request.getParameter("followed_user_pk_id"));
		String followedUserUserId = request.getParameter("followed_user_user_id");
		String registerOrDelete = request.getParameter("registerOrDelete");

		try {
			if(registerOrDelete.equals("register")) {
				DAO.registerFollow(ubean.getPk_id(),followedUserPkId);
			}else if(registerOrDelete.equals("delete")) {
				DAO.deleteFollow(ubean.getPk_id(), followedUserPkId);
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.getRequestDispatcher("/main_content/mypage?user_id="+followedUserUserId).forward(request, response);
	}
}