package masui_java;

import java.sql.SQLException;

import com.fasterxml.jackson.databind.JsonNode;

import api.DAO;
import database.CompanySearchDAO;

public class ComanySearchIndex {
	public static void main(String[] args) {
		try {
			CompanySearchDAO.deleteCompanyIndex();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		JsonNode tokyoStockExchange = DAO.getTokyoStockExchange();

		try {
			CompanySearchDAO.insertCompanyIndex(tokyoStockExchange);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

	}
}