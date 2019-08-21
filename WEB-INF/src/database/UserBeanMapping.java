package database;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserBeanMapping implements ResultSetBeanMapping<UserBean>{
	public UserBean createFromResultSet(ResultSet rs) throws SQLException{
		UserBean ubean = new UserBean();
		ubean.setPk_id(rs.getInt("PK_ID"));
		ubean.setUser_id(rs.getString("USER_ID"));
		ubean.setUsername(rs.getString("USERNAME"));
		ubean.setPassword(rs.getString("PASSWORD"));
		ubean.setMessage(rs.getString("MESSAGE"));
		ubean.setIcon_name(rs.getString("ICON_NAME"));
		ubean.setInvest_time(rs.getString("INVEST_TIME"));
		return ubean;
	}
}