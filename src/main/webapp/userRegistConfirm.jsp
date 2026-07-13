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
		</tr>
		<tr>
			<%-- ユーザー名確認 --%>
			<td class="color-main text-left">
			<span class="icon-user pe-2x pe-va"></span>ユーザー名</td>
			<td>${newUser.userName}</td>
			
		</tr>

		<tr>
			<%-- パスワード確認 --%>
			<td class="color-main text-left">
			<span class="icon-key pe-2x pe-va"></span>パスワード</td>
			<td>${newUser.password}</td>
			
		</tr>
		
		<tr>
		<%-- icon確認 --%>
		<td class="color-main text-left">
			<span class="icon-rocket pe-2x pe-va"></span>アイコン
		</td>
		<td class="text-left">
			<c:if test="${newUser.icon == 'icon-user'}">
				<span class="icon-box">
					<i class="icon-user pe-2x pe-va"></i>
				</span>
			</c:if>
			<c:if test="${newUser.icon == 'icon-user-female'}">
				<span class="icon-box">
					<i class="icon-user-female pe-2x pe-va"></i>
				</span>
			</c:if>
		</td>
		</tr>
		
		<tr>
			<%-- プロフィール確認 --%>
			<td class="color-main text-left">
			<span class="icon-rocket pe-2x pe-va"></span>プロフィール</td>
			<td>${newUser.profile}</td>
			
		</tr>
	</table>
	<table style="width: 400px; margin: 0 auto;" class="table">
		<tr>
		<tr>
			<td colspan="2" class="text-right"><input class="btn"
			type="submit" value="OK" /></td>
 
			<td colspan="2" class="text-left"><input class="btn"
			type="submit" value="キャンセル" formaction="./uii" formmethod="get" /></td>
</form>
		</tr>
		
	<input type="hidden" name="loginId" value="${newUser.loginId}">
	<input type="hidden" name="userName" value="${newUser.userName}">
	<input type="hidden" name="password" value="${newUser.password}">
	<input type="hidden" name="icon" value="${newUser.icon}">
	<input type="hidden" name="profile" value="${newUser.profile}">
	
	</table>
</div>
</div>
</body>
</html>