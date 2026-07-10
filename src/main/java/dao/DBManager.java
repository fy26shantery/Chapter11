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
	//	public UserDTO getLoginUser(String loginId, String userName, String password) {
	public UserDTO getLoginUser(String loginId, String password) {

		//プレースホルダーしておく
		String sql = "SELECT * FROM users WHERE loginId=? AND password=?";
		UserDTO user = null; // 登録ユーザ情報

		//try-with-resourcesで自動クローズ
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, loginId);
			//pstmt.setString(2, userName);
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
	public ArrayList<ShoutDTO> getAllShouts() {
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
				dto.setDate(rset.getString("date")); //時、分、秒まで図れるgetTimestamp
				dto.setWriting(rset.getString("writing"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean setWriting(UserDTO user, String writing) {

		boolean result = false;
		String sql = "INSERT INTO shouts(userName, icon, date,writing) VALUES(?,?,?,?)";

		try (Connection conn = getConnection()) {

			try (
					PreparedStatement pstmt = conn.prepareStatement(sql)) {

				pstmt.setString(1, user.getUserName());
				pstmt.setString(2, user.getIcon());

				Calendar calendar = Calendar.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				pstmt.setString(3, sdf.format(calendar.getTime()));
				pstmt.setString(4, writing);

				int cnt = pstmt.executeUpdate();
				if (cnt == 1) {
					result = true;
				}
			}

		} catch (

		SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean isOverlap(String loginId) {
		String sql = "SELECT * FROM users WHERE loginId = ?";
		try (java.sql.Connection conn = getConnection();
				java.sql.PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, loginId);
			try (java.sql.ResultSet rset = pstmt.executeQuery()) {
				if (rset.next())
					return true;
			}
		} catch (java.sql.SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public void insertUser(UserDTO user) {
		String sql = "INSERT INTO users (loginId, userName, password, icon, profile) VALUES (?, ?, ?, ?, ?)";
		try (java.sql.Connection conn = getConnection();
				java.sql.PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, user.getLoginId());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getIcon());
			pstmt.setString(5, user.getProfile());

			pstmt.executeUpdate();
		} catch (java.sql.SQLException e) {
			e.printStackTrace();
		}
	}
}