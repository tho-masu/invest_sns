package masui_java;

import java.io.IOException;
import java.sql.SQLException;

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

		UserBean ubean = null;

		String searchWord = request.getParameter("search");
		String forwardURL=null;

		 try {
	    	  ubean=UserDAO.getSearchUser(searchWord);
	    	   request.setAttribute("ubean", ubean);
				if(ubean==null){
					forwardURL="/masui_jsp/NotFound.jsp";
				}

				forwardURL="/masui_jsp/mypage?user_id="+ubean.getUser_id();
			}catch (SQLException e) {
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}
			request.getRequestDispatcher(forwardURL).forward(request,response);
		}

}