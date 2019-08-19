package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;

import api.DAO;
import database.CommentBean;

public class Company extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String scode = request.getParameter("quote");
		String days = "7";

		if(request.getParameter("days")!=null) {
			days = request.getParameter("days");
		}

		JsonNode dnode = DAO.getCompanyInfo(scode);
		JsonNode hnode = DAO.getCompanyHistorical(scode,days);
		JsonNode nnode = DAO.getCompanyNews(dnode.get("short_name").asText());
		List<CommentBean> clist = null;
		try {
			clist = DAO.getCompanyCommentList(scode);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
		}


		request.setAttribute("dnode", dnode);
		request.setAttribute("hnode", hnode);
		request.setAttribute("nnode", nnode);
		request.setAttribute("clist", clist);
		request.getRequestDispatcher("/masui_jsp/company.jsp").forward(request, response);

	}

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String scode = request.getParameter("quote");
		String comment = request.getParameter("comment");

		if(comment!=null && !(comment.equals(""))) {
			try {
				DAO.registerCompanyComment(scode, comment);
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
		}else {
			request.setAttribute("error", "[エラー] コメントを入力してください");
		}

		request.setAttribute("quote", scode);
		request.getRequestDispatcher("/masui_jsp/comment_posted.jsp").forward(request, response);
	}
}