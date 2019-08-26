package masui_java;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import api.DAO;

public class DeleteComment extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String quote = request.getParameter("quote");
		String iname = request.getParameter("iname");
		String pk_post = request.getParameter("pk_post");
		String pk_comment = request.getParameter("pk_comment");
		String fk_user = request.getParameter("fk_user");

		try {
			if(quote != null) {
				request.setAttribute("quote", quote);
				DAO.deleteCompanyComment(pk_comment, fk_user);
			}else if(iname != null) {
				request.setAttribute("iname", iname);
				DAO.deleteIndustryComment(pk_comment, fk_user);
			}else if(pk_post != null) {
				request.setAttribute("pk_post", pk_post);
				DAO.deleteArticleComment(pk_comment, fk_user);
			}else {
				DAO.deleteMarketComment(pk_comment, fk_user);
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.getRequestDispatcher("/masui_jsp/comment_deleted.jsp").forward(request, response);

	}
}