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
	//ログインIDとパスワードを受け取り、登録ユーザ一覧に一致したものがあるか検索
	public UserDTO getLoginUser(String loginId, String password) {

		String sql = "SELECT * FROM users WHERE loginId=? AND PASSWORD=?";
		UserDTO user = null; //登録ユーザ情報

		try (Connection conn = getConnection()) { //データベース接続情報取得

			//SELECT 文の登録と実行
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, loginId);
				pstmt.setString(2, password);

				try (ResultSet rset = pstmt.executeQuery()) {
					if (rset.next()) {
						//必要な列から値を取り出し、ユーザ情報オブジェクトを生成
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

	//userデータをInsertするためのメソッド
	public boolean insertUserData(UserDTO user) {
		boolean result = false; //正常終了かを判定する変数
		try (Connection conn = getConnection()) {
			//引数をデータベースに挿入するSQL文
			String sql = "INSERT INTO users (userId,loginId,password,icon,profile) VALUES(?,?,?,?,?)";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				//データベースにuserデータを挿入
				pstmt.setString(1, user.getLoginId());
				pstmt.setString(2, user.getUserName());
				pstmt.setString(3, user.getPassword());
				pstmt.setString(4, user.getIcon());
				pstmt.setString(5, user.getProfile());

				int log = pstmt.executeUpdate();

				if (log == 1) { //正常終了
					result = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<ShoutDTO> getShoutsList() { //shoutsテーブルからの情報取得メソッド
		ArrayList<ShoutDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM shouts ORDER BY date DESC";

		try (Connection conn = getConnection()) {

			try (PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rset = pstmt.executeQuery()) { //try-with-resouces

				while (rset.next()) { //データがある限り取り出す
					//データベースから取得したshoutsテーブルの情報をArrayListに詰める
					ShoutDTO shout = new ShoutDTO();
					shout.setShoutsId(rset.getInt(1));
					shout.setUserName(rset.getString(2));
					shout.setIcon(rset.getString(3));
					shout.setDate(rset.getString(4));
					shout.setWriting(rset.getString(5));

					//書き込み内容をリストに追加
					list.add(shout);
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	//ログインユーザ情報と書き込み内容を受け取り、リストに追加する
	public boolean setWriting(UserDTO user, String writing) {
		boolean result = false;
		try (Connection conn = getConnection()) {

			//INSERT文の登録と実行
			String sql = "INSERT INTO shouts(userName, icon, date, writing)"
					+ "VALUES(?,?,?,?)";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, user.getUserName());
				pstmt.setString(2, user.getIcon());
				//現在日時の取得と日付の書式設定
				Calendar calender = Calendar.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				pstmt.setString(3, sdf.format(calender.getTime()));
				pstmt.setString(4, writing);

				int cnt = pstmt.executeUpdate();

				if (cnt == 1) {
					//INSERT文の実行結果が1なら登録成功
					result = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
