package masui_java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;

import api.DAO;

public class Market extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		JsonNode hnode = DAO.getNikkei225IntradayHistorical();

		request.setAttribute("hnode", hnode);
		request.getRequestDispatcher("/masui_jsp/market.jsp").forward(request, response);

	}
}