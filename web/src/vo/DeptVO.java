package vo;

public class DeptVO {
	int deptno;
	String dname;
	String loc;

	public DeptVO() {
	}

	public DeptVO(int detpno, String dname, String loc) {
		this.deptno = detpno;
		this.dname = dname;
		this.loc = loc;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

}
