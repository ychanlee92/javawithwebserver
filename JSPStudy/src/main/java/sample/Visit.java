package sample;

public class Visit {
	private int no;
	private String writer;
	private String memo;
	private String regDate;

	public Visit() {
		super();
	}

	public Visit(int no, String writer, String memo, String regDate) {
		super();
		this.no = no;
		this.writer = writer;
		this.memo = memo;
		this.regDate = regDate;
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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Visit [no=" + no + ", writer=" + writer + ", memo=" + memo + ", regDate=" + regDate + "]";
	}

}
