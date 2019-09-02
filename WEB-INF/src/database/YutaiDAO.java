package database;

import java.sql.SQLException;
import java.util.StringJoiner;

import com.fasterxml.jackson.databind.JsonNode;

public class YutaiDAO {
	public static int deleteYutaiInfo()throws SQLException{
		String sql = "delete from t_yutai";
		return DBManager.simpleUpdate(sql);
	}

	public static int insertYutaiInfo(JsonNode jnode)throws SQLException{
		StringJoiner joiner = new StringJoiner(",","INSERT INTO t_yutai(quote,writer,title,month,subfld) VALUES",";");
		for(JsonNode data : jnode.get("section1").get("data")) {
			try {
				joiner.add("('"+data.get("TCODE").asInt()+"','"+data.get("WRITER").asText()+"','"+data.get("TITLE").asText()+"','"+data.get("MONTH").asText()+"','"+data.get("SUBFLD").asText()+"')");
			}catch(NullPointerException e) {

			}
		}
		return DBManager.simpleUpdate(joiner.toString());
	}
}
