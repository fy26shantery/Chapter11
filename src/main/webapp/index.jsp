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
	<h2 class="bg-success padding-y-5 text-center"><strong>Shouter <span class=icon-speaker></i></span></h2>
	<%-- action 属性にサーブレットを指定 --%>
	<form action="./login" method="post">
		<table style="width: 400px" class="table container padding-y-5">
			<tr>
				<td colspan="2" class="text-left"><strong>ログインIDとパスワードを入力してください</strong></td>
			</tr>
			<tr>
				<%-- ログインID入力欄の名前はloginId --%>
				<td class="color-main text-left">ログインID</td>
				<td class="text-left"><input class="form-control" type="text"
				name="loginId" value="" size="20" autofocus /></td>
			</tr>
			
			<tr>
				<%-- パスワード入力欄の名前はpassword --%>
				<td class="color-main text-left">パスワード</td>
				<td class="text-left"><input class="form-control"
				type="password" name="password" value="" size="20" /></td>
			</tr>
		
			<tr>
				<td colspan="2" class="text-right"><input class="btn" type="submit" value="ログイン" /></td>
	</form>
	<form action="./uii" method="post">
		<td colspan="2" class="text-right"><input class="btn" type="submit" name="action" value="新規登録" /></td>	
	</form>
				
			</tr>
			<%-- リクエストスコープにalertがあれば --%>
			<c:if test="${requestScope.alert != null && requestScope.alert != ''}">
				<tr>
					<%-- リクエストスコープの alert の値を出力 --%>
					<td colspan="2" class="color-error text-left"><c:out value="${requestScope.alert}" /></td>
				</tr>
			</c:if>
			<c:if test="${requestScope.alert2 != null && requestScope.alert2 != ''}">
				<tr>
					<%-- リクエストスコープの alert2 の値を出力 --%>
					<%-- 片方だけ未入力の場合 --%>
					<td colspan="2" class="color-error text-left"><c:out value="${requestScope.alert2}" /></td>
				</tr>
			</c:if>
		</table>
	</form>
	
</body>
</html>