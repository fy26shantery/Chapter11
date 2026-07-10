<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録結果画面</title>
	<link rel="stylesheet" href="./css/skyblue.css">
	<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
	<link rel="stylesheet" href="./css/helper.css">
</head>
<body>
<div class="bg-success padding-y-5">
		<div class="padding-y-5 text-center">
			<strong>ユーザー登録結果画面</strong>
			<p class="text-center">以下の内容で登録が完了しました。</p>
		</div>
</div>
<%-- action 属性にサーブレットを指定 --%>
<div class="padding-y-5">
<div style="width: 40%" class="container padding-y-5">
<form action="./uic" method="post">
	<table style="width: 600px; margin: 0 auto;" class="table">
		<tr>
			<%-- ログインID入力欄の名前はloginId --%>
			<td class="color-main text-left">
			<span class="icon-id pe-2x pe-va"></span>ログインID</td>
			<td>${newUser.loginId}</td>
			<input type="hidden" name="loginId" value="${newUser.loginId}">
		</tr>
		<tr>
			<%-- ユーザー名入力欄の名前はuserName --%>
			<td class="color-main text-left">
			<span class="icon-user pe-2x pe-va"></span>ユーザー名</td>
			<td>${newUser.userName}</td>
			<input type="hidden" name="userName" value="${newUser.userName}">
			
		</tr>

		<tr>
			<%-- パスワード入力欄の名前はpassword --%>
			<td class="color-main text-left">
			<span class="icon-key pe-2x pe-va"></span>パスワード</td>
			<td>${nsewUser.password}</td>
			<input type="hidden" name="password" value="${newUser.password}">
			
		</tr>
		
		<tr>
		<td class="color-main text-left">
		<span class="icon-rocket pe-2x pe-va"></span>アイコン</td>
		<td class="text-left">
			<label class="fancy-radio">
				<input type="radio" name="icon" value="male"checked>
				<span class="icon-box">
				<i class="icon-user pe-2x pe-va"></i></span>
			</label>
		</td>
		<td class="text-rigth">
			<label class="fancy-radio">
			<label class="fancy-radio">
				<input type="radio" name="icon" value="female">
				<span class="icon-box">
				<i class="icon-user-female pe-2x pe-va"></i></span>
			</label>
		</td>
		</tr>
		
		<tr>
			<%-- プロフィール入力欄の名前はprofile --%>
			<td class="color-main text-left">
			<span class="icon-rocket pe-2x pe-va"></span>プロフィール</td>
			<td>${newUser.profile}</td>
			<input type="hidden" name="profile" value="${newUser.profile}">
			
		</tr>
		<tr>
			<td colspan="2" class="text-right"><input class="btn"
			type="submit" value="戻る" /></td>
		</tr>
	</table>

</form>	

</div>
</div>
</body>
</html>