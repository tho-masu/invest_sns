package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;

import api.DAO;
import database.CommentBean;
import database.PostBean;
import database.PostDAO;
import database.UserBean;
import database.UserDAO;
import database.YutaiBean;
import database.YutaiDAO;

public class Company extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String scode = request.getParameter("quote");
		//入力値チェック
		if(!isHalfAlphanumeric(scode)) {
			throw new ServletException();
		}
		String days = "7";

		if(request.getParameter("days")!=null) {
			days = request.getParameter("days");
		}

		JsonNode dnode = DAO.getCompanyInfo(scode);
		JsonNode hnode = DAO.getCompanyHistorical(scode,days);
		JsonNode nnode = DAO.getCompanyNews(dnode.get("short_name").asText());

		UserBean ubean= (UserBean)session.getAttribute("login_account");
		boolean isRegisteredBookmark = false;
		try {
			isRegisteredBookmark = DAO.isRegisteredBookmark(ubean.getPk_id(), scode);
		} catch (SQLException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}

		List<CommentBean> clist = null;
		try {
			clist = DAO.getCompanyCommentList(scode);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
		}

		List<PostBean> companyPosts = null;
		try {
			if(UserDAO.checkUserId(scode) == 1) {
				companyPosts =  PostDAO.getAllPostDESC(scode);
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
		}

		YutaiBean yinfo = null;
		try {
			if(YutaiDAO.checkQuote(scode) == 1) {
				yinfo = DAO.getYutaiInfo(scode);
			}

		} catch(SQLException e) {

		}

		request.setAttribute("isRegisteredBookmark", isRegisteredBookmark);
		request.setAttribute("dnode", dnode);
		request.setAttribute("hnode", hnode);
		request.setAttribute("nnode", nnode);
		request.setAttribute("clist", clist);
		request.setAttribute("companyPosts", companyPosts);
		request.setAttribute("yinfo", yinfo);
		request.getRequestDispatcher("/masui_jsp/company.jsp").forward(request, response);

	}

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response);
	}

	public static boolean isHalfAlphanumeric(String str) {
        return Pattern.matches("^[0-9a-zA-Z]+$", str);
    }
}