package database;

public class BookmarkBean {
	private int pk_bookmark,fk_user,quote;

	public BookmarkBean(int pk_bookmark, int fk_user, int quote) {
		super();
		this.pk_bookmark = pk_bookmark;
		this.fk_user = fk_user;
		this.quote = quote;
	}

	public int getPk_bookmark() {
		return pk_bookmark;
	}

	public void setPk_bookmark(int pk_bookmark) {
		this.pk_bookmark = pk_bookmark;
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

	public void setQuote(int qute) {
		this.quote = qute;
	}


}
