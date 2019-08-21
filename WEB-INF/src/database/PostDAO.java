package database;

import java.sql.SQLException;
import java.util.List;
import java.util.StringJoiner;

public class PostDAO {
	public static List<PostBean> getAllPostDESC() throws SQLException{
		String sql = "SELECT T_USER.PK_ID AS PK_ID,"
				+ "T_USER.USERNAME AS USERNAME,"
				+ "T_USER.USER_ID AS USER_ID,"
				+ "T_ICON.ICON_NAME AS ICON,"
				+ "T_POST.PK_POST AS PK_POST,"
				+ "T_POST.SHARE_NUM AS SHARE,"
				+ "T_POST.COMMENTS_NUM AS COMMENTS,"
				+ "T_POST.NICE_NUM AS NICE,"
				+ "T_POST.ARTICLE AS ARTICLE,"
				+ "T_POST.CREATE_DATE AS DATE,"
	+ "FROM T_USER "
		+ "RIGHT OUTER JOIN T_ICON ON T_USER.PK_ID = T_ICON.FK_USER "
		+ "RIGHT OUTER JOIN T_POST ON T_USER.PK_ID = T_POST.FK_USER "
	+ "ORDER BY DATE DESC";
		return DBManager.findAll(sql, new PostBeanMapping());
	}

	public static List<PostBean> getAllPostDESC(String user_id) throws SQLException{
		StringBuffer buf = new StringBuffer();
		buf.append("SELECT T_USER.PK_ID AS PK_ID,");
		buf.append(   "T_USER.USERNAME AS USERNAME,");
		buf.append(   "T_USER.USER_ID AS USER_ID,");
		buf.append(   "T_ICON.ICON_NAME AS ICON,");
		buf.append(   "T_POST.PK_POST AS PK_POST,");
		buf.append(   "T_POST.SHARE_NUM AS SHARE,");
		buf.append(   "T_POST.COMMENTS_NUM AS COMMENTS,");
		buf.append(   "T_POST.NICE_NUM AS NICE,");
		buf.append(   "T_POST.ARTICLE AS ARTICLE,");
		buf.append(   "T_POST.CREATE_DATE AS DATE");
		buf.append(" FROM T_USER ");
		buf.append(   "RIGHT OUTER JOIN T_ICON ON T_USER.PK_ID = T_ICON.FK_USER ");
		buf.append(   "RIGHT OUTER JOIN T_POST ON T_USER.PK_ID = T_POST.FK_USER ");
		buf.append("WHERE T_USER.USER_ID = '" + user_id+"'");
		buf.append(" ORDER BY DATE DESC");
		return DBManager.findAll(buf.toString(), new PostBeanMapping());
	}

	public static List<PostBean> getAllPostDESC(List<String> followUsers) throws SQLException{
		StringJoiner joiner = new StringJoiner("','",
				"SELECT T_USER.PK_ID AS PK_ID,T_USER.USERNAME AS USERNAME,T_USER.USER_ID AS USER_ID,T_ICON.ICON_NAME AS ICON,T_POST.PK_POST AS PK_POST,T_POST.SHARE_NUM AS SHARE,T_POST.COMMENTS_NUM AS COMMENTS,T_POST.NICE_NUM AS NICE,T_POST.ARTICLE AS ARTICLE,T_POST.CREATE_DATE AS DATE FROM T_USER RIGHT OUTER JOIN T_ICON ON T_USER.PK_ID = T_ICON.FK_USER RIGHT OUTER JOIN T_POST ON T_USER.PK_ID = T_POST.FK_USER WHERE T_USER.USER_ID IN('",
				"') ORDER BY DATE DESC;");
		for (String user : followUsers) {
			joiner.add(user);
		}
		return DBManager.findAll(joiner.toString(), new PostBeanMapping());
	}

	public static PostBean getPost(String user_id) throws SQLException{
		String sql = "SELECT T_USER.PK_ID AS PK_ID,"
				+ "T_USER.USERNAME AS USERNAME,"
				+ "T_USER.USER_ID AS USER_ID,"
				+ "T_ICON.ICON_NAME AS ICON,"
				+ "T_POST.PK_POST AS PK_POST,"
				+ "T_POST.SHARE_NUM AS SHARE,"
				+ "T_POST.COMMENTS_NUM AS COMMENTS,"
				+ "T_POST.NICE_NUM AS NICE,"
				+ "T_POST.ARTICLE AS ARTICLE,"
				+ "T_POST.CREATE_DATE AS DATE "
				+ "FROM T_USER "
				+ "RIGHT OUTER JOIN T_ICON ON T_USER.PK_ID = T_ICON.FK_USER "
				+ "RIGHT OUTER JOIN T_POST ON T_USER.PK_ID = T_POST.FK_USER "
				+"WHERE USER_ID = '" + user_id + "';";
		return DBManager.findOne(sql, new PostBeanMapping());
	}

	public static int post_create(PostBean pbean)throws SQLException{
		String sql1 = "INSERT INTO T_POST" +
				"(FK_USER, ARTICLE, CREATE_DATE) VALUES(" +
				pbean.getPk_id() + ", " +
				"'" + pbean.getArticle() + "', " +
				"now()" + ");";

		String sql2 = "SELECT CURRVAL('t_post_pk_post_seq')";
		return DBManager.getUpdate(sql1, sql2);
	}


}
