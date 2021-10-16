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

public class Article extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String article = request.getParameter("article");
		UserBean loginAccount = (UserBean)session.getAttribute("login_account");
		PostBean pbean = new PostBean(loginAccount.getPk_id(),article);


		if(article!=null && !(article.equals(""))) {
			try {
				PostDAO.registerArticle(pbean);
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
		}else {
			request.setAttribute("error", "[エラー] 投稿を入力してください");
		}

		request.getRequestDispatcher("/main_content/article_posted.jsp").forward(request, response);
	}

}

