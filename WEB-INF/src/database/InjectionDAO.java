package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class InjectionDAO {
	public static int insertInfo(String insert)throws SQLException {
		String sql = "insert into injection_sample(name) values('"+insert+"')";
		return DBManager.simpleUpdate(sql);
	}

	public static int insertInfoPS(String insert)throws SQLException {
		String sql = "insert into injection_sample(name) values(?)";

		Connection con = DBManager.getConnection();
		PreparedStatement smt = con.prepareStatement(sql);
		smt.setString(1,insert);

		return DBManager.simpleUpdate(smt,con);
	}

	public static List<UserBean> getUser(String user_id) throws SQLException{
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
		return DBManager.findAll(sql, new UserBeanMapping());
	}
}
