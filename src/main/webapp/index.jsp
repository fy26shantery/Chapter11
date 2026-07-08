<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>index</title>
<link rel="stylesheet" href="./css/skyblue.css">
<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="./css/helper.css">

<title>Insert title here</title>
</head>
<body>
	<div class="bg-success padding-y-5">
		<div class="padding-y-5 text-center">
			<strong>Shouter</strong>
		</div>
	</div>

	<div class="padding-y-5">
		<div style="width: 40%" class="container padding-y-5">
			<%-- action 属性にサーブレットを指定 --%>
			<form action="./login" method="post">
				<table style="width: 400px; margin:0 auto;" class="table">
					<tr>
						<%-- ログインIDの入力欄の名前はloginId --%>
						<td class="color-main text-left">ログインID</td>
						<td class="text-left"><input class="form-control" type="text"
							name="loginId" value="" size="20" autofocus/></td>
					</tr>
					
					<tr>
						<%-- パスワード入力欄の名前はpassword --%>
						<td class="color-main text-left">パスワード</td>
						<td class="text-left"><input class="form-control"
							type="password" name="password" value="" size="20" /></td>
					</tr>
					<tr>
						<td colspan="2" class="text-right"><input class="btn"
							type="submit" value="ログイン" /></td>
					</tr>
					<%-- リクエストスコープにalertがあれば --%>
 <c:if
 test="${requestScope.alert != null && requestScope.alert != ''}">
 <tr>
 <%-- リクエストスコープのalert の値を出力 --%>
					<td colspan="2" class="color-error text-left"><c:out
							value="${requestScope.alert }" /></td>
					</tr>
					</c:if>
				</table>
			</form>
		</div>
	</div>
</body>
</html>