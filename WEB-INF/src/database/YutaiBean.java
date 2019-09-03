package database;

public class YutaiBean {

	private int pk_yutai,quote;
	private String title,subfld;


    public YutaiBean(){ }

    public YutaiBean(String title,String subfld,int quote,int pk_yutai) {

    	this.title=title;
    	this.subfld=subfld;
    	this.quote=quote;
    	this.pk_yutai=pk_yutai;





    }



	public int getPk_yutai() {
		return pk_yutai;
	}

	public void setPk_yutai(int pk_yutai) {
		this.pk_yutai = pk_yutai;
	}

	public int getQuote() {
		return quote;
	}

	public void setQuote(int quote) {
		this.quote = quote;
	}



	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubfld() {
		return subfld;
	}

	public void setSubfld(String subfld) {
		this.subfld = subfld;
	}
}
