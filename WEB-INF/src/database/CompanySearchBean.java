package database;

public class CompanySearchBean {
	private int quote;
	private String vName,vNameEn;

	public CompanySearchBean(int quote, String vName, String vNameEn) {
		this.quote = quote;
		this.vName = vName;
		this.vNameEn = vNameEn;
	}

	public int getQuote() {
		return quote;
	}

	public void setQuote(int quote) {
		this.quote = quote;
	}

	public String getvName() {
		return vName;
	}

	public void setvName(String vName) {
		this.vName = vName;
	}

	public String getvNameEn() {
		return vNameEn;
	}

	public void setvNameEn(String vNameEn) {
		this.vNameEn = vNameEn;
	}

}
