package sugeno_java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;

import api.DAO;

public class Chart_sample extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String scode = request.getParameter("quote");
		String days = "365";

		//JsonNode hcnode = DAO.getCompanyHistorical_count(scode,days);
		JsonNode hnode = DAO.getCompanyHistorical(scode,days);
		//JsonNode ynode = YutaiDAO.getYutaiInfo(scode);

		//request.setAttribute("hcnode", hcnode);
		request.setAttribute("hnode", hnode);
		//request.setAttribute("ynode", ynode);
		request.getRequestDispatcher("/sugeno_jsp/sample_result.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response);
	}


}
