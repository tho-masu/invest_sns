package masui_java;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;

import api.AnalyzeDAO;
import api.CompanyAnalyzeBean;

public class BookmarkAnalyze {
	public static void main(String[] args) {
		int pk_id = 2;

		CompanyAnalyzeBean cabean = null;
		try {
			cabean = AnalyzeDAO.getBookmarkCompanyInfo(pk_id);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		JsonNode dnode= cabean.getDnode();
		JsonNode epsNode = cabean.getEpsNode();
		JsonNode incomeNode = cabean.getIncomeNode();

		System.out.println(dnode);
		System.out.println(epsNode);
		System.out.println(incomeNode);
		System.out.println();
		System.out.println(getEpsPchg(epsNode.get(3).get("value")));
		System.out.println(getIncomePchgList(incomeNode.get(0).get("value")));


	}

	public static double getEpsPchg(JsonNode jnode) {
		double divide_eps = jnode.get(0).get("co_qtr_settle_eps").asDouble();
		double divided_eps = jnode.get(1).get("co_qtr_settle_eps").asDouble();
		if(divide_eps > 0) {
			return (100 * divided_eps/divide_eps) - 100;
		}else {
			return 0.0;
		}
	}

	public static List<Double> getIncomePchgList(JsonNode jnode){
		List<Double> list = new ArrayList<Double>();
		for(int i=0;i<jnode.size();i++) {
			double pchg = jnode.get(i).get("co_settle_operating_income_pchg").asDouble();
			list.add(pchg);
		}
		return list;
	}
}

