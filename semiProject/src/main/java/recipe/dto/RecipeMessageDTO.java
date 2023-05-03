package recipe.dto;

import java.util.Date;

public class RecipeMessageDTO {
	private int mnum;
	private String sender;
	private String receiver;
	private String content;
	private Date post_date;
	private String read;
	//
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
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
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public RecipeMessageDTO() {}
	public RecipeMessageDTO(int mnum, String sender, String receiver, String content, Date post_date, String read) {
		this.mnum = mnum;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.post_date = post_date;
		this.read = read;
	}
	@Override
	public String toString() {
		return "RecipeMessageDTO [mnum=" + mnum + ", sender=" + sender + ", receiver=" + receiver + ", content="
				+ content + ", post_date=" + post_date + ", read=" + read + "]";
	}
}
