package masui_java;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.UserDAO;

public class MypageEdit extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("user_name");
		String icon = request.getParameter("icon");
		String investTime = request.getParameter("invest_time");
		String message = request.getParameter("message");

		String pk_id = request.getParameter("pk_id");
		String user_id = request.getParameter("user_id");

		try {
			if(!(userName.equals(""))) {
					UserDAO.updateUserProfile(pk_id, user_id, "user_name", userName);
			}
			if(!(investTime.equals(""))) {
				UserDAO.updateUserProfile(pk_id, user_id, "invest_time", investTime);
			}
			if(!(message.equals(""))) {
				UserDAO.updateUserProfile(pk_id, user_id, "message", message);
			}
			if(!(icon.equals(""))) {
				UserDAO.icon_update(pk_id, icon);
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.setAttribute("user_id", user_id);
		request.getRequestDispatcher("/masui_jsp/mypage_changed.jsp").forward(request, response);
	}
}