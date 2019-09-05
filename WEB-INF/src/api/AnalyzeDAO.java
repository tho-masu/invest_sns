package api;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.StringJoiner;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

import database.BookmarkBean;
import database.BookmarkBeanMapping;
import database.DBManager;

public class AnalyzeDAO {
	public static CompanyAnalyzeBean getBookmarkCompanyAnalyze(int pk_id) throws SQLException{
		String sql="SELECT * FROM t_bookmark WHERE fk_user='"+pk_id+"';";
		List<BookmarkBean> list = DBManager.findAll(sql,new BookmarkBeanMapping());

		StringJoiner joiner = new StringJoiner(",","","");

		for(BookmarkBean bbean : list) {
			joiner.add(String.valueOf(bbean.getQuote()));
		}

		return new CompanyAnalyzeBean(getDnode(joiner.toString()),getHnode(list),getEpsNode(joiner.toString()),getIncomeNode(joiner.toString()));

	}


	private static JsonNode getDnode(String joinerToString) throws SQLException {

		HashMap<String,String> query = new HashMap<String,String>();

		query.put("quote", joinerToString);
		query.put("item","v-name,v-name_en,short_name,co_settle_fy_ended,price,co_per,co_settle_roe,marketcap,co_settle_dps,co_settle_dividend_payout");

		String result = APIManager.getData("quote", query);

		ObjectMapper mapper = new ObjectMapper();
		JsonNode dnode=null;
		try {
			dnode = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		return dnode.get("quote").get("data");
	}

	private static ArrayNode getHnode(List<BookmarkBean> list) throws SQLException {

		return DAO.getCompanyHistoricalList(list,"13");
	}

	private static JsonNode getEpsNode(String joinerToString) throws SQLException {
		HashMap<String,String> query = new HashMap<String,String>();

		query.put("quote", joinerToString);
		query.put("item","co_qtr_settle_eps");
		query.put("historical_type", "10");
		query.put("count", "2");
		query.put("calendar", "01");
		query.put("direction", "backward");


		String result = APIManager.getData("ap_historical_count", query);

		ObjectMapper mapper = new ObjectMapper();
		JsonNode epsNode=null;
		try {
			epsNode = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		return epsNode.get("ap_historical").get("data");
	}

	private static JsonNode getIncomeNode(String joinerToString) throws SQLException {
		HashMap<String,String> query = new HashMap<String,String>();

		query.put("quote", joinerToString);
		query.put("item","co_settle_operating_income_pchg");
		query.put("historical_type", "10");
		query.put("count", "5");
		query.put("calendar", "01");
		query.put("direction", "backward");


		String result = APIManager.getData("ap_historical_count", query);

		ObjectMapper mapper = new ObjectMapper();
		JsonNode incomeNode=null;
		try {
			incomeNode = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		return incomeNode.get("ap_historical").get("data");
	}

	public static int countBookmark(int pk_id) throws SQLException {
		String sql="SELECT count(*) FROM t_bookmark WHERE fk_user='"+pk_id+"';";
		return DBManager.simpleCount(sql);
	}
}
