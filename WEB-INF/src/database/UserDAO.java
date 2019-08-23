package database;

import java.sql.SQLException;
import java.util.List;

public class UserDAO {
	public static int register(UserBean ubean) throws SQLException{
		//ユーザーの登録とその主キー取得メソッド
		String sql1 = "INSERT INTO T_USER" +
							"(USERNAME, PASSWORD, MESSAGE, INVEST_TIME,USER_ID) VALUES(" +
							"'" + ubean.getUsername() + "'," +
							"'" + ubean.getPassword() + "'," +
							"'よろしくお願いします。'," +
							"'1年'," +
							"'" + ubean.getUser_id() + "'" + ")";

		String sql2 = "SELECT CURRVAL('t_user_pk_id_seq')";
		return DBManager.getUpdate(sql1, sql2);
	}
	//上記の主キーを元にデフォルトアイコンを登録するメソッド
	public static void registerIcon(int pk_id)throws SQLException{
		String sql = "INSERT INTO T_ICON (FK_USER, ICON_NAME) VALUES(" +
						"'" + pk_id + "', " +
						"'default_icon.png'" + ")";
		DBManager.simpleUpdate(sql);
	}

	public static UserBean getUser(String user_id) throws SQLException{
		String sql = "SELECT T_USER.PK_ID AS PK_ID, " +
				"T_USER.USERNAME AS USERNAME, " +
				"T_USER.PASSWORD AS PASSWORD, " +
				"T_USER.MESSAGE AS MESSAGE, " +
				"T_USER.USER_ID AS USER_ID, " +
				"T_USER.INVEST_TIME AS INVEST_TIME,"+
				"T_ICON.ICON_NAME AS ICON_NAME " +
				"FROM T_USER " +
				"RIGHT OUTER JOIN T_ICON ON T_USER.PK_ID = T_ICON.FK_USER " +
				"WHERE USER_ID = '" + user_id + "';";
		return DBManager.findOne(sql, new UserBeanMapping());
	}

	public static UserBean getUser(int pk_id) throws SQLException{
		String sql = "SELECT T_USER.PK_ID AS PK_ID, " +
				"T_USER.USERNAME AS USERNAME, " +
				"T_USER.PASSWORD AS PASSWORD, " +
				"T_USER.MESSAGE AS MESSAGE, " +
				"T_USER.USER_ID AS USER_ID, " +
				"T_USER.INVEST_TIME AS INVEST_TIME,"+
				"T_ICON.ICON_NAME AS ICON_NAME " +
				"FROM T_USER " +
				"RIGHT OUTER JOIN T_ICON ON T_USER.PK_ID = T_ICON.FK_USER " +
				"WHERE PK_ID = '" + pk_id + "';";
		return DBManager.findOne(sql, new UserBeanMapping());
	}

	public static List<UserBean> getUserList() throws SQLException{
		String sql = "SELECT PK_ID, USERNAME, PASSWORD, USER_ID FROM T_USER";
		return DBManager.findAll(sql, new UserBeanMapping());
	}
	public static UserBean checkUserAccount(UserBean ubean) throws SQLException{
		String sql = "SELECT T_USER.PK_ID AS PK_ID, " +
				"T_USER.USERNAME AS USERNAME, " +
				"T_USER.PASSWORD AS PASSWORD, " +
				"T_USER.MESSAGE AS MESSAGE, " +
				"T_USER.USER_ID AS USER_ID, " +
				"T_USER.INVEST_TIME AS INVEST_TIME,"+
				"T_ICON.ICON_NAME AS ICON_NAME " +
				"FROM T_USER " +
				"RIGHT OUTER JOIN T_ICON ON T_USER.PK_ID = T_ICON.FK_USER " +
				"WHERE USER_ID = '" + ubean.getUser_id() + "';";
		return DBManager.findOne(sql, new UserBeanMapping());
	}
	public static int checkUserId(UserBean ubean) throws SQLException{
		String sql = "SELECT COUNT(USER_ID) FROM T_USER WHERE USER_ID = '" + ubean.getUser_id() + "'";
		return DBManager.simpleCount(sql);
	}
	/*public static List<UserBean> getUserAccount() throws SQLException{
		String sql = "SELECT USERNAME, PASSWORD, USER_ID FROM T_USER WHERE USER_ID = '" + ubean.getId() + "'";
		return DBManager.findAll(sql, new UserBeanMapping());
	}*/
	public static int userUpdate(UserBean ubean) throws SQLException{
		String sql1 = "UPDATE T_USER SET USERNAME = '" + ubean.getUsername() + "', " +
				"MESSAGE = '" + ubean.getMessage() + "'" +
				"WHERE PK_ID = " + ubean.getPk_id();
		String sql2 = "SELECT PK_ICON FROM T_ICON " +
				"WHERE FK_USER = " + ubean.getPk_id();
		return DBManager.getUpdate(sql1, sql2);
	}
	public static String currentIcon(UserBean ubean)throws SQLException{
		String sql = "SELECT ICON_NAME FROM T_ICON WHERE FK_USER = '" + ubean.getPk_id() + "'";
		return DBManager.simpleGet(sql);
	}
	public static void icon_update(String pk_id, String icon_name)throws SQLException{
		String sql = "UPDATE T_ICON SET ICON_NAME = '" + icon_name + "'" +
				"WHERE FK_USER = " + pk_id;
		DBManager.simpleUpdate(sql);
	}
	public static void deleteUser(int pk_id) throws SQLException{
		String sql = "DELETE FROM T_USER WHERE PK_ID =  " + pk_id + ";";
		DBManager.simpleUpdate(sql);
	}
	public static String getIconName(int pk_id) throws SQLException{
		String sql = "SELECT ICON_NAME FROM T_ICON WHERE FK_USER = " + pk_id + ";";
		return DBManager.simpleGet(sql);
	}


	public static int updateUserProfile(String pk_id,String user_id,String item,String edit)throws SQLException {
		String sql = "UPDATE t_user SET "+item+"='"+edit+"' WHERE pk_id='"+pk_id+"' and user_id='"+user_id+"';";
		return DBManager.simpleUpdate(sql);
	}


	public static UserBean getSearchUser(String searchword)throws SQLException{
		String sql = "SELECT T_USER.PK_ID AS PK_ID, " +
				"T_USER.USERNAME AS USERNAME, " +
				"T_USER.PASSWORD AS PASSWORD, " +
				"T_USER.MESSAGE AS MESSAGE, " +
				"T_USER.USER_ID AS USER_ID, " +
				"T_USER.INVEST_TIME AS INVEST_TIME,"+
				"T_ICON.ICON_NAME AS ICON_NAME " +
				"FROM T_USER " +
				"RIGHT OUTER JOIN T_ICON ON T_USER.PK_ID = T_ICON.FK_USER " +
				"WHERE USERNAME ILIKE '%" + searchword + "%';";
		return DBManager.findOne(sql, new UserBeanMapping());
	}
}

