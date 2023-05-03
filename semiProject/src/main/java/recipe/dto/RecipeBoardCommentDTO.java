package recipe.dto;

import java.sql.Date;

public class RecipeBoardCommentDTO {
	private int comment_num;
	private int num;
	private String id;
	private String content;
	private Date post_date;
	private String re;
	private int ref;
	private int re_step;
	private int re_level;
	private String show;
	//
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public String getRe() {
		return re;
	}
	public void setRe(String re) {
		this.re = re;
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
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public RecipeBoardCommentDTO() {}
	public RecipeBoardCommentDTO(int comment_num, int num, String id, String content, Date post_date, String re,
			int ref, int re_step, int re_level, String show) {
		this.comment_num = comment_num;
		this.num = num;
		this.id = id;
		this.content = content;
		this.post_date = post_date;
		this.re = re;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
		this.show = show;
	}
	@Override
	public String toString() {
		return "RecipeBoardCommentDTO [comment_num=" + comment_num + ", num=" + num + ", id=" + id + ", content="
				+ content + ", post_date=" + post_date + ", re=" + re + ", ref=" + ref + ", re_step=" + re_step
				+ ", re_level=" + re_level + ", show=" + show + "]";
	}
}
