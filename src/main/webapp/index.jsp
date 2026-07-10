<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
	<link rel="stylesheet" href="./css/skyblue.css">
	<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
	<link rel="stylesheet" href="./css/helper.css">
</head>
<body>
<div class="bg-success padding-y-5">
		<div class="padding-y-5 text-center">
			<strong>ログイン画面</strong>
		</div>
</div>
<%-- action 属性にサーブレットを指定 --%>
<div class="padding-y-5">
<div style="width: 40%" class="container padding-y-5">

<p class="text-center">ログインIDとパスワードを入力してください</p>
<table style="width: 400px; margin: 0 auto;" class="table">
	<form action="./login" method="post">
		<tr>
			<%-- ログインID入力欄の名前はloginId --%>
			<td class="color-main text-left">ログインID</td>
			<td class="text-left"><input class="form-control" type="text"
			 name="loginId" autofocus value="" size="20" /></td>
		</tr>

		<tr>
			<%-- パスワード入力欄の名前はpassword --%>
			<td class="color-main text-left">パスワード</td>
			<td class="text-left"><input class="form-control" type="password"
			 name="password" value="" size="20" /></td>
		</tr>
</table>
<table style="width: 400px; margin: 0 auto;" class="table">
		<tr>
			<td colspan="2"><input class="btn"
			type="submit" value="ログイン" /></td>
		</form>	
		<form action="userRegistInput.jsp" method="post">
			<td colspan="2"><input class="btn"
			type="submit" value="新規登録" /></td>
		</form>
		</tr>
</table>
		<%-- リクエストスコープにalertがあれば --%>
		<c:if test="${requestScope.alert1 != null && requestScope.alert1 != '' }">
			<tr>
				<%-- リクエストスコープにalertの値を出力  --%>
				<td colspan="2" class="color-error text-left"><c:out
				value="${requestScope.alert1}" /></td>
			</tr>
		</c:if>
		<c:if test="${requestScope.alert2 != null && requestScope.alert2 != '' }">		
			<tr>
				<%-- リクエストスコープにalertの値を出力 --%>
				<td colspan="2" class="color-error text-left"><c:out
				value="${requestScope.alert2}" /></td>
			</tr>
		</c:if>
</table>
</div>
</div>
</body>
</html>