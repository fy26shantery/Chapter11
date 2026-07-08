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
	// ログインIDとパスワードを受け取り、登録ユーザー一覧に一致したものがあるか検索
	public UserDTO getLoginUser(String loginId, String password) {
		//	Connection conn = null; // データベース接続情報
		//	PreparedStatement pstmt = null; // SQL 管理情報
		//	ResultSet rset = null; // 検索結果

		String sql = "SELECT * FROM users WHERE loginId=? AND password=?";
		UserDTO user = null; // 登録ユーザー情報

		try (Connection conn = getConnection();) {// データベース接続情報取得
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) { // SELECT 構文登録)
				// SELECT 文の登録と実行
				pstmt.setString(1, loginId);
				pstmt.setString(2, password);

				try (ResultSet rset = pstmt.executeQuery()) {

					// 検索結果があれば
					if (rset.next()) {
						// 必要な列から値を取り出し、ユーザー情報オブジェクトを生成
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
	public ArrayList<ShoutDTO> getShoutList() {//shoutsの表すべてを取得したい
		ArrayList<ShoutDTO> list = new ArrayList<ShoutDTO>();//リスト作成
		String sql = "SELECT * FROM shouts ORDER BY date DESC";
		try (Connection conn = getConnection()) {//DTOの継承をしているから
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				try (ResultSet rset = pstmt.executeQuery()) {

					while (rset.next()) {
						ShoutDTO shout = new ShoutDTO();//名前ミスdto です、見つかるたびにnewしないと毎回、上書き保存しちゃう
						shout.setShoutsId(rset.getInt("shoutsId"));
						shout.setUserName(rset.getString("userName"));
						shout.setIcon(rset.getString("icon"));
						shout.setDate(rset.getDate("date"));
						shout.setWriting(rset.getString("writing"));

						list.add(shout);
					}
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;//詰めたリストそのままを返してあげる.何も入っていない場合
	}

	// ログインユーザー情報と書き込み内容を受け取り、リストに追加する
	public boolean setWriting(UserDTO user, String writing) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		boolean result = false;
		try {
			conn = getConnection();

			// INSERT文の登録と実行
			String sql = "INSERT INTO shouts(userName, icon, date, writing)VALUES(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断処理
			close(pstmt);
			close(conn);
		}

		return result;
	}
}
