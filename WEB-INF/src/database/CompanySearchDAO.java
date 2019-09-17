package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;

public class CompanySearchDAO {
	public static int deleteCompanyIndex()throws SQLException{
		String sql = "delete from t_company_index";
		return DBManager.simpleUpdate(sql);
	}

	public static void insertCompanyIndex(JsonNode jnode)throws SQLException{
		String sql = "INSERT INTO t_company_index(quote,v_name,v_name_en) VALUES(?,?,?)";

		for(JsonNode data : jnode) {
			Connection con = DBManager.getConnection();
			PreparedStatement smt = con.prepareStatement(sql);
			smt.setInt(1,data.get("securities_code").asInt());
			smt.setString(2, data.get("v-name").asText());
			smt.setString(3, data.get("v-name_en").asText());
			DBManager.simpleUpdate(smt,con);

		}

	}
/*
	public static int checkQuote(YutaiBean ybean) throws SQLException{
		String sql = "SELECT COUNT(quote) FROM t_yutai WHERE quote = ?";
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
*/
	public static List<CompanySearchBean> getSearchCompany(String searchword)throws SQLException{
		searchword = "%"+searchword+"%";
		String sql = "SELECT quote,v_name,v_name_en " +
				"FROM t_company_index " +
				"WHERE v_name ILIKE ? OR v_name_en ILIKE ?;";
		Connection con = DBManager.getConnection();
		PreparedStatement smt = con.prepareStatement(sql);
		smt.setString(1,searchword);
		smt.setString(2, searchword);

		return DBManager.findAll(smt,con, new CompanySearchBeanMapping());
	}
}
