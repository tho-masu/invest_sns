package database;

public class FollowBean {
	private int pk_follow,fk_user,followed_user;

	public FollowBean(int pk_follow, int fk_user, int followed_user) {
		super();
		this.pk_follow = pk_follow;
		this.fk_user = fk_user;
		this.followed_user = followed_user;
	}

	public int getPk_follow() {
		return pk_follow;
	}

	public void setPk_follow(int pk_follow) {
		this.pk_follow = pk_follow;
	}

	public int getFk_user() {
		return fk_user;
	}

	public void setFk_user(int fk_user) {
		this.fk_user = fk_user;
	}

	public int getFollowed_user() {
		return followed_user;
	}

	public void setFollowed_user(int followed_user) {
		this.followed_user = followed_user;
	}


}
