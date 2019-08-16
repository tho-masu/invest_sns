package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

import api.DAO;
import database.IndustryBean;

public class Industry extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String iname = request.getParameter("iname");

		JsonNode unode = DAO.getNikkei225();

		//anode：inameに一致する業界の銘柄だけをリスト化
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

		//hnode：anode（特定の業界の銘柄）に属する全銘柄のヒストリカルを入れる
		JsonNode hnode = DAO.getIndustryAverageHistorical(anode);

		//ahistorical：anode（特定の業界の銘柄）に属する全銘柄の平均株価のヒストリカルを入れる
		ArrayList<ArrayList<Object>> ahistorical = new ArrayList<ArrayList<Object>>();

		for(int i=0;i<hnode.get(0).get("value").size();i++) {
			//取ってきたヒストリカルのうち(i)ヶ月目の平均を算出
			double sum = 0d;
			for(JsonNode jnode : hnode) {
				sum += jnode.get("value").get(i).get("price").asDouble();
			}
			double month_average = sum/hnode.size();
			//{日付,平均}の形でahistoricalに埋め込む
			ArrayList<Object> list = new ArrayList<Object>();
			list.add(hnode.get(0).get("value").get(i).get("end_date").asText());
			list.add(month_average);
			ahistorical.add(list);
		}

		//全業界の概要を取ってくる
		List<IndustryBean> ilist = null;
		try {
			ilist = DAO.getIndustryList(iname);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.setAttribute("anode", anode);
		request.setAttribute("iname", iname);
		request.setAttribute("ahistorical", ahistorical);
		request.setAttribute("ilist", ilist);
		request.getRequestDispatcher("/masui_jsp/industry_graph.jsp").forward(request, response);

	}
}