package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import api.DAO;
import database.UserBean;

public class Mayfollow extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int pk_id = Integer.parseInt(request.getParameter("pk_id"));

		List<UserBean> uList =  new ArrayList<UserBean>();
		try {
			uList= DAO.getUnfollowedList(pk_id);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.setAttribute("uList", uList);
		request.getRequestDispatcher("/masui_jsp/mayfollow.jsp").forward(request, response);
	}
}
