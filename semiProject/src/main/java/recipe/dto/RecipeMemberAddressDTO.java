package recipe.dto;

public class RecipeMemberAddressDTO {
	private int anum;
	private String aname;
	private String id;
	private String zipcode;
	private String address1;
	private String address2;
	private String default_address;
	private String show;
	//
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getDefault_address() {
		return default_address;
	}
	public void setDefault_address(String default_address) {
		this.default_address = default_address;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public RecipeMemberAddressDTO() {}
	public RecipeMemberAddressDTO(int anum, String aname, String id, String zipcode, String address1, String address2,
			String default_address, String show) {
		this.anum = anum;
		this.aname = aname;
		this.id = id;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.default_address = default_address;
		this.show = show;
	}
	@Override
	public String toString() {
		return "RecipeMemberAddressDTO [anum=" + anum + ", aname=" + aname + ", id=" + id + ", zipcode=" + zipcode
				+ ", address1=" + address1 + ", address2=" + address2 + ", default_address=" + default_address
				+ ", show=" + show + "]";
	}
}
