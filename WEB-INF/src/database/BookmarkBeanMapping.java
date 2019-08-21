package database;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BookmarkBeanMapping implements ResultSetBeanMapping<BookmarkBean> {
	public BookmarkBean createFromResultSet(ResultSet rs)throws SQLException{
		BookmarkBean bbean=new BookmarkBean(rs.getInt("pk_bookmark"),rs.getInt("fk_user"),rs.getInt("quote"));
		return bbean;
	}
}
