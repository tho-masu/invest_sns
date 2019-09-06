package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
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

	public static int checkQuote(YutaiBean ybean) throws SQLException{
		String sql = "SELECT COUNT(quote) FROM T_yutai WHERE quote = ?";
		Connection con = DBManager.getConnection();
		PreparedStatement smt = con.prepareStatement(sql);
		smt.setInt(1,ybean.getQuote());
		return DBManager.simpleCount(smt,con);
	}
	public static int checkQuote(String scode) throws SQLException{
		String sql = "SELECT COUNT(quote) FROM T_yutai WHERE quote = ?";
		Connection con = DBManager.getConnection();
		PreparedStatement smt = con.prepareStatement(sql);
		smt.setInt(1,Integer.parseInt(scode));
		return DBManager.simpleCount(smt,con);
	}

	public static List<YutaiBean> getSearchYutai(String searchword)throws SQLException{
		searchword = "%"+searchword+"%";
		String sql = "SELECT pk_yutai,quote,title,subfld " +
				"FROM T_YUTAI " +
				"WHERE title ILIKE ?;";
		Connection con = DBManager.getConnection();
		PreparedStatement smt = con.prepareStatement(sql);
		smt.setString(1,searchword);

		return DBManager.findAll(smt,con, new YutaiBeanMapping());
	}
}
