package database;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeBeanMapping implements ResultSetBeanMapping<LikeBean>{

	public LikeBean createFromResultSet(ResultSet rs)throws SQLException{
		LikeBean lbean=new LikeBean();

		lbean.setCount(rs.getInt("count"));
		lbean.setQuote(rs.getInt("quote"));

		return lbean;
}
}