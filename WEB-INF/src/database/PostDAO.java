package database;

import java.sql.SQLException;
import java.util.List;

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

	public static List<PostBean> getAllPostDESC(int pk_id) throws SQLException{
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
		buf.append(   "T_POST.CREATE_DATE AS DATE,");
		buf.append("FROM T_USER ");
		buf.append(   "RIGHT OUTER JOIN T_ICON ON T_USER.PK_ID = T_ICON.FK_USER ");
		buf.append(   "RIGHT OUTER JOIN T_POST ON T_USER.PK_ID = T_POST.FK_USER ");
		buf.append("WHERE T_USER.PK_ID = " + pk_id);
		buf.append("ORDER BY DATE DESC");
		return DBManager.findAll(buf.toString(), new PostBeanMapping());
	}

	public static PostBean getMemory(int pk_post) throws SQLException{
		StringBuffer buf = new StringBuffer();
		buf.append("SELECT ");
		buf.append("U.PK_ID AS PK_ID,");
		buf.append("U.USERNAME AS USERNAME,");
		buf.append("U.USER_ID AS USER_ID,");
		buf.append("I.ICON_NAME AS ICON,");
		buf.append("M.PK_POST AS PK_POST, ");
		buf.append("M.SHARE_NUM AS SHARE, ");
		buf.append("M.COMMENTS_NUM AS COMMENTS, ");
		buf.append("M.NICE_NUM AS NICE, ");
		buf.append("M.ARTICLE AS ARTICLE, ");
		buf.append("M.CREATE_DATE AS DATE, ");
		buf.append("FROM T_MEMORY M ");
		buf.append("RIGHT OUTER JOIN T_USER U ON M.FK_USER = U.PK_ID ");
		buf.append("RIGHT OUTER JOIN T_ICON I ON U.PK_ID = I.FK_USER ");
		buf.append("WHERE M.PK_POST = " + pk_post + ";");

		return DBManager.findOne(buf.toString(), new PostBeanMapping());
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
