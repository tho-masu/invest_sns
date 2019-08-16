package api;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.StringJoiner;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

import database.DBManager;
import database.IndustryBean;
import database.IndustryBeanMapping;

public class DAO {
	public static JsonNode getCompanyInfo(String scode){
		HashMap<String,String> query = new HashMap<String,String>();
		query.put("quote", scode);
		query.put("item","v-name,v-name_en,short_name,co_settle_fy_ended,price,co_per,co_settle_roe,marketcap,co_settle_dps");

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

	public static JsonNode getCompanyHistorical(String scode,String days){
		HashMap<String,String> query = new HashMap<String,String>();
		query.put("quote", scode);
		query.put("item","price");
		query.put("count",days);
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

	public static JsonNode getCompanyNews(String sname){
		HashMap<String,String> query = new HashMap<String,String>();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd000000");
        String date = sdf.format(cal.getTime()).toString();

        //sname（銘柄略称）を適切に（UTF-8に）変換
        //変換しないとキーワード検索がエラーになってしまう
        String utf8sname = null;
        try {
			utf8sname = URLEncoder.encode(sname,"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}


		query.put("genre", "NNN");
		query.put("from_date_time",date);
		query.put("limit", "10");
		query.put("keyword", utf8sname);
		query.put("article","true");

		String result = APIManager.getData("news_headline", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null
				;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode nnode = node.get("news_headline").get("data");

		return nnode;

	}

	public static JsonNode getNikkei225(){
		HashMap<String,String> query = new HashMap<String,String>();
		query.put("universe", "nikkei225");
		query.put("universe_limit","225");
		query.put("item","industry_name,industry_name_en,v-name,securities_code,price");

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

		JsonNode unode = node.get("quote").get("data");

		return unode;
	}

	public static JsonNode getNikkei225IntradayHistorical() {
		HashMap<String,String> query = new HashMap<String,String>();
		query.put("quote", "101/T");
		query.put("item","price");
		query.put("date_count", "1");
		query.put("direction","backward");
		query.put("minute","5");

		String result = APIManager.getData("historical_intraday_daycount", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null
				;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode hnode = node.get("historical_intraday").get("data").get(0).get("value");

		return hnode;
	}

	public static JsonNode getIndustryAverageHistorical(ArrayNode anode) {
		HashMap<String,String> query = new HashMap<String,String>();
		StringJoiner join = new StringJoiner(",", "", "");
		if(anode.size()<=10) {
			for(JsonNode jnode : anode) {
				join.add(jnode.get("securities_code").asText());
			}
		}else {
			for(int i=0;i<10;i++) {
				join.add(anode.get(i).get("securities_code").asText());
			}
		}

		query.put("quote", join.toString());
		query.put("item","price");
		query.put("count", "12");
		query.put("direction","backward");

		String result = APIManager.getData("historical_monthly_count", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null
				;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode hnode = node.get("historical_monthly").get("data");

		return hnode;
	}

	public static List<IndustryBean> getIndustryList(String iname)throws SQLException{
		String sql="SELECT industry_name,industry_dis,industry_fut FROM t_industry where industry_name='"+iname+"';";
		return DBManager.findAll(sql, new IndustryBeanMapping());
	}
}
