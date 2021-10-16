package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import api.DAO;
import database.PostBean;
import database.PostDAO;
import database.UserBean;
import database.UserDAO;

public class Mypage extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserBean loginAccount= (UserBean)session.getAttribute("login_account");
		String user_id = request.getParameter("user_id");

		UserBean ubean = null;
		try {
			ubean = UserDAO.getUser(user_id);
		} catch (SQLException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}

		boolean isRegisteredFollow = false;
		try {
			isRegisteredFollow = DAO.isRegisteredFollow(loginAccount.getPk_id(), ubean.getPk_id());
		} catch (SQLException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}

		List<PostBean> plist = ubean.getPostList();
		try {
			for(PostBean pbean : plist) {
				boolean b = PostDAO.isRegisteredGood(loginAccount.getPk_id(),pbean.getPk_post());
				pbean.setIsLoginAccountGood(b);
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.setAttribute("ubean", ubean);
		request.setAttribute("isRegisteredFollow", isRegisteredFollow);
		request.setAttribute("plist", plist);
		request.getRequestDispatcher("/main_content/mypage.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response);
	}
}