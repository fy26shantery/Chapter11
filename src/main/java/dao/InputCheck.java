package dao;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InputCheck {
	//半角英数字のみをtrue
	public boolean checkOnlyEngNum(String object) {
		Pattern pattern = Pattern.compile("([^-~｡-ﾟ]+)|([^0-9a-zA-Z]+)");//半角英数字以外を検知する正規表現
		Matcher matcher = pattern.matcher(object);

		if (matcher.find()) {
			//正規表現で除外対象を見つけたとき
			return true;
		} else {
			return false;
		}

	}

}
