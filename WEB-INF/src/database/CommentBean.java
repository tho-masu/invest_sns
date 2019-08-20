package database;

import java.sql.Time;
import java.util.Date;

public class CommentBean {
	private int pk_comment,fk_user,quote;
	private String comment,iname;
	private Date date;
	private Time time;

	public CommentBean() {}

	public CommentBean(int fk_user, String comment, Date date,Time time) {
		this.fk_user = fk_user;
		this.comment = comment;
		this.date = date;
		this.time = time;
	}

	public int getPk_comment() {
		return pk_comment;
	}

	public void setPk_comment(int pk_comment) {
		this.pk_comment = pk_comment;
	}

	public int getFk_user() {
		return fk_user;
	}

	public void setFk_user(int fk_user) {
		this.fk_user = fk_user;
	}

	public int getQuote() {
		return quote;
	}

	public void setQuote(int quote) {
		this.quote = quote;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

}
