package recipe.dto;

public class RecipeBoardGoodDTO {
	private String id;
	private int num;
	//
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public RecipeBoardGoodDTO() {}
	public RecipeBoardGoodDTO(String id, int num) {
		this.id = id;
		this.num = num;
	}
	@Override
	public String toString() {
		return "RecipeBoardGood [id=" + id + ", num=" + num + "]";
	}
}
