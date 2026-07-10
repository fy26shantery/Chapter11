<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/skyblue.css">
<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="./css/helper.css">
<link rel="stylesheet" href="./css/.css">
</head>
<body>

<div class="bg-success padding-y-5">
	<div class="sm-padding-y-20 text-center">
	
		<h1><strong>Shouter</strong>
			<span class="icon-speaker pe-1x pe-va"></span>
		</h1>
	</div>
</div>

<%-- 属性にサーブレットを指定 --%>
<form action="./login" method="post">
	<h5 class="text-center my-4"><strong>ログインIDとパスワードを入力してください</strong></h5>
	<table class="table" style="max-width: 600px; margin: 0 auto;">
	
	<tr>
		<%-- ログインID入力欄の名前はloginId --%>
		<td class="color-main text-center">ログインID</td>
		<td class="text-center"><input class="form-control" type="text" name="loginId" value="" size="20" autofocus /></td>
	</tr>
	
	<tr>
		<%-- パスワード入力欄の名前はpassword --%>
		<td class="color-main text-center">パスワード</td>
		<td class="text-center"><input class="form-control" type="password" name="password" value="" size="20" /></td>
	</tr>
	<tr>
		<%-- ログインボタン --%>
		<td colspan="2" class="text-center"><input class="btn" type="submit" value="ログイン" /></td>
	
		<%-- 新規登録ボタン --%>
	<td colspan="2" class="text-center"><input class="btn" onclick="location.href='userRegistInput.jsp'" value="新規登録"></td>
	</form>
	</tr>
	
	<%-- リクエストスコープにalertがあれば --%>
	<c:if
	test="${requestScope.notInputAlert != null && requestScope.notInputAlert !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left"><c:out
			value="${requestScope.notInputAlert}" /></td>	
			
	</tr>
	</c:if>
	
	<c:if
	test="${requestScope.halfwidthAlert != null && requestScope.halfwidthAlert !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left"><c:out
			value="${requestScope.halfwidthAlert}" /></td>
	</tr>
	</c:if>
	
	
	<c:if
	test="${requestScope.missMatchAlert != null && requestScope.missMatchAlert !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left">
		<c:out value="${requestScope.missMatchAlert}" /></td>
	</tr>
	</c:if>
	
	</table>
</form>
</body>
</html>