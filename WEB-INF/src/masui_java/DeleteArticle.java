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

public class DeleteArticle extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserBean loginAccount = (UserBean)session.getAttribute("login_account");

		String pk_post = request.getParameter("pk_post");
		String fk_user = String.valueOf(loginAccount.getPk_id());

		try {
			PostDAO.deleteArticle(pk_post, fk_user);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.setAttribute("user_id", loginAccount.getUser_id());
		request.getRequestDispatcher("/masui_jsp/article_deleted.jsp").forward(request, response);

	}
}