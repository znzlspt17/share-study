package vo;

public class MemberVO {
	String id, name, pwd;
	int mno, point;

	public MemberVO() {
	}

	public MemberVO(String id, String name, String pwd, int mno, int point) {
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.mno = mno;
		this.point = point;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

}
