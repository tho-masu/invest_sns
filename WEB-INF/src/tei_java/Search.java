package tei_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.UserBean;
import database.UserDAO;



public class Search extends HttpServlet {
	public void doPost(HttpServletRequest request,
            HttpServletResponse response)
        throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");


		String searchWord = request.getParameter("search");
		String forwardURL=null;

		 try {
			 List<UserBean> uList = new ArrayList<UserBean>();
	    	  uList=UserDAO.getSearchUser(searchWord);
	    	   request.setAttribute("uList", uList);
				if(uList==null){
					forwardURL="/tei_jsp/NotFound.jsp";
				}

				forwardURL="/tei_jsp/mayfollow.jsp";
			}catch (SQLException e) {
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}
			request.getRequestDispatcher(forwardURL).forward(request,response);
		}

}