package database;

import java.sql.Date;
import java.sql.Time;

public class PostBean {
	private int pk_id;
	private String user_id;
	private String username;
	private String icon_name;
	private int pk_post;
	private int share_num;
	private int nice_num;
	private String article;
	private String caption;
	private Date create_date;
	private Time create_time;
	boolean isLoginAccountGood;

	public PostBean() {

	}

	public PostBean(int pk_id,String article) {
		this.pk_id = pk_id;
		this.article = article;
	}

	public int getPk_id() {
		return pk_id;
	}

	public void setPk_id(int pk_id) {
		this.pk_id = pk_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIcon_name() {
		return icon_name;
	}

	public void setIcon_name(String icon_name) {
		this.icon_name = icon_name;
	}

	public int getPk_post() {
		return pk_post;
	}

	public void setPk_post(int pk_post) {
		this.pk_post = pk_post;
	}

	public int getShare_num() {
		return share_num;
	}

	public void setShare_num(int share_num) {
		this.share_num = share_num;
	}

	public int getNice_num() {
		return nice_num;
	}

	public void setNice_num(int nice_num) {
		this.nice_num = nice_num;
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Time getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Time create_time) {
		this.create_time = create_time;
	}

	public boolean getIsLoginAccountGood() {
		return isLoginAccountGood;
	}

	public void setIsLoginAccountGood(boolean isLoginAccountGood) {
		this.isLoginAccountGood = isLoginAccountGood;
	}


}
