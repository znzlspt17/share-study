package vo;

public class BoardVO {
	int bno, hits, status;
	String writer, title, contents, ip, regdate;

	public BoardVO() {
	}

	public BoardVO(String writer, String title, String contents, int hits, String ip, int status) {
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.hits = hits;
		this.ip = ip;
		this.status = status;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", writer=" + writer + ", title=" + title + ", contents=" + contents
				+ ", regdate=" + regdate + ", hits=" + hits + ", ip=" + ip + ", status=" + status + "]";
	}
}
