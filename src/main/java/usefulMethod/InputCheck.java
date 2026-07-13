package usefulMethod;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InputCheck {

	//文字列が入力されているかをチェックするメソッド
	public boolean checkFilled(String object) {
		if (!(object == null || object.isBlank())) {
			return true;
		} else {
			return false;
		}
	}

	//半角英数字のみをtrue
	public String checkOnlyEngNum(String object) {
		if (!(object == null || object.isBlank())) {
			Pattern pattern = Pattern.compile("^[0-9a-zA-Z]*$");//半角英数字を検知する正規表現
			Matcher matcher = pattern.matcher(object);

			if (matcher.find()) {
				//正規表現で半角英数字のみだったとき
				return "OK";
			} else { //半角英数字以外が混入していたとき
				return "NG";
			}
		} else { //引数の文字列が空のとき
			return "EMPTY";
		}

	}

}
