package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CompanySearchBean;
import database.CompanySearchDAO;

public class CompanySearch extends HttpServlet {
	public void doPost(HttpServletRequest request,
            HttpServletResponse response)
        throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		List<CompanySearchBean> cList = new ArrayList<CompanySearchBean>();

		String searchWord = request.getParameter("search");
		String forwardURL=null;
		String errorMessage =null;

		 try {
			 if(searchWord == null || searchWord.equals("")) {
				 errorMessage = "検索ワードを入力してください";
				 throw new SearchException();
			 }
	    	  cList=CompanySearchDAO.getSearchCompany(searchWord);
	    	   request.setAttribute("cList", cList);
				if(cList.size() == 0){
					errorMessage = "検索ワードに一致する企業がありません";
					throw new SearchException();
				}else {
					forwardURL="/masui_jsp/company_search_result.jsp";
				}
		 	}catch(SearchException e) {
		 		request.setAttribute("errorMessage", errorMessage);
		 		forwardURL="/masui_jsp/company_search_error.jsp";
			}catch (SQLException e) {
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}
			request.getRequestDispatcher(forwardURL).forward(request,response);
		}

}