package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.YutaiBean;
import database.YutaiDAO;

public class YutaiSearch extends HttpServlet {
	public void doPost(HttpServletRequest request,
            HttpServletResponse response)
        throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		List<YutaiBean> yList = new ArrayList<YutaiBean>();

		String searchWord = request.getParameter("search");
		String forwardURL=null;

		 try {
	    	  yList=YutaiDAO.getSearchYutai(searchWord);
	    	   request.setAttribute("yList", yList);
				if(yList.size() == 0){
					forwardURL="/masui_jsp/YutaiNotFound.jsp";
				}else {
					forwardURL="/masui_jsp/yutai_search_result.jsp";
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}
			request.getRequestDispatcher(forwardURL).forward(request,response);
		}

}