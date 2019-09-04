package database;

public class LikeBean {

	private int count,quote;

	public LikeBean() { }

	public LikeBean(int count,int quote) {
		this.count=count;
		this.quote=quote;

	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getQuote() {
		return quote;
	}

	public void setQuote(int quote) {
		this.quote = quote;
	}


}
