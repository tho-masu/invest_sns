package database;

import java.sql.ResultSet;
import java.sql.SQLException;

public class YutaiBeanMapping implements ResultSetBeanMapping<YutaiBean>{

	public YutaiBean createFromResultSet(ResultSet rs)throws SQLException{
		YutaiBean ybean=new YutaiBean();

		ybean.setPk_yutai(rs.getInt("pk_yutai"));
		ybean.setQuote(rs.getInt("quote"));
		ybean.setSubfld(rs.getString("subfld"));
		ybean.setTitle(rs.getString("title"));


	    return ybean;
	}


}
