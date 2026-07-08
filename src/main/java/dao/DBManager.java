package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import dto.ShoutDTO;
import dto.UserDTO;

public class DBManager extends SnsDAO {

	//Userテーブルの表示
	public UserDTO getLoginUser(String loginId, String password) {

		String sql = "SELECT * FROM users WHERE loginId=? AND password=?";
		UserDTO user = null;

		try (Connection conn = getConnection()) {

			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				pstmt.setString(1, loginId);
				pstmt.setString(2, password);

				try (ResultSet rset = pstmt.executeQuery()) {

					if (rset.next()) {
						user = new UserDTO();
						user.setLoginId(rset.getString(2));
						user.setPassword(rset.getString(3));
						user.setUserName(rset.getString(4));
						user.setIcon(rset.getString(5));
						user.setProfile(rset.getString(6));
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	// 書き込み内容リストの getter
	public ArrayList<ShoutDTO> getShoutList() {

		ArrayList<ShoutDTO> list = new ArrayList<ShoutDTO>();

		try (Connection conn = getConnection()) {
			try (Statement pstmt = conn.createStatement()) {
				String sql = "SELECT * FROM shouts ORDER BY date DESC";

				try (ResultSet rset = pstmt.executeQuery(sql);) {

					// 検索結果の数だけ繰り返す
					while (rset.next()) {
						// 必要な列から値を取り出し、書き込み内容オブジェクトを生成
						ShoutDTO shout = new ShoutDTO();
						shout.setUserName(rset.getString(2));
						shout.setIcon(rset.getString(3));
						shout.setDate(rset.getString(4));
						shout.setWriting(rset.getString(5));

						// 書き込み内容をリストに追加
						list.add(shout);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean setWriting(UserDTO user, String writing) {

		boolean result = false;
		try (Connection conn = getConnection()) {
			String sql = "INSERT INTO shouts(userName, icon, date, writing)VALUES(?, ?, ?, ?)";

			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				pstmt.setString(1, user.getUserName());
				pstmt.setString(2, user.getIcon());
				// 現在日時の取得と日付の書式指定
				Calendar calender = Calendar.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				pstmt.setString(3, sdf.format(calender.getTime()));
				pstmt.setString(4, writing);

				int cnt = pstmt.executeUpdate();

				if (cnt == 1) {
					// INSERT文の実行結果が1なら登録成功
					result = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	//ShoutsテーブルのshoutsIdをアレイリストにいれる
	public ArrayList<Integer> countId() {//ArrayListの中身にintを入れたいときはinteger型にする

		String sql = "SELECT * FROM shouts ";//全検索SQL文
		ArrayList<Integer> count = new ArrayList<Integer>();

		try (Connection conn = getConnection()) {

			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				try (ResultSet rset = pstmt.executeQuery()) {

					while (rset.next()) {

						count.add(rset.getInt("shoutsId"));

					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;//リストを返す

	}

	public ShoutDTO getShoutsUser(int shoutsId) {

		String sql = "SELECT * FROM shouts WHERE shoutsId=?";
		ShoutDTO shout = null;

		try (Connection conn = getConnection()) {

			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				pstmt.setInt(1, shoutsId);

				try (ResultSet rset = pstmt.executeQuery()) {

					if (rset.next()) {

						shout = new ShoutDTO();
						shout.setShoutsId(rset.getInt(1));
						shout.setUserName(rset.getString(2));
						shout.setIcon(rset.getString(3));
						shout.setDate(rset.getString(4));
						shout.setWriting(rset.getString(5));
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return shout;

	}
}
