package recipe.dto;

import java.sql.Date;

public class RecipeMemberDTO {
	private String id;
	private String name;
	private String password;
	private Date birth_date;
	private Date reg_date;
	private int point;
	private String admin;
	private String admin2;
	private String show;
	//
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(Date birth_date) {
		this.birth_date = birth_date;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getAdmin2() {
		return admin2;
	}
	public void setAdmin2(String admin2) {
		this.admin2 = admin2;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public RecipeMemberDTO() {}
	public RecipeMemberDTO(String id, String name, String password, Date birth_date, Date reg_date, int point,
			String admin, String admin2, String show) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.birth_date = birth_date;
		this.reg_date = reg_date;
		this.point = point;
		this.admin = admin;
		this.admin2 = admin2;
		this.show = show;
	}
	@Override
	public String toString() {
		return "RecipeMemberDTO [id=" + id + ", name=" + name + ", password=" + password + ", birth_date=" + birth_date
				+ ", reg_date=" + reg_date + ", point=" + point + ", admin=" + admin + ", admin2=" + admin2 + ", show="
				+ show + "]";
	}
}
