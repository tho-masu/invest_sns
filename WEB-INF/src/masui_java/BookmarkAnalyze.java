package masui_java;

import java.sql.SQLException;

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
		JsonNode jnode = cabean.getDnode();
		System.out.println(jnode.get(0).get("req_code").asText());
	}
}
