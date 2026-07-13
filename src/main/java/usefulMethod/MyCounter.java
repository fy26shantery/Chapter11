package usefulMethod;

public class MyCounter {

	//最大桁数を設定し、入力文字数が設定桁以内かを判定するメソッド
	public String maxCounter(int maxLength, int currentLength) {
		String result = "false";
		if (maxLength >= currentLength) {
			result = "OK";
		} else { //入力が規定以上の時
			result = maxLength + "字以内で入力してください";
		}
		return result;
	}

	//最大桁数、最小桁数を設定し、入力文字数が設定桁以内かを判定するメソッド
	public String maxAndMinCounter(int maxLength, int minLength, int currentLength) {
		String result = "false";
		if ((maxLength >= currentLength) && (currentLength >= minLength)) {
			result = "OK";
		} else if (maxLength <= currentLength) { //入力が規定以上の時
			result = maxLength + "字以内で入力してください";
		} else { //入力が規定未満の時
			result = minLength + "字以上で入力してください";
		}
		return result;
	}

}
