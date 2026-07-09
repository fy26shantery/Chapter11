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
	<h2 class="bg-success padding-y-5 text-center"><strong>Shouter<i class=icon-speaker></i></strong></h2>
	<%--セッションスコープにある UserDTO型のオブジェクトを参照 --%>
	<jsp:useBean id="user" scope="session" type="dto.UserDTO" />
	<div class="padding-y-5">
		<div style="width: 40%" class="container padding-y-5">
			<%-- action 属性にサーブレットを指定 --%>
			<form action="./logout" method="post">
				<table class="table table-bordered">
				<h5 class="text-center">ログインユーザ情報</h5>
					<tr>
						<td rowspan="2" class="text-center"><span class="${user.icon} pe-3x pe-va"></span></td>
						<td width="256">${user.userName}</td>
						<td><input class="btn btn-light" type="submit" value="ログアウト" /></td>
					</tr>
					<tr>
						<td colspan="2">${user.profile}</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<%-- action 属性にサーブレットを指定 --%>
	<div class="padding-y-5">
		<form action="./bbs" method="post">
			<h3 class="text-center">今の気持ちを叫ぼう</h3>
			<table class="table container padding-y-5">
				<tr>
				<%-- 今の気持ち入力欄の名前は shout --%>
				<td><input class="form-control" type="text" name="shout" value="" size="60" /></td>
				<td><input class="btn" type="submit" value="叫ぶ" /></td>
				</tr>
				<%-- リクエストスコープにalertがあれば --%>
				<c:if test="${requestScope.alert != null && requestScope.alert != ''}">
					<tr>
						<%-- リクエストスコープの alert の値を出力 --%>
						<td colspan="2" class="color-error text-left"><c:out value="${requestScope.alert}" /></td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
	
	
	<%-- セッションスコープにあるArrayList型のオブジェクトを参照 --%>
	<jsp:useBean id="shouts" scope="session" type="java.util.ArrayList<dto.ShoutDTO>" />
	
	<%--listの書き方はこれがいいらしい
	単なる設定の文字」として処理するため、
	< > が入っているとパニックを起こしてエラーになってしまいます。・・そんなことはありませんでした--%>
	
	<div class="padding-y-5">
		<div style="width: 40%" class="container padding-y-5">
			<h3>みんなの叫び</h3>
			<%-- リストにある要素の数だけ繰り返し --%>
			<c:forEach var="shout" items="${shouts}">
				<table class="table table-striped table-bordered">
					<tr>
						<td rowspan="2" class="text-center"><span class="${shout.icon} pe-3x pe-va"></span></td>
						<td>${shout.userName}</td>
					</tr>
					<tr>
						<td>${shout.date}</td>
					</tr>
					<tr>
						<td colspan="2"><p rows="5" class="form-control" readonly>${shout.writing}</p></td>
					</tr>
				</table>
			</c:forEach>
		</div>
	</div>
</body>
</html>