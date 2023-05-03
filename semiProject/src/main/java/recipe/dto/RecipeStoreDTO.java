package recipe.dto;

public class RecipeStoreDTO {
	private int snum;
	private String sname;
	private int price;
	private String description;
	private String picture;
	private String show;
	//
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public RecipeStoreDTO() {}
	public RecipeStoreDTO(int snum, String sname, int price, String description, String picture, String show) {
		super();
		this.snum = snum;
		this.sname = sname;
		this.price = price;
		this.description = description;
		this.picture = picture;
		this.show = show;
	}
	@Override
	public String toString() {
		return "RecipeStoreDTO [snum=" + snum + ", sname=" + sname + ", price=" + price + ", description=" + description
				+ ", picture=" + picture + ", show=" + show + "]";
	}	
}
