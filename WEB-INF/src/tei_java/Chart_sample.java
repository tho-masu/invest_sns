package tei_java;

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

		String scode1 = request.getParameter("quote");
		String scode2="101/T";
		String days = "90";

		//JsonNode hcnode = DAO.getCompanyHistorical_count(scode,days);
		JsonNode hnode = DAO.getCompanyHistorical(scode1,days);
		JsonNode tnode = DAO.getCompanyHistorical(scode2,days);

		//request.setAttribute("hcnode", hcnode);
		request.setAttribute("hnode", hnode);
		request.setAttribute("tnode", tnode);
		request.getRequestDispatcher("/tei_jsp/sample_result.jsp").forward(request, response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response);
	}

}
