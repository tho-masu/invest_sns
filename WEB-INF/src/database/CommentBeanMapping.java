package database;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentBeanMapping implements ResultSetBeanMapping<CommentBean> {
	public CommentBean createFromResultSet(ResultSet rs)throws SQLException{
		CommentBean cbean=new CommentBean(rs.getInt("pk_comment"),rs.getInt("fk_user"),rs.getString("username"),rs.getString("comment"),rs.getDate("com_date"),rs.getTime("com_date"));
		return cbean;
	}
}
