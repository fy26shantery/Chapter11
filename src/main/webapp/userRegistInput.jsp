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
	<form action="./uic" method="post">
		<table style="width: 500px" class="table container padding-y-5">
			
			<tr>
				<%-- ログインID入力欄の名前はloginId --%>
				<td class="color-main text-left icon-ball">ログインID</td>
				<td class="text-left"><input class="form-control" type="text"
				name="loginId" value="${loginId}" size="20" autofocus /></td>
			</tr>
			<tr>
				<%-- ユーザ名入力欄の名前はuserName --%>
				<td class="color-main text-left icon-coffee">ユーザー名</td>
				<td class="text-left"><input class="form-control" type="text"
				name="userName" value="${userName}" size="20" /></td>
			</tr>
			<tr>
				<%-- パスワード入力欄の名前はpassword --%>
				<td class="color-main text-left icon-home">パスワード</td>
				<td class="text-left"><input class="form-control"
				type="text" name="password" value="${password}" size="20" /></td>
			</tr>
			
			
			
			<tr>
				<%-- アイコン入力欄の名前はicon --%>
				<td class="color-main text-left icon-piggy">アイコン</td>
			
				<td><label><input type="radio" name="icon" value="icon-user" <c:if test="${empty icon || icon eq 'icon-user'}">checked</c:if>><span class="icon-user pe-3x pe-va"></span></label></td>
				<td><label><input type="radio" name="icon" value="icon-user-female"  <c:if test="${icon eq 'icon-user-female'}">checked</c:if>><span class="icon-user-female pe-3x pe-va"</span></label></td>
			</tr>
			<tr>
				<%-- プロフィール入力欄の名前はprofile --%>
				<td class="color-main text-left icon-paperclip">プロフィール</td>
				<td class="text-left"><input class="form-control" type="text"
				name="profile" value="${profile}" size="20" /></td>
			</tr>
		
			<tr>
				<td colspan="2" class="text-right"><input class="btn" type="submit" name="action" value="登録" /></td>
			</form>
			<form action="./uii" method="post">
				<td colspan="2" class="text-right"><input class="btn" type="submit" name="action" value="戻る" /></td>	
			</tr>
			<%-- リクエストスコープにalertIdがあれば --%>
			<c:if test="${requestScope.alert != null && requestScope.alert != ''}">
				<tr>
					<%-- リクエストスコープの alert の値を出力 --%>
					<td colspan="2" class="color-error text-left"><c:out value="${requestScope.alert}" /></td>
				</tr>
			</c:if>
			<%-- リクエストスコープにalertIdがあれば --%>
			<c:if test="${requestScope.alertId != null && requestScope.alertId != ''}">
				<tr>
					<%-- リクエストスコープの alert の値を出力 --%>
					<td colspan="2" class="color-error text-left"><c:out value="${requestScope.alertId}" /></td>
				</tr>
			</c:if>
			<%-- リクエストスコープにalertNameがあれば --%>
			<c:if test="${requestScope.alertName != null && requestScope.alertName != ''}">
				<tr>
					<%-- リクエストスコープの alert の値を出力 --%>
					<td colspan="2" class="color-error text-left"><c:out value="${requestScope.alertName}" /></td>
				</tr>
			</c:if>
			<%-- リクエストスコープにalertPassがあれば --%>
			<c:if test="${requestScope.alertPass != null && requestScope.alertPass != ''}">
				<tr>
					<%-- リクエストスコープの alert の値を出力 --%>
					<td colspan="2" class="color-error text-left"><c:out value="${requestScope.alertPass}" /></td>
				</tr>
			</c:if>
			<c:if test="${requestScope.alertPro != null && requestScope.alertPro != ''}">
				<tr>
					<%-- リクエストスコープの alertIcon の値を出力 --%>
					<td colspan="2" class="color-error text-left"><c:out value="${requestScope.alertPro}" /></td>
				</tr>
			</c:if>
			<c:if test="${requestScope.alertIcon != null && requestScope.alertIcon != ''}">
				<tr>
					<%-- リクエストスコープの alert の値を出力 --%>
					<td colspan="2" class="color-error text-left"><c:out value="${requestScope.alertIcon}" /></td>
				</tr>
			</c:if>
	</form>
</body>
</html>