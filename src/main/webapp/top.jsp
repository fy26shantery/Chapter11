<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/skyblue.css">
<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="./css/helper.css">
</head>

<%-- セッションスコープにある UserDTO型のオブジェクト参照 --%>
<jsp:useBean id="user" scope="session" type="dto.UserDTO" />
<div class="bg-success padding-y-5  ">
	<div class="sm-padding-y-20 text-center">
		<h1>
			<strong>Shouter</strong> <span class="icon-speaker pe-1x pe-va"></span>
		</h1>
	</div>
</div>

<div style="width: 40%" class="container padding-y-5">
	<%-- action 属性にサーブレットを指定 --%>
	<form action="./logout" method="post">

		<h5 class="text-left my-4">
			<strong>ログインユーザー情報</strong>
		</h5>


		<table class="table table-bordered">
			<tr>
				<td rowspan="2" class="text-center"><span
					class="${user.icon} pe-3x pe-va"}></span></td>
				<td width="256">${user.userName }</td>
				<td><input class="btn btn-light" type="submit" value="ログアウト" /></td>
			</tr>
			<tr>
				<td colspan="2">${user.profile}</td>
			</tr>
		</table>
	</form>
	<%-- action属性にサーブレットを指定 --%>
	<form action="./bbs" method="post">
		<h5 class="text-left">
			<strong>今の気持ちを叫ぼう</strong>
		</h5>
		<table class="table">
			<tr>
				<%-- 今の気持ち入力欄の名前は shout --%>
				<td><input class="form-control" type="text" name="shout"
					value="" size="60" autofocus /></td>
				<td><input class="btn" type="submit" value="叫ぶ" /></td>
			</tr>
		


	<%-- リクエストスコープにalertがあれば --%>
	<c:if test="${requestScope.alert != null && requestScope.alert !=''}">
		<tr>
			<%-- リクエストスコープの alert の値を出力 --%>
			<td class="color-error text-left"><c:out value="${requestScope.alert}" /></td>
		</tr>
	</c:if>
	</table>
	</form>
</div>
</div>

<%-- セッションスコープにあるArray List型のオブジェクトを参照 --%>
<jsp:useBean id="shouts" scope="session"
	type="java.util.ArrayList<dto.ShoutDTO>" />
<div class="padding-y-5">
	<div style="width: 40%" class="container padding-y-5">
		<%-- リストにある要素の数だけ繰り返し --%>
		<c:forEach var="shout" items="${shouts}">
			<table class="table table-striped table-bordered">
				<tr>
					<td rowspan="2" class="text-center"><span
						class="${shout.icon} pe-3x pe-va"></span></td>
					<td>${shout.userName}</td>
				</tr>
				<tr>
					<td>${shout.date}</td>
				</tr>
				<tr>
					<td colspan="2"><label rows="5" class="form-control">${shout.writing}</label>
					</td>
				</tr>
			</table>
		</c:forEach>
	</div>
</div>
</body>
</html>