package tei_java;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

import api.DAO;
import database.PostBean;
import database.PostDAO;
import database.UserBean;
import database.UserDAO;

public class Mypage extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");


		String user_id = request.getParameter("user_id");

		UserBean ubean = null;
		PostBean pbean=null;
		try {
			ubean = UserDAO.getUser(user_id);


			pbean=PostDAO.getPost(user_id);

		} catch (SQLException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}

		ObjectMapper mapper = new ObjectMapper();
		ArrayNode blist = mapper.createArrayNode();
		try {
			blist = DAO.getBookmarkList(ubean.getPk_id());
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.setAttribute("ubean", ubean);
		request.setAttribute("blist", blist);
		request.setAttribute("pbean", pbean);
		request.getRequestDispatcher("/tei_jsp/mypage.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response);
	}
}