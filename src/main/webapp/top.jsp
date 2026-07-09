<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>top</title>
<link rel="stylesheet" href="./css/skyblue.css">
<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="./css/helper.css">


</head>
<body>
	<%-- セッションスコープにある UserDTO型のオブジェクトを参照 --%>
	<jsp:useBean id="user" scope="session" type="dto.UserDTO"></jsp:useBean>
	<div class="bg-success padding-y-5">
		<div class="padding-y-5 text-center">
			<strong>Shouter</strong>
		</div>
	</div>

	<div class="padding-y-5">
		<div style="width: 40%" class="container padding-y-5">
			<%-- action 属性にサーブレットを指定 --%>
			<form action="./logout" method="post">
				<table class="table table-bordered">
					<tr>
						<td rowspan="2" class="text-center"><span
							class="${user.icon } pe-3x pe-va"></span></td>
						<td width="256">${user.userName }</td>
						<td><input class="btn btn-light" type="submit" value="ログアウト" /></td>


					</tr>
					<tr>
						<td colspan="2">${user.profile }</td>
					</tr>

				</table>
			</form>

			<%-- action 属性にサーブレットを指定 --%>
			<h6 class="text-center">今の気持ちを叫ぼう</h6>
			<form action="./bbs" method="post">
				<table class="table">
					<tr>
						<%-- 今の気持ち入力欄の名前は shout --%>
						<td><input class="form-control" type="text" name="shout"
							value="" size="60" /></td>
						<td><input class="btn" type="submit" value="叫ぶ" /></td>
					</tr>
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



	<%-- セッションスコープにあるArrayList型のオブジェクトを参照 --%>
	<jsp:useBean id="shouts" scope="session"
		type="java.util.ArrayList<dto.ShoutDTO>" />
	<div class="padding-y-5">
		<div style="width: 40%" class="container padding-y-5">
			<h6 class="text-center">みんなの叫び</h6>
			<%-- リストにある要素の数だけ繰り返し --%>
			<c:forEach var="shout" items="${shouts }">
				<table class="table table-striped table-bordered">
					<tr>
						<td rowspan="2" class="text-center"><span
							class="${shout.icon } pe-3x pe-va"></span></td>
						<td>${shout.userName }</td>
					</tr>
					<tr>
						<td>${shout.date }</td>
					</tr>
					<tr>
						<td colspan="2">  <p rows="5" class="form-control">${shout.writing }</p></td>
					</tr>
					
					
				</table>
			</c:forEach>
		</div>
	</div>
</body>
</html>