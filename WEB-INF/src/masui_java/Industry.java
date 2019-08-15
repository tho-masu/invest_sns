package masui_java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

import api.DAO;

public class Industry extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String iname = request.getParameter("iname");

		JsonNode unode = DAO.getNikkei225();

		ObjectMapper mapper = new ObjectMapper();
		ArrayNode anode = mapper.createArrayNode();

		if(iname == null || iname.equals("all")) {
			for(JsonNode jnode : unode) {
					anode.add(jnode);
			}
			iname = "全業界（日経平均採用銘柄）";
		}else {
			for(JsonNode jnode : unode) {
				if(jnode.get("industry_name").asText().equals(iname)) {
					anode.add(jnode);
				}
			}
		}

		request.setAttribute("anode", anode);
		request.setAttribute("iname", iname);
		request.getRequestDispatcher("/masui_jsp/industry.jsp").forward(request, response);

	}
}