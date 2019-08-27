package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
				"SELECT T_USER.PK_ID AS PK_ID,T_USER.USERNAME AS USERNAME,T_USER.USER_ID AS USER_ID,T_ICON.ICON_NAME AS ICON,T_POST.PK_POST AS PK_POST,T_POST.SHARE_NUM AS SHARE,T_POST.NICE_NUM AS NICE,T_POST.ARTICLE AS ARTICLE,T_POST.CREATE_DATE AS DATE FROM T_USER RIGHT OUTER JOIN T_ICON ON T_USER.PK_ID = T_ICON.FK_USER RIGHT OUTER JOIN T_POST ON T_USER.PK_ID = T_POST.FK_USER WHERE T_USER.USER_ID IN('",
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
				"(FK_USER, SHARE_NUM, NICE_NUM, ARTICLE, CREATE_DATE) VALUES('" +
				pbean.getPk_id() + "' , '0' , '0' ," +
				"'" + pbean.getArticle() + "', " +
				"now()" + ");";

		String sql2 = "SELECT CURRVAL('t_post_pk_post_seq')";
		return DBManager.getUpdate(sql1, sql2);
	}

	public static int registerArticle(PostBean pbean)throws SQLException{
		String sql = "INSERT INTO T_POST" +
				"(FK_USER, SHARE_NUM, NICE_NUM, ARTICLE, CREATE_DATE) VALUES(? , '0' , '0' ," +
				"?, " +
				"now()" + ");";
		Connection con = DBManager.getConnection();
		PreparedStatement smt = con.prepareStatement(sql);
		smt.setInt(1, pbean.getPk_id());
		smt.setString(2, pbean.getArticle());
		return DBManager.simpleUpdate(smt,con);
	}

	public static int deleteArticle(String pk_post,String fk_user)throws SQLException{
		String sql="delete from t_post where pk_post='"+pk_post+"' and fk_user='"+fk_user+"';";
		return DBManager.simpleUpdate(sql);
	}


	public static boolean isRegisteredGood(int fk_user,int fk_post)throws SQLException {
		String sql="SELECT COUNT(*) FROM t_good WHERE fk_user='"+fk_user+"' and fk_post='"+fk_post+"';";
		int count = DBManager.count(sql);
		if(count==0) {
			return false;
		}else {
			return true;
		}
	}

	public static int registerGood(int fk_user,int fk_post)throws SQLException {
		String sql="INSERT INTO t_good(fk_user,fk_post) VALUES('"+fk_user+"','"+fk_post+"');";
		return DBManager.simpleUpdate(sql);
	}

	public static int deleteGood(int fk_user,int fk_post)throws SQLException {
		String sql="DELETE FROM t_good WHERE fk_user='"+fk_user+"' and fk_post='"+fk_post+"';";
		return DBManager.simpleUpdate(sql);
	}

}
