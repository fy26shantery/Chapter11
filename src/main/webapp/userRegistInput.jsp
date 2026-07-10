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
			<strong>新規登録</strong>
		</div>
</div>
<%-- action 属性にサーブレットを指定 --%>
<div class="padding-y-5">
<div style="width: 40%" class="container padding-y-5">
<form action="./uii" method="post">
<p class="text-center">それぞれの項目を入力してください（プロフィールは自由です）</p>
	<table style="width: 600px; margin: 0 auto;" class="table">
		<tr>
			<%-- ログインID入力欄の名前はloginId --%>
			<td class="color-main text-left">
			<span class="icon-id pe-2x pe-va"></span>ログインID</td>
			<td class="text-left"><input class="form-control" type="text"
			 name="loginId" autofocus value="" size="20" /></td>
		</tr>
		<tr>
			<%-- ユーザー名入力欄の名前はuserName --%>
			<td class="color-main text-left">
			<span class="icon-user pe-2x pe-va"></span>ユーザー名</td>
			<td class="text-left"><input class="form-control" type="text"
			 name="userName" autofocus value="" size="20" /></td>
		</tr>

		<tr>
			<%-- パスワード入力欄の名前はpassword --%>
			<td class="color-main text-left">
			<span class="icon-key pe-2x pe-va"></span>パスワード</td>
			<td class="text-left"><input class="form-control" type="text"
			 name="password" value="" size="20" /></td>
		</tr>
		
		<tr>
		<td class="color-main text-left">
		<span class="icon-rocket pe-2x pe-va"></span>アイコン</td>
		<td class="text-left">
			<label class="fancy-radio">
				<input type="radio" name="icon" value="icon-user">
				<span class="icon-box">
				<i class="icon-user pe-2x pe-va"></i></span>
			</label>
		</td>
		<td class="text-right">
			<label class="fancy-radio">
			<label class="fancy-radio">
				<input type="radio" name="icon" value="icon-user-female">
				<span class="icon-box">
				<i class="icon-user-female pe-2x pe-va"></i></span>
			</label>
		</td>
		</tr>
		
		<tr>
			<%-- プロフィール入力欄の名前はprofile --%>
			<td class="color-main text-left">
			<span class="icon-rocket pe-2x pe-va"></span>プロフィール</td>
			<td class="text-left"><input class="form-control" type="text"
			 name="profile" value="" size="20" /></td>
		</tr>
	</table>
	<table style="width: 400px; margin: 0 auto;" class="table">
		<tr>
			<td colspan="2" class="text-right"><input class="btn"
			type="submit" value="登録" /></td>
</form>	
<form action="index.jsp" method="post">
			<td colspan="2" class="text-left"><input class="btn"
			type="submit" value="戻る" /></td>
</form>
		</tr>
	</table>
	<table>
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
		<c:if test="${requestScope.alert3 != null && requestScope.alert3 != '' }">
			<tr>
				<%-- リクエストスコープにalertの値を出力  --%>
				<td colspan="2" class="color-error text-left"><c:out
				value="${requestScope.alert3}" /></td>
			</tr>
		</c:if>
		<c:if test="${requestScope.alert4 != null && requestScope.alert4 != '' }">
			<tr>
				<%-- リクエストスコープにalertの値を出力  --%>
				<td colspan="2" class="color-error text-left"><c:out
				value="${requestScope.alert4}" /></td>
			</tr>
		</c:if>
		<c:if test="${requestScope.alert4 != null && requestScope.alert4 != '' }">
			<tr>
				<%-- リクエストスコープにalertの値を出力  --%>
				<td colspan="2" class="color-error text-left"><c:out
				value="${requestScope.alert4}" /></td>
			</tr>
		</c:if>
		<c:if test="${requestScope.alert5 != null && requestScope.alert5 != '' }">
			<tr>
				<%-- リクエストスコープにalertの値を出力  --%>
				<td colspan="2" class="color-error text-left"><c:out
				value="${requestScope.alert5}" /></td>
			</tr>
		</c:if>
		<c:if test="${requestScope.alert6 != null && requestScope.alert6 != '' }">
			<tr>
				<%-- リクエストスコープにalertの値を出力  --%>
				<td colspan="2" class="color-error text-left"><c:out
				value="${requestScope.alert6}" /></td>
			</tr>
		</c:if>
		<c:if test="${requestScope.alert7 != null && requestScope.alert7 != '' }">
			<tr>
				<%-- リクエストスコープにalertの値を出力  --%>
				<td colspan="2" class="color-error text-left"><c:out
				value="${requestScope.alert8}" /></td>
			</tr>
		</c:if>
		<c:if test="${requestScope.alert8 != null && requestScope.alert8 != '' }">
			<tr>
				<%-- リクエストスコープにalertの値を出力  --%>
				<td colspan="2" class="color-error text-left"><c:out
				value="${requestScope.alert8}" /></td>
			</tr>
		</c:if>
		</table>

</div>
</div>
</body>
</html>