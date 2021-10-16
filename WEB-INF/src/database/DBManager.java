package database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBManager {
	public static Connection getConnection()throws SQLException{
		try{
			Class.forName("org.postgresql.Driver");
			//以下は8～9月の研修にて開発時の接続先
			//Connection con=DriverManager.getConnection("jdbc:postgresql://172.22.129.6:5432/investagram","postgres","postgres");
			Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/investagram","postgres","postgres");
			return con;
		}catch(ClassNotFoundException e){
			throw new SQLException(e);
		}
	}

	public static <T> List<T> findAll(String sql,ResultSetBeanMapping<T> mapping)throws SQLException{
		Connection con=null;
		Statement smt=null;
		try{
			con=getConnection();
			smt=con.createStatement();
			ResultSet rs=smt.executeQuery(sql);

			List<T> list=new ArrayList<T>();
			while(rs.next()){
				T bean=mapping.createFromResultSet(rs);
				list.add(bean);
			}
			return list;
		}finally{
			if(smt!=null){
				try{
					smt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(con!=null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	}

	public static <T> List<T> findAll(PreparedStatement smt,Connection con,ResultSetBeanMapping<T> mapping)throws SQLException{

		try{
			ResultSet rs=smt.executeQuery();

			List<T> list=new ArrayList<T>();
			while(rs.next()){
				T bean=mapping.createFromResultSet(rs);
				list.add(bean);
			}
			return list;
		}finally{
			if(smt!=null){
				try{
					smt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(con!=null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	}

	public static int getUpdate(String sql1, String sql2) throws SQLException{
		Connection con = null;
		Statement smt = null;
		try{
			con = getConnection();
			smt = con.createStatement();
			smt.executeUpdate(sql1);
			ResultSet rs = smt.executeQuery(sql2);
			int pk_id = 0;
			if (rs.next()) {
				pk_id = rs.getInt(1);
			}
			return pk_id;
		}finally{
			if(smt != null){
				try{
					smt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(con != null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	}

	public static String simpleGet(String sql) throws SQLException{
		Connection con = null;
		Statement smt = null;
		try{
			con = getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);
			String msg = "";
			if (rs.next()) {
				msg = rs.getString(1);
			}
			return msg;
		}finally{
			if(smt != null){
				try{
					smt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(con != null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	}

	public static int simpleCount(String sql) throws SQLException{
		Connection con = null;
		Statement smt = null;
		try{
			con = getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);
			int count = 1;
			if (rs.next()) {
				count = rs.getInt(1);
			}
			return count;
		}finally{
			if(smt != null){
				try{
					smt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(con != null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	}

	public static int simpleCount(PreparedStatement smt,Connection con) throws SQLException{
		try{
			ResultSet rs = smt.executeQuery();
			int count = 1;
			if (rs.next()) {
				count = rs.getInt(1);
			}
			return count;
		}finally{
			if(smt != null){
				try{
					smt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(con != null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	}

	public static <T>T findOne(String sql, ResultSetBeanMapping<T> mapping)throws SQLException{
		Connection con = null;
		Statement smt = null;
		try{
			con = getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);
			T bean = null;
			while(rs.next()){
				bean = mapping.createFromResultSet(rs);
			}
			return bean;
		}finally{
			if(smt != null){
				try{
					smt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(con != null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	}

	public static int simpleUpdate(String sql)throws SQLException{
		Connection con=null;
		Statement smt=null;
		try{
			con=getConnection();
			smt=con.createStatement();
			return smt.executeUpdate(sql);
		}finally{
				try{
					smt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}


			if(con!=null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	}

	public static int simpleUpdate(PreparedStatement smt ,Connection con)throws SQLException{

		try{
			return smt.executeUpdate();
		}finally{
				try{
					smt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}


			if(con!=null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	}

	public static int count(String sql)throws SQLException{
		Connection con=null;
		Statement smt=null;
		try{
			con=getConnection();
			smt=con.createStatement();
			ResultSet rs=smt.executeQuery(sql);
			rs.next();
			return rs.getInt(1);

		}finally{
			if(smt!=null){
				try{
					smt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(con!=null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	}
}



