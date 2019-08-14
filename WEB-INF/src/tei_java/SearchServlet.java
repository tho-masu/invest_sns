package tei_java;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import api.APIManager;



	public class SearchServlet extends HttpServlet {


		public void doPost(HttpServletRequest request,HttpServletResponse response)
		        throws ServletException,IOException{


			String search=request.getParameter("search");
	        request.setCharacterEncoding("UTF-8");

	        request.setAttribute("search",search);

			String v_name=null;
			String v_name_en=null;
			String closing_period=null;
			String industy=null;
			String listed_section=null;
			long market_capitalization;
			int dividend;
			double dividend_rate;
			double per;
			double roe;

			String forwardURL=null;
			try {
				String path = "quote";
				HashMap<String,String> q = new  HashMap<String,String>();

				q.put("quote" , search);
				q.put("item", "v-name,v-name_en,co_settle_fy_ended,marketcap,co_settle_dps,co_settle_dividend_payout,co_per,co_settle_roe,industry_name,listed_section");
				//q.put("item","v-name_en");

				StringBuffer sb = APIManager.getData(path,q);

				ObjectMapper mapper = new ObjectMapper();
				JsonNode node = mapper.readTree(sb.toString());

				//v_name=node.toString();

				v_name=node.get("quote").get("data").get(0).get("v-name").asText();
				v_name_en=node.get("quote").get("data").get(0).get("v-name_en").asText();
				closing_period=node.get("quote").get("data").get(0).get("co_settle_fy_ended").asText();
				market_capitalization=node.get("quote").get("data").get(0).get("marketcap").asLong();
				dividend=node.get("quote").get("data").get(0).get("co_settle_dps").asInt();
				dividend_rate=node.get("quote").get("data").get(0).get("co_settle_dividend_payout").asDouble();
				per=node.get("quote").get("data").get(0).get("co_per").asDouble();
				roe=node.get("quote").get("data").get(0).get("co_settle_roe").asDouble();
				industy=node.get("quote").get("data").get(0).get("industry_name").asText();
				listed_section=node.get("quote").get("data").get(0).get("listed_section").asText();

				request.setAttribute("v-name",v_name);
				request.setAttribute("v-name_en",v_name_en);
				request.setAttribute("co_settle_fy_ended",closing_period);
				request.setAttribute("marketcap",market_capitalization);
				request.setAttribute("co_settle_dps",dividend);
				request.setAttribute("co_settle_dividend_payout",dividend_rate);
				request.setAttribute("co_per",per);
				request.setAttribute("co_settle_roe",roe);
				request.setAttribute("industry_name",industy);
				request.setAttribute("listed_section",listed_section);

				forwardURL="/mainpage/company.jsp";
			}catch(Exception e) {
				e.printStackTrace();

			}
			request.getRequestDispatcher(forwardURL).forward(request, response);
	}
	}


