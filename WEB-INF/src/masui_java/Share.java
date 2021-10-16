package masui_java;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.PostBean;
import database.PostDAO;
import database.UserBean;

public class Share extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String article = request.getParameter("article");
		String userId = request.getParameter("user_id");
		String userName = request.getParameter("user_name");
		UserBean loginAccount = (UserBean)session.getAttribute("login_account");
		PostBean pbean = new PostBean(loginAccount.getPk_id(),"<font color=blue>["+userName+"さんからのシェア]</font><br> ＞ "+article);

		try {
			PostDAO.registerArticle(pbean);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.getRequestDispatcher("/main_content/article_posted.jsp").forward(request, response);
	}
}