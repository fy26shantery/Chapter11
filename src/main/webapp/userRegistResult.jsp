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
<form action="./uir" method="post">
	<table style="width: 600px; margin: 0 auto;" class="table">
	
		<tr>
			<%-- ログインID入力欄の名前はloginId --%>
			<td class="color-main text-left">
			<span class="icon-id pe-2x pe-va"></span>ログインID</td>
			<td>${finalUser.loginId}</td>
		</tr>
		
		<tr>
			<%-- ユーザー名入力欄の名前はuserName --%>
			<td class="color-main text-left">
			<span class="icon-user pe-2x pe-va"></span>ユーザー名</td>
			<td>${finalUser.userName}</td>
			
		</tr>

		<tr>
			<%-- パスワード入力欄の名前はpassword --%>
			<td class="color-main text-left">
			<span class="icon-key pe-2x pe-va"></span>パスワード</td>
			<td>${finalUser.password}</td>
			
		</tr>
		
		<tr>
			<%-- icon確認 --%>
			<td class="color-main text-left">
			<span class="icon-rocket pe-2x pe-va"></span>アイコン</td>
			<td class="text-left">
				<c:if test="${finalUser.icon == 'icon-user'}">
					<span class="icon-box">
						<i class="icon-user pe-2x pe-va"></i>
					</span>
				</c:if>
				<c:if test="${finalUser.icon == 'icon-user-female'}">
					<span class="icon-box">
						<i class="icon-user-female pe-2x pe-va"></i>
					</span>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<%-- プロフィール入力欄の名前はprofile --%>
			<td class="color-main text-left">
			<span class="icon-rocket pe-2x pe-va"></span>プロフィール</td>
			<td>${finalUser.profile}</td>
		</tr>
		
		<tr>
			<%-- 「戻る」ボタン --%>
			<td colspan="2" class="text-right"><input class="btn"
			type="submit" value="戻る" /></td>
		</tr>
	</table>
</form>	
</div>
</div>
</body>
</html>