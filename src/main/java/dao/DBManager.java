package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import dto.ShoutDTO;
import dto.UserDTO;

public class DBManager extends SnsDAO {

	// ログインID とパスワードを受け取り、登録ユーザ一覧に一致したものがあるか検索
	public UserDTO getLoginUser(String loginId, String password) {

		//プレースホルダーしておく
		String sql = "SELECT * FROM users WHERE loginId=? AND password=?";
		UserDTO user = null; // 登録ユーザ情報

		//try-with-resourcesで自動クローズ
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, loginId);
			pstmt.setString(2, password);

			// ResultSetも自動クローズにする
			try (ResultSet rset = pstmt.executeQuery()) {
				// 検索結果があるかどうか
				if (rset.next()) {
					// userオブジェクトを作り、DTOに詰める
					user = new UserDTO();
					user.setLoginId(rset.getString(2));
					user.setPassword(rset.getString(3));
					user.setUserName(rset.getString(4));
					user.setIcon(rset.getString(5));
					user.setProfile(rset.getString(6));

					return user; //サーブレットに返す
				}
			}

		} catch (SQLException e) {
			//SQLやDBが壊れているとき用
			e.printStackTrace();
		}
		return null; //ユーザーが見つからない場合かエラーが起きた時
	}

	//shoutsテーブルのデータを全件取得
	public ArrayList<ShoutDTO> getShoutList() {
		ArrayList<ShoutDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM shouts ORDER BY date DESC";

		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rset = pstmt.executeQuery()) {

			//何行あるかわからないから、while文で回す
			while (rset.next()) {
				//見つかる度、空の箱を作る
				ShoutDTO dto = new ShoutDTO();
				dto.setShoutsId(rset.getInt("shoutsId"));
				dto.setUserName(rset.getString("userName"));
				dto.setIcon(rset.getString("icon"));
				dto.setDate(rset.getString("date"));
				dto.setWriting(rset.getString("writing"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// ログインユーザー情報と書き込み内容を受け取り、リストに追加する
	public boolean setWriting(UserDTO user, String writing) {
		//		Connection conn = null;
		//		PreparedStatement pstmt = null;
		// INSERT文の登録と実行
		String sql = "INSERT INTO shouts(userName, icon, date, writing) VALUES(?, ?, ?, ?)";
		boolean result = false;
		try (
				Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getIcon());
			// 現在日時の取得と日付の書式指定
			Calendar calender = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			pstmt.setString(3, sdf.format(calender.getTime()));
			pstmt.setString(4, writing);

			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				// INSERT文の実行結果が1なら登録成功
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return result;
	}

	// 登録用IDを受け取り、登録済ユーザ一覧に一致したものがあるか検索
	public boolean getTourokuUser(String tourokuId) {

		//プレースホルダーしておく
		String sql = "SELECT * FROM users WHERE loginId=?";

		//try-with-resourcesで自動クローズ
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, tourokuId);

			// ResultSetも自動クローズにする
			try (ResultSet rset = pstmt.executeQuery()) {
				// 検索結果があるかどうか
				if (rset.next()) {
					return true; //サーブレットに返す
				}
			}

		} catch (SQLException e) {
			//SQLやDBが壊れているとき用
			e.printStackTrace();
		}
		return false; //ユーザーが見つからない場合かエラーが起きた時
	}

	public UserDTO setTouroku(String userName, String loginId, String password, String icon,
			String profile) {
		UserDTO u = new UserDTO();

		u.setUserName(userName);
		u.setLoginId(loginId);
		u.setPassword(password);
		u.setIcon(icon);
		u.setProfile(profile);
		return u;
	}

}