package database;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CompanySearchBeanMapping implements ResultSetBeanMapping<CompanySearchBean>{

	public CompanySearchBean createFromResultSet(ResultSet rs)throws SQLException{
		return new CompanySearchBean(rs.getInt("quote"),rs.getString("v_name"),rs.getString("v_name_en"));
	}


}