<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>叫びルーム</title>
<link rel="stylesheet" href="./css/skyblue.css">
<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="./css/helper.css">
</head>
<body>
	<div class="bg-success padding-y-5">
		<div class="padding-y-5 text-center">
			<strong>最近の叫び</strong>
		</div>
	</div>
	<%-- セッションスコープにあるUserDTO型のオブジェクトを参照 --%>
	<div class="padding-y-5">
		<div style="width: 40%" class="container padding-y-5">
			<jsp:useBean id="user" scope="session" type="dto.UserDTO" />
			<div class="padding-y-5">
				<div style="width: 40% class=" containerpadding-y-5">
					<%-- action属性にサーブレットを指定 --%>
					<form action="./logout" method="post">
					<p>ログインユーザー情報</p>
						<table class="table table-bordered">
							<tr>
								<td rowspan="2" class="text-center"><span
									class="${user.icon} 
						pe-3x pe-va"></span>
								<td width="256">${user.userName}</td>
								<td><input class="btn btn-light" type="submit"
									value="ログアウト" /></td>
							</tr>
							<tr>
								<td colspan="2">${user.profile}</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<%-- action属性にサーブレットを指定 --%>
			<p>いまの気持ちを叫ぼう！</p>
			<form action="./bbs" method="post">
				<table class="table">
					<tr>
						<td><input class="form-control" type="text" name="shout"
							value="" size="60" /></td>
						<td><input class="btn" type="submit" value="叫ぶ" /></td>
					</tr>
					
					<%-- リクエストスコープにalertがあれば --%>
					<c:if test="${requestScope.alert != null && requestScope.alert != '' }">
						<tr>
							<td colspan="2" class="color-error text-left">
								<c:out value="${requestScope.alert}" />
							</td>
						</tr>
					</c:if>
				</table>
			</form>
		</div>
		</div>

			<%-- セッションスコープにあるArrayListのオブジェクトを参照 --%>
			<jsp:useBean id="shouts" scope="session"
				type="java.util.ArrayList<dto.ShoutDTO>" />
			<div class="padding-y-5">
				<div style="width: 40%" class="container padding-y-5">
				<p>みんなの叫び</p>
					<%-- action属性にサーブレットを指定 --%>
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
							<%-- 表示領域を入力不可にする --%>
								<td colspan="2"><p rows="5" class="form-control">${shout.writing}</p></td>
							</tr>
						</table>
					</c:forEach>
				</div>
			</div>

</body>
</html>