package masui_java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;

import api.DAO;

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


		request.setAttribute("dnode", dnode);
		request.setAttribute("hnode", hnode);
		request.setAttribute("nnode", nnode);
		request.getRequestDispatcher("/masui_jsp/company.jsp").forward(request, response);

	}
}