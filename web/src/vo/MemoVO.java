package vo;

public class MemoVO {
	int no;
	String writer;
	String contents;
	String ip;
	int hits;
	int status;

	public MemoVO() {
	}

	public MemoVO(int no, String writer, String contents, String ip, int hits, int status) {
		this.no = no;
		this.writer = writer;
		this.contents = contents;
		this.ip = ip;
		this.hits = hits;
		this.status = status;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MemoVO [no=" + no + ", writer=" + writer + ", contents=" + contents + ", ip=" + ip + ", hits=" + hits
				+ ", status=" + status + "]";
	}

}
