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
import database.CommentBean;
import database.IndustryBean;
import database.YutaiDAO;

public class Industry extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String iname = request.getParameter("iname");

		JsonNode unode = DAO.getNikkei225();

		//anode：inameに一致する業界の銘柄だけをリスト化
		ObjectMapper mapper = new ObjectMapper();
		ArrayNode anode = mapper.createArrayNode();

		if(iname == null || iname.equals("全業界（日経平均採用銘柄）")) {
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

		//anode（特定の業界の銘柄）に属する全銘柄の優待の有無をtrue or falseで入れる
		List<Boolean> existYutai = new ArrayList<Boolean>();
		for(int i=0;i<anode.size();i++) {
			try {
				if(YutaiDAO.checkQuote(anode.get(i).get("securities_code").asText()) == 1) {
					existYutai.add(true);
				}else {
					existYutai.add(false);
				}
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
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

		//業界の概要を取ってくる
		IndustryBean iinfo = null;
		try {
			iinfo = DAO.getIndustryInfo(iname);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		//コメント一覧を取ってくる
		List<CommentBean> clist = null;
		try {
			clist = DAO.getIndustryCommentList(iname);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
		}

		request.setAttribute("anode", anode);
		request.setAttribute("iname", iname);
		request.setAttribute("existYutai", existYutai);
		request.setAttribute("ahistorical", ahistorical);
		request.setAttribute("iinfo", iinfo);
		request.setAttribute("clist", clist);
		request.getRequestDispatcher("/masui_jsp/industry.jsp").forward(request, response);

	}

}