package database;

public class IndustryBean {
	private String iname,idis,ifut,weather;

	public IndustryBean(){
	}
	public IndustryBean(String iname,String idis,String ifut,String weather){
		this.iname=iname;
		this.idis=idis;
		this.ifut=ifut;
		this.weather = weather;
	}
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
	}
	public String getIdis() {
		return idis;
	}
	public void setIdis(String idis) {
		this.idis = idis;
	}
	public String getIfut() {
		return ifut;
	}
	public void setIfut(String ifut) {
		this.ifut = ifut;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}


}
