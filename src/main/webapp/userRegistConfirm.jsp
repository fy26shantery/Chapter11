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
<title>登録内容確認</title>
</head>
<body>
	<h2 class="bg-success padding-y-5 text-center">
		ユーザー登録確認画面<br>登録します。よろしいでしょうか？</br>
	</h2>
	<form action="./uir" method="post">

		<table style="width: 500px" class="table" border="1">

			<!--		入力内容を確認するための表示項目-->
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
			</form>
			<tr>
				<td colspan="2" class="text-center">

					<form action="./uii" method="post">
						<input type="hidden" name="loginId" value="${registUser.loginId}" />
						<input type="hidden" name="userName"
							value="${registUser.userName}" /> <input type="hidden"
							name="password" value="${registUser.password}" /> <input
							type="hidden" name="icon" value="${registUser.icon}" /> <input
							type="hidden" name="profile" value="${registUser.profile}" /> <input
							class="btn" type="submit" value="キャンセル" />
					</form>
					<form action="./uir" method="post">
						<input type="hidden" name="loginId" value="${registUser.loginId}" />
						<input type="hidden" name="userName"
							value="${registUser.userName}" /> <input type="hidden"
							name="password" value="${registUser.password}" /> <input
							type="hidden" name="icon" value="${registUser.icon}" /> <input
							type="hidden" name="profile" value="${registUser.profile}" /> <input
							class="btn" type="submit" value="登録する" />
					</form>
				</td>
			</tr>
		</table>
</body>
</html>