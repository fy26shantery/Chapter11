<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,java.util.Date" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/skyblue.css">
<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="css/helper.css">
</head>
<body>
	<h2 class="bg-success padding-y-5 text-center">ユーザ登録入力画面<br>ユーザ登録をします。内容を入力してください</h2>
	<%-- action 属性にサーブレットを指定 --%>
	
		<table style="width: 400px" class="table container padding-y-5">
			
			<tr>
				<%-- ログインID入力欄の名前はloginId --%>
				<th><span class="icon-magic-wand pe-2x pe-va"></span>&nbsp;ログインID</th>
				<td clospan="3">${loginId}</td>
			</tr>
			<tr>
				<%-- ユーザ名入力欄の名前はuserName --%>
				<th><span class="icon-magic-wand pe-2x pe-va"></span>&nbsp;ユーザ名</th>
				<td clospan="3">${userName}</td>
			</tr>
			<tr>
				<%-- パスワード入力欄の名前はpassword --%>
				<th><span class="icon-magic-wand pe-2x pe-va"></span>&nbsp;パスワード</th>
				<td clospan="3">${password}</td>
			</tr>
			<tr>
				<%-- アイコン入力欄の名前はicon --%>
				<th><span class="icon-magic-wand pe-2x pe-va"></span>&nbsp;アイコン</th>
				<c:if test="${icon == 'icon-user'}">
					<%-- リクエストスコープの alert の値を出力 --%>
					<td colspan="2""><span class="icon-user pe-3x pe-va"</span></td>
				</c:if>
				<c:if test="${icon == 'icon-user-female'}">
					<%-- リクエストスコープの alert の値を出力 --%>
					<td colspan="2""><span class="icon-user-female pe-3x pe-va"</span></td>
				</c:if>
			</tr>
				
			<tr>
				<%-- プロフィール入力欄の名前はprofile --%>
				<th><span class="icon-magic-wand pe-2x pe-va"></span>&nbsp;プロフィール</th>
				<td clospan="3">${profile}</td>
			</tr>
			
			<tr>
				<form action="./uir" method="post">
					<td colspan="2" class="text-right"><input class="btn" type="submit" name="action" value="OK" /></td>
				</form>
				<form action="./uii" method="post">
					<input type="hidden" name="loginId" id="loginId" value="${loginId}">
					<input type="hidden" name="userName" value="${userName}">
					<input type="hidden" name="password" value="${password}">
					<input type="hidden" name="icon" value="${icon}">
					<input type="hidden" name="profile" value="${profile}">
					<td colspan="2" class="text-right"><input class="btn" type="submit" name="action" value="キャンセル" /></td>
				</form>
			</tr>
	</form>
</body>
</html>