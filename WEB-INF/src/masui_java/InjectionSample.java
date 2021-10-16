package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.InjectionDAO;
import database.UserBean;

public class InjectionSample extends HttpServlet {
		public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");

			String insert = request.getParameter("insert");
			String user_id = request.getParameter("user_id");
			if(insert != null) {
				try {
					InjectionDAO.insertInfo(insert);
				} catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
			}

			List<UserBean> ulist = null;
			if(user_id != null) {
				try {
					ulist = InjectionDAO.getUser(user_id);
				} catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
			}

			request.setAttribute("ulist", ulist);

			request.getRequestDispatcher("/main_content/injection_sample.jsp").forward(request,response);
		}
}
