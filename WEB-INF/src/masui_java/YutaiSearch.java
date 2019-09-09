package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;

import api.DAO;
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
				if(yList.size() == 0){
					forwardURL="/masui_jsp/YutaiNotFound.jsp";
				}else {
					for(int i=0;i<yList.size();i++) {
						String str = yList.get(i).getTitle();
						str= highlightSearchWord(str,searchWord);
						yList.get(i).setTitle(str);
					}

					request.setAttribute("yList", yList);
					forwardURL="/masui_jsp/yutai_search_result.jsp";

					StringJoiner joiner = new StringJoiner(",","","");
					for(int i=0;i<yList.size();i++) {
						joiner.add(String.valueOf(yList.get(i).getQuote()));
					}
					JsonNode companyInfoNode = DAO.getCompanyInfoList(joiner.toString());
					request.setAttribute("companyInfoNode", companyInfoNode);

				}
			}catch (SQLException e) {
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}
			request.getRequestDispatcher(forwardURL).forward(request,response);
		}

		public static String highlightSearchWord(String str,String searchWord) {
			int index = str.indexOf(searchWord);
			if(index != -1) {
				StringBuilder builder = new StringBuilder(str);
				builder.insert(index+searchWord.length(), "</font>");
				builder.insert(index, "<font color=red>");

				return builder.toString();
			}else {
				return str;
			}
		}

}