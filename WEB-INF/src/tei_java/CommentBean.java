package tei_java;

import java.sql.Date;
import java.sql.Time;

public class CommentBean {



	private int quote;
	private String comment;
	private Date com_date;
	private Time com_time;

	public CommentBean(){

	}

	public CommentBean(int quote, String comment){
		this.quote = quote;
		this.comment = comment;
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

	public Date getCom_date() {
		return com_date;
	}

	public void setCom_date(Date com_date) {
		this.com_date = com_date;
	}

	public Time getCom_time() {
		return com_time;
	}

	public void setCom_time(Time com_time) {
		this.com_time = com_time;
	}


}
