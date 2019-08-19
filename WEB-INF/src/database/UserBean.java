package database;

public class UserBean{
	private int pk_id;
	private String user_id;
	private String username;
	private String password;
	private String message;
    private String invest_time;
	private String icon_name;

	public UserBean(){

	}

	public UserBean(String user_id, String password){
		this.user_id = user_id;
		this.password = password;
	}

	public UserBean(String user_id, String username, String password){
		this.user_id = user_id;
		this.username = username;
		this.password = password;
	}

	public int getPk_id() {
		return pk_id;
	}

	public String getInvest_time() {
		return invest_time;
	}

	public void setInvest_time(String invest_time) {
		this.invest_time = invest_time;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getIcon_name() {
		return icon_name;
	}

	public void setIcon_name(String icon_name) {
		this.icon_name = icon_name;
	}

}
