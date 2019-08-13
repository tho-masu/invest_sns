package api;

public class CompanyBean {
	private String v_name,v_name_en,co_settle_fy_ended;
	private double price,co_per,co_settle_roe,marketcap,co_settle_dps;



	public CompanyBean(){
	}


	public CompanyBean(String v_name, String v_name_en, String gc_earning, double co_per, double co_settle_roe,
			double marketcap, double co_settle_dps) {
		super();
		this.v_name = v_name;
		this.v_name_en = v_name_en;
		this.co_settle_fy_ended = co_settle_fy_ended;
		this.co_per = co_per;
		this.co_settle_roe = co_settle_roe;
		this.marketcap = marketcap;
		this.co_settle_dps = co_settle_dps;
	}



	public String getV_name() {
		return v_name;
	}



	public void setV_name(String v_name) {
		this.v_name = v_name;
	}



	public String getV_name_en() {
		return v_name_en;
	}



	public void setV_name_en(String v_name_en) {
		this.v_name_en = v_name_en;
	}


	public String getCo_settle_fy_ended() {
		return co_settle_fy_ended;
	}


	public void setCo_settle_fy_ended(String co_settle_fy_ended) {
		this.co_settle_fy_ended = co_settle_fy_ended;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public double getCo_per() {
		return co_per;
	}



	public void setCo_per(double co_per) {
		this.co_per = co_per;
	}



	public double getCo_settle_roe() {
		return co_settle_roe;
	}



	public void setCo_settle_roe(double co_settle_roe) {
		this.co_settle_roe = co_settle_roe;
	}



	public double getMarketcap() {
		return marketcap;
	}



	public void setMarketcap(double marketcap) {
		this.marketcap = marketcap;
	}



	public double getCo_settle_dps() {
		return co_settle_dps;
	}



	public void setCo_settle_dps(double co_settle_dps) {
		this.co_settle_dps = co_settle_dps;
	}


}
