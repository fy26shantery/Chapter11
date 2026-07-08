package dto;

// ユーザー情報を保持するクラス
public class UserDTO {
	private String loginId; //ログインID
	private String password; //パスワード
	private String userName; //ユーザ名
	private String icon; //ユーザーアイコン
	private String profile; //プロフィール

	public String getLoginId() {
		return loginId;
	}

	public String getPassword() {
		return password;
	}

	public String getUserName() {
		return userName;
	}

	public String getIcon() {
		return icon;
	}

	public String getProfile() {
		return profile;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public UserDTO() {

	}

	public UserDTO(String loginId, String password, String userName, String icon, String profile) {
		this.loginId = loginId;
		this.password = password;
		this.userName = userName;
		this.icon = icon;
		this.profile = profile;
	}

}
