package masui_java;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.PostDAO;
import database.UserBean;

public class Good extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserBean loginAccount = (UserBean)session.getAttribute("login_account");

		String registerOrDelete = request.getParameter("registerOrDelete");
		int fk_post = Integer.parseInt(request.getParameter("pk_post"));

		String user_id = request.getParameter("user_id");


		try {
			if(registerOrDelete.equals("register")) {
				PostDAO.registerGood(loginAccount.getPk_id(),fk_post);
			}else if(registerOrDelete.equals("delete")) {
				PostDAO.deleteGood(loginAccount.getPk_id(),fk_post);
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		if(user_id != null) {
			request.getRequestDispatcher("/main_content/mypage?user_id="+user_id).forward(request, response);
		}else {
			request.getRequestDispatcher("/main_content/").forward(request, response);
		}
	}
}