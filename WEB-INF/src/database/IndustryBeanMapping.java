package database;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IndustryBeanMapping implements ResultSetBeanMapping<IndustryBean> {
	public IndustryBean createFromResultSet(ResultSet rs)throws SQLException{
		IndustryBean ibean=new IndustryBean(rs.getString("industry_name"),rs.getString("industry_dis"),rs.getString("industry_fut"));
		return ibean;
	}
}
