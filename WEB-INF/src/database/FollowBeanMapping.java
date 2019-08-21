package database;

import java.sql.ResultSet;
import java.sql.SQLException;

public class FollowBeanMapping implements ResultSetBeanMapping<FollowBean> {
	public FollowBean createFromResultSet(ResultSet rs)throws SQLException{
		FollowBean fbean=new FollowBean(rs.getInt("pk_follow"),rs.getInt("fk_user"),rs.getInt("followed_user"));
		return fbean;
	}
}
