package dto;

public class ShoutDTO {

	// テーブルのカラムに合わせて変数を定義
	private int shoutsId;
	private String userName;
	private String icon;
	private String date;
	private String writing;

	// コンストラクタ（空の箱を作る）
	public ShoutDTO() {
	}

	// ゲッターとセッター
	public int getShoutsId() {
		return shoutsId;
	}

	public void setShoutsId(int shoutsId) {
		this.shoutsId = shoutsId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWriting() {
		return writing;
	}

	public void setWriting(String writing) {
		this.writing = writing;
	}
}
