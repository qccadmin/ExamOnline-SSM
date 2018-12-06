package entity;

public class User {
	private int uid;
	private String upwd;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public User(int uid, String upwd) {
		super();
		this.uid = uid;
		this.upwd = upwd;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "Login [uid=" + uid + ", upwd=" + upwd + "]";
	}
	
}
