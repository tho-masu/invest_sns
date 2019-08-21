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
import database.UserDAO;

public class Mypage extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String user_id = request.getParameter("user_id");

		UserBean ubean = null;
		try {
			ubean = UserDAO.getUser(user_id);
		} catch (SQLException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}

		UserBean loginUser= (UserBean)session.getAttribute("login_account");
		boolean isRegisteredFollow = false;
		try {
			isRegisteredFollow = DAO.isRegisteredFollow(loginUser.getPk_id(), ubean.getPk_id());
		} catch (SQLException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}

		request.setAttribute("ubean", ubean);
		request.setAttribute("isRegisteredFollow", isRegisteredFollow);
		request.getRequestDispatcher("/masui_jsp/mypage.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response);
	}
}