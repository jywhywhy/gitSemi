package recipe.dto;

public class RecipeStoreBasketDTO {
	private int bnum;
	private String id;
	private int snum;
	private String sname;
	private int amount;
	private int price;
	private int money;
	private String show;
	//
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMoney() {
		return price * amount;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public RecipeStoreBasketDTO() {}
	public RecipeStoreBasketDTO(int bnum, String id, int snum, int amount, String sname, int price, int money,
			String show) {
		this.bnum = bnum;
		this.id = id;
		this.snum = snum;
		this.amount = amount;
		this.sname = sname;
		this.price = price;
		this.money = money;
		this.show = show;
	}
	@Override
	public String toString() {
		return "RecipeStoreBasketDTO [bnum=" + bnum + ", id=" + id + ", snum=" + snum + ", amount=" + amount
				+ ", sname=" + sname + ", price=" + price + ", money=" + money + ", show=" + show + "]";
	}
}
