<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録画面</title>
	<link rel="stylesheet" href="./css/skyblue.css">
	<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
	<link rel="stylesheet" href="./css/helper.css">
</head>
<body>
<div class="bg-success padding-y-5">
		<div class="padding-y-5 text-center">
			<strong>ユーザー登録確認画面</strong>
			<p class="text-center">登録します。よろしいでしょうか？</p>
		</div>
</div>
<%-- action 属性にサーブレットを指定 --%>
<div class="padding-y-5">
<div style="width: 40%" class="container padding-y-5">
<form action="./uic" method="post">
	<table style="width: 600px; margin: 0 auto;" class="table">
		<tr>
			<%-- ログインID確認 --%>
			<td class="color-main text-left">
			<span class="icon-id pe-2x pe-va"></span>ログインID</td>
			<td>${newUser.loginId}</td>
			<input type="hidden" name="loginId" value="${newUser.loginId}">
		</tr>
		<tr>
			<%-- ユーザー名確認 --%>
			<td class="color-main text-left">
			<span class="icon-user pe-2x pe-va"></span>ユーザー名</td>
			<td>${newUser.userName}</td>
			<input type="hidden" name="userName" value="${newUser.userName}">
			
		</tr>

		<tr>
			<%-- パスワード確認 --%>
			<td class="color-main text-left">
			<span class="icon-key pe-2x pe-va"></span>パスワード</td>
			<td>${nsewUser.password}</td>
			<input type="hidden" name="password" value="${newUser.password}">
			
		</tr>
		
		<tr>
		<%-- icon確認 --%>
		<td class="color-main text-left">
		<span class="icon-rocket pe-2x pe-va"></span>アイコン</td>
		<c:if test="${newUser.icon == 'male'}">
			<span class="icon-box">
				<i class="icon-user pe-2x pe-va"></i>
			</span>
		</c:if>
		<c:if test="${newUser.icon == 'female'}">
			<span class="icon-box">
				<i class="icon-user-female pe-2x pe-va"></i>
			</span>
		</c:if>
		
		<tr>
			<%-- プロフィール確認 --%>
			<td class="color-main text-left">
			<span class="icon-rocket pe-2x pe-va"></span>プロフィール</td>
			<td>${newUser.profile}</td>
			<input type="hidden" name="profile" value="${newUser.profile}">
			
		</tr>
	</table>
	<table style="width: 400px; margin: 0 auto;" class="table">
		<tr>
		<tr>
			<td colspan="2" class="text-right"><input class="btn"
			type="submit" value="OK" /></td>
</form>	
<form action="userRegistInput.jsp" method="post">
			<td colspan="2" class="text-left"><input class="btn"
			type="submit" value="キャンセル" /></td>
</form>
		</tr>
	</table>
</div>
</div>
</body>
</html>