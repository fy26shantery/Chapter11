<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/skyblue.css">
<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="./css/helper.css">


<h2 class="bg-success padding-y-5 text-center">
	ユーザー登録結果画面<br>以下の内容で登録が完了しました。</br>
</h2>
</head>
<body>

	<h2>新規登録が完了しました</h2>
	<table style="width: 400px" class="table" border="1">
		<tr>
			<td class="color-main text-left">ログインID</td>
			<td class="text-left"><c:out value="${registUser.loginId}" /></td>
		</tr>
		<tr>
			<td class="color-main text-left">ユーザー名</td>
			<td class="text-left"><c:out value="${registUser.userName}" /></td>
		</tr>
		<tr>
			<td class="color-main text-left">パスワード</td>
			<td class="text-left">********</td>
		</tr>
		<tr>
			<td class="color-main text-left">アイコン</td>
			<td class="text-left"><span
				class="${registUser.icon} pe-2x pe-va"></span></td>
		</tr>
		<tr>
			<td class="color-main text-left">プロフィール</td>
			<td class="text-left"><c:out value="${registUser.profile}" /></td>
		</tr>
		</table>
		
<!--		登録完了後にログイン画面に戻るボタン-->
		<br>
		<form action="./login" method="get">

<!--戻るボタンが押されたことを入力画面のサーブレットに教えるためにhidden-->
			<input type="hidden" name="action" value="back" /> <input
				class="btn" type="submit" value="ログイン画面に戻る" />
		</form>
</body>
</html>