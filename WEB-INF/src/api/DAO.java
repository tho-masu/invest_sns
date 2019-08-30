package api;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.StringJoiner;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

import database.BookmarkBean;
import database.BookmarkBeanMapping;
import database.CommentBean;
import database.CommentBeanMapping;
import database.DBManager;
import database.FollowBean;
import database.FollowBeanMapping;
import database.IndustryBean;
import database.IndustryBeanMapping;
import database.UserBean;
import database.UserBeanMapping;
import database.UserDAO;

public class DAO {

/* ここからAPI用DAO */

	public static JsonNode getCompanyInfo(String scode){
		HashMap<String,String> query = new HashMap<String,String>();
		query.put("quote", scode);
		query.put("item","v-name,v-name_en,short_name,co_settle_fy_ended,price,co_per,co_settle_roe,marketcap,co_settle_dps,co_settle_dividend_payout,price_chg,price_pchg");

		String result = APIManager.getData("quote", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null;
				;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode dnode = node.get("quote").get("data").get(0);

		return dnode;

	}

	public static JsonNode getCompanyHistorical(String scode,String days){
		HashMap<String,String> query = new HashMap<String,String>();
		query.put("quote", scode);
		query.put("item","price,price_pchg");/*菅野price_pchg追加*/
		query.put("count",days);
		query.put("direction","backward");

		String result = APIManager.getData("historical_daly_count", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null
				;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode hnode = node.get("historical_daily").get("data").get(0).get("value");

		return hnode;
	}

	public static JsonNode getCompanyNews(String sname){
		HashMap<String,String> query = new HashMap<String,String>();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd000000");
        String date = sdf.format(cal.getTime()).toString();

        //sname（銘柄略称）を適切に（UTF-8に）変換
        //変換しないとキーワード検索がエラーになってしまう
        String utf8sname = null;
        try {
			utf8sname = URLEncoder.encode(sname,"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}


		query.put("genre", "NNN");
		query.put("from_date_time",date);
		query.put("limit", "10");
		query.put("keyword", utf8sname);
		query.put("article","true");

		String result = APIManager.getData("news_headline", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null
				;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode nnode = node.get("news_headline").get("data");

		return nnode;

	}

	public static JsonNode getNikkei225(){
		HashMap<String,String> query = new HashMap<String,String>();
		query.put("universe", "nikkei225");
		query.put("universe_limit","225");
		query.put("item","industry_name,industry_name_en,v-name,securities_code,price");

		String result = APIManager.getData("quote", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null
				;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode unode = node.get("quote").get("data");

		return unode;
	}

	public static JsonNode getNikkei225IntradayHistorical() {
		HashMap<String,String> query = new HashMap<String,String>();
		query.put("quote", "101/T");
		query.put("item","price");
		query.put("date_count", "1");
		query.put("direction","backward");
		query.put("minute","5");

		String result = APIManager.getData("historical_intraday_daycount", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null
				;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode hnode = node.get("historical_intraday").get("data").get(0).get("value");

		return hnode;
	}

	public static JsonNode getIndustryAverageHistorical(ArrayNode anode) {
		HashMap<String,String> query = new HashMap<String,String>();
		StringJoiner join = new StringJoiner(",", "", "");
		if(anode.size()<=10) {
			for(JsonNode jnode : anode) {
				join.add(jnode.get("securities_code").asText());
			}
		}else {
			for(int i=0;i<10;i++) {
				join.add(anode.get(i).get("securities_code").asText());
			}
		}

		query.put("quote", join.toString());
		query.put("item","price");
		query.put("count", "12");
		query.put("direction","backward");

		String result = APIManager.getData("historical_monthly_count", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null
				;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode hnode = node.get("historical_monthly").get("data");

		return hnode;
	}
	/*菅野追加*/
	public static JsonNode getCompanyHistorical_count(String scode,String days){
		HashMap<String,String> query = new HashMap<String,String>();
		query.put("quote", scode);
		query.put("item","price_pchg");
		query.put("count",days);
		query.put("direction","backword");

		String result = APIManager.getData("historical_daly_count", query);

		ObjectMapper mapper = new ObjectMapper();

		JsonNode node=null;
		try {
			node = mapper.readTree(result);
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode hcnode = node.get("historical_daily").get("data").get(0).get("value");

		return hcnode;
	}

/* ここまでAPI用DAO */

/* ここからDB用DAO */

	public static IndustryBean getIndustryInfo(String iname)throws SQLException{
		String sql="SELECT industry_name,industry_dis,industry_fut,weather FROM t_industry where industry_name='"+iname+"';";
		List<IndustryBean> ilist = DBManager.findAll(sql, new IndustryBeanMapping());
		return ilist.get(0);
	}

	public static List<IndustryBean> getIndustryList()throws SQLException{
		String sql="SELECT industry_name,industry_dis,industry_fut,weather FROM t_industry order by pk_industry asc;";
		return DBManager.findAll(sql, new IndustryBeanMapping());
	}

	public static int registerCompanyComment(int pk_id,String quote,String comment)throws SQLException{
		String sql="INSERT INTO t_comment_com"+
				"(fk_user,quote,comment,com_date) VALUES("+
				"?,?,?,"+"now()"+");";
		Connection con = DBManager.getConnection();
		PreparedStatement smt = con.prepareStatement(sql);
		smt.setInt(1,pk_id);
		smt.setInt(2, Integer.parseInt(quote));
		smt.setString(3, comment);

		return DBManager.simpleUpdate(smt,con);
	}

	public static int registerIndustryComment(int pk_id,String iname,String comment)throws SQLException{
		String sql="INSERT INTO t_comment_ind"+
				"(fk_user,industry_name,comment,com_date) VALUES("+
				"?,?,?,"+"now()"+");";
		Connection con = DBManager.getConnection();
		PreparedStatement smt = con.prepareStatement(sql);
		smt.setInt(1,pk_id);
		smt.setString(2,iname);
		smt.setString(3, comment);
		return DBManager.simpleUpdate(smt,con);
	}

	public static int registerMarketComment(int pk_id,String comment)throws SQLException{
		String sql="INSERT INTO t_comment_mar"+
				"(fk_user,comment,com_date) VALUES("+
				"?,?,"+"now()"+");";
		Connection con = DBManager.getConnection();
		PreparedStatement smt = con.prepareStatement(sql);
		smt.setInt(1, pk_id);
		smt.setString(2, comment);
		return DBManager.simpleUpdate(smt,con);
	}

	public static int registerArticleComment(int pk_id,String pk_post,String comment)throws SQLException{
		String sql="INSERT INTO t_comment_art"+
				"(fk_user,fk_post,comment,com_date) VALUES("+
				"?,?,?,"+"now()"+");";
		Connection con = DBManager.getConnection();
		PreparedStatement smt = con.prepareStatement(sql);
		smt.setInt(1, pk_id);
		smt.setInt(2, Integer.parseInt(pk_post));
		smt.setString(3, comment);
		return DBManager.simpleUpdate(smt,con);
	}

	public static List<CommentBean> getCompanyCommentList(String quote)throws SQLException{
		String sql="SELECT pk_comment,t_comment_com.fk_user as fk_user,username,user_id,icon_name,comment,com_date FROM t_comment_com INNER JOIN t_user ON t_comment_com.fk_user=t_user.pk_id INNER JOIN t_icon ON t_comment_com.fk_user=t_icon.fk_user where quote='"+quote+"' order by com_date asc;";
		return DBManager.findAll(sql, new CommentBeanMapping());
	}

	public static List<CommentBean> getIndustryCommentList(String iname)throws SQLException{
		String sql="SELECT pk_comment,t_comment_ind.fk_user as fk_user,username,user_id,icon_name,comment,com_date FROM t_comment_ind INNER JOIN t_user ON t_comment_ind.fk_user=t_user.pk_id INNER JOIN t_icon ON t_comment_ind.fk_user=t_icon.fk_user where industry_name='"+iname+"' order by com_date asc;";
		return DBManager.findAll(sql, new CommentBeanMapping());
	}

	public static List<CommentBean> getMarketCommentList()throws SQLException{
		String sql="SELECT pk_comment,t_comment_mar.fk_user as fk_user,username,user_id,icon_name,comment,com_date FROM t_comment_mar INNER JOIN t_user ON t_comment_mar.fk_user=t_user.pk_id INNER JOIN t_icon ON t_comment_mar.fk_user=t_icon.fk_user order by com_date asc;";
		return DBManager.findAll(sql, new CommentBeanMapping());
	}

	public static List<CommentBean> getArticleCommentList(int pk_post)throws SQLException{
		String sql="SELECT pk_comment,t_comment_art.fk_user as fk_user,username,user_id,icon_name,comment,com_date FROM t_comment_art INNER JOIN t_user ON t_comment_art.fk_user=t_user.pk_id INNER JOIN t_icon ON t_comment_art.fk_user=t_icon.fk_user where fk_post='"+pk_post+"' order by com_date asc;";
		return DBManager.findAll(sql, new CommentBeanMapping());
	}

	public static int deleteCompanyComment(String pk_comment,String fk_user)throws SQLException{
		String sql="delete from t_comment_com where pk_comment='"+pk_comment+"' and fk_user='"+fk_user+"';";
		return DBManager.simpleUpdate(sql);
	}

	public static int deleteIndustryComment(String pk_comment,String fk_user)throws SQLException{
		String sql="delete from t_comment_ind where pk_comment='"+pk_comment+"' and fk_user='"+fk_user+"';";
		return DBManager.simpleUpdate(sql);
	}

	public static int deleteMarketComment(String pk_comment,String fk_user)throws SQLException{
		String sql="delete from t_comment_mar where pk_comment='"+pk_comment+"' and fk_user='"+fk_user+"';";
		return DBManager.simpleUpdate(sql);
	}

	public static int deleteArticleComment(String pk_comment,String fk_user)throws SQLException{
		String sql="delete from t_comment_art where pk_comment='"+pk_comment+"' and fk_user='"+fk_user+"';";
		return DBManager.simpleUpdate(sql);
	}

	public static boolean isRegisteredBookmark(int user_id,String quote)throws SQLException {
		String sql="SELECT COUNT(*) FROM t_bookmark WHERE fk_user='"+user_id+"' and quote='"+quote+"';";
		int count = DBManager.count(sql);
		if(count==0) {
			return false;
		}else {
			return true;
		}
	}

	public static int registerBookmark(int pk_id,String quote)throws SQLException {
		String sql="INSERT INTO t_bookmark(fk_user,quote) VALUES('"+pk_id+"','"+quote+"');";
		return DBManager.simpleUpdate(sql);
	}

	public static int deleteBookmark(int pk_id,String quote)throws SQLException {
		String sql="DELETE FROM t_bookmark WHERE fk_user='"+pk_id+"' and quote='"+quote+"';";
		return DBManager.simpleUpdate(sql);
	}

	public static ArrayNode getBookmarkList(int pk_id)throws SQLException {
		String sql="SELECT * FROM t_bookmark WHERE fk_user='"+pk_id+"';";
		List<BookmarkBean> list = DBManager.findAll(sql,new BookmarkBeanMapping());

		ObjectMapper mapper = new ObjectMapper();
		ArrayNode anode = mapper.createArrayNode();

		for(BookmarkBean bbean : list) {
			anode.add(getCompanyInfo(String.valueOf(bbean.getQuote())));
		}
		return anode;
	}

	public static boolean isRegisteredFollow(int user_id,int followed_user)throws SQLException {
		String sql="SELECT COUNT(*) FROM t_follow WHERE fk_user='"+user_id+"' and followed_user='"+followed_user+"';";
		int count = DBManager.count(sql);
		if(count==0) {
			return false;
		}else {
			return true;
		}
	}

	public static int registerFollow(int pk_id,int followed_user)throws SQLException {
		String sql="INSERT INTO t_follow(fk_user,followed_user) VALUES('"+pk_id+"','"+followed_user+"');";
		return DBManager.simpleUpdate(sql);
	}

	public static int deleteFollow(int pk_id,int followed_user)throws SQLException {
		String sql="DELETE FROM t_follow WHERE fk_user='"+pk_id+"' and followed_user='"+followed_user+"';";
		return DBManager.simpleUpdate(sql);
	}

	public static List<UserBean> getFollowList(int pk_id)throws SQLException {
		String sql="SELECT * FROM t_follow WHERE fk_user='"+pk_id+"';";
		List<FollowBean> flist = DBManager.findAll(sql,new FollowBeanMapping());

		List<UserBean> ulist = new ArrayList<UserBean>();

		for(FollowBean fbean : flist) {
			ulist.add(UserDAO.getUser(fbean.getFollowed_user()));
		}
		return ulist;
	}

	public static List<UserBean> getFollowerList(int followed_user)throws SQLException {
		String sql="SELECT * FROM t_follow WHERE followed_user='"+followed_user+"';";
		List<FollowBean> flist = DBManager.findAll(sql,new FollowBeanMapping());

		List<UserBean> ulist = new ArrayList<UserBean>();

		for(FollowBean fbean : flist) {
			ulist.add(UserDAO.getUser(fbean.getFk_user()));
		}
		return ulist;
	}

	public static List<UserBean> getUnfollowedList(int pk_id) throws SQLException{
		String sql = "select * from t_user u right outer join t_icon i on u.pk_id=i.fk_user where not exists"+
				"(select followed_user from t_follow f where "
				+ "(u.pk_id=f.followed_user AND f.fk_user='"+pk_id+"')"
						+ "or u.pk_id='"+pk_id+"');";
		return DBManager.findAll(sql, new UserBeanMapping());
	}
}
