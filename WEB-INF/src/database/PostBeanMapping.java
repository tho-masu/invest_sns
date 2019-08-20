package database;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PostBeanMapping implements ResultSetBeanMapping<PostBean> {

	public PostBean createFromResultSet(ResultSet rs) throws SQLException {
      PostBean pbean=new PostBean();
      pbean.setPk_id(rs.getInt("PK_ID"));
      pbean.setUser_id(rs.getString("USER_ID"));
	  pbean.setUsername(rs.getString("USERNAME"));
	  pbean.setIcon_name(rs.getString("ICON"));
	  pbean.setPk_post(rs.getInt("PK_POST"));
	  pbean.setShare_num(rs.getInt("SHARE"));
	  pbean.setComments_num(rs.getInt("COMMENTS"));
	  pbean.setNice_num(rs.getInt("NICE"));
	  pbean.setArticle(rs.getString("ARTICLE"));
	  pbean.setCreate_date(rs.getDate("DATE"));
	  pbean.setCreate_time(rs.getTime("DATE"));

	  return pbean;
 }
}