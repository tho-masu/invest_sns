package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.PostBean;
import database.PostDAO;
import database.UserBean;

public class Index extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserBean loginAccount = (UserBean)session.getAttribute("login_account");

		List<UserBean> flist = loginAccount.getFollowList();
		List<String> followUsers = new ArrayList<String>();
		for(UserBean ubean : flist) {
			followUsers.add(ubean.getUser_id());
		}
		followUsers.add(loginAccount.getUser_id());

		List<PostBean> plist = new ArrayList<PostBean>();
		try {
			plist = PostDAO.getAllPostDESC(followUsers);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		try {
			for(PostBean pbean : plist) {
				boolean b = PostDAO.isRegisteredGood(loginAccount.getPk_id(),pbean.getPk_post());
				pbean.setIsLoginAccountGood(b);
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.setAttribute("plist", plist);
		request.getRequestDispatcher("/masui_jsp/index.jsp").forward(request,response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response);
	}
}