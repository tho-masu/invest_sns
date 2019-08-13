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
		JsonNode dnode = DAO.getCompanyData(request.getParameter("quote"));

		request.setAttribute("dnode", dnode);
		request.getRequestDispatcher("/masui_jsp/company.jsp").forward(request, response);

	}
}