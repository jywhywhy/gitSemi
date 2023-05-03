package recipe.dto;

import java.sql.Date;

public class RecipeBoardDTO {
	private int num;
	private String id;
	private String subject;
	private String content;
	private String filename;
	private Date post_date;
	private int read_count;
	private int good;
	private int parent_num;
	private int ref;
	private int re_step;
	private int re_level;
	private int notice;
	private String show;
	//
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getParent_num() {
		return parent_num;
	}
	public void setParent_num(int parent_num) {
		this.parent_num = parent_num;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public RecipeBoardDTO() {}
	public RecipeBoardDTO(int num, String id, String subject, String content, String filename, Date post_date,
			int read_count, int good, int parent_num, int ref, int re_step, int re_level, int notice, String show) {
		this.num = num;
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.filename = filename;
		this.post_date = post_date;
		this.read_count = read_count;
		this.good = good;
		this.parent_num = parent_num;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
		this.notice = notice;
		this.show = show;
	}
	@Override
	public String toString() {
		return "RecipeBoardDTO [num=" + num + ", id=" + id + ", subject=" + subject + ", content=" + content
				+ ", filename=" + filename + ", post_date=" + post_date + ", read_count=" + read_count + ", good="
				+ good + ", parent_num=" + parent_num + ", ref=" + ref + ", re_step=" + re_step + ", re_level="
				+ re_level + ", notice=" + notice + ", show=" + show + "]";
	}
}
