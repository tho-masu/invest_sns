package api;

import java.io.IOException;
import java.util.HashMap;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class DAO {
	public static JsonNode getCompanyInfo(String scode){
		HashMap<String,String> query = new HashMap<String,String>();
		query.put("quote", scode);
		query.put("item","v-name,v-name_en,co_settle_fy_ended,price,co_per,co_settle_roe,marketcap,co_settle_dps");

		String result = APIManager.getData("quote", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null
				;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode dnode = node.get("quote").get("data").get(0);

		return dnode;

	}

	public static JsonNode getCompanyHistorical(String scode){
		HashMap<String,String> query = new HashMap<String,String>();
		query.put("quote", scode);
		query.put("item","price");
		query.put("count","7");
		query.put("direction","backward");

		String result = APIManager.getData("historical_daly_count", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null
				;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode hnode = node.get("historical_daily").get("data").get(0).get("value");

		return hnode;
	}
}
