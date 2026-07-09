<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/skyblue.css">
<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="./css/helper.css">
</head>
<body>

	<h2 class="bg-success padding-y-5 text-center">
		<strong>Shouter</strong> <span class="icon-speaker"></span>
	</h2>
	<%-- action 属性にサーブレットを指定 --%>
			<jsp:useBean id="user" scope="session" type="dto.UserDTO" />
	
	<div class="padding-y-5">
	<div style="width: 400px" class="table container padding-y-5">

		<%--　セッションスコープにあるUserDTO型オブジェクトを参照 --%>
		<!--		<table class="table table-bordered">-->

		<h3 class="text-center">
			<strong>ログインユーザー情報</strong>
		</h3>


		<form action="./logout" method="post">
			<table class="table table-bordered">

					<tr>
						<td rowspan="2" class="text-center"><span
							class="${user.icon} pe-3x pe-va"></span></td>
						<td width="256">${user.userName}</td>
						<td><input class="btn btn-light" type="submit" value="ログアウト" />
						</td>
					</tr>
					<tr>
						<td colspan="2">${user.profile}</td>
					</tr>
				</table>
				</form>
				</div>
				</div>
				

				<%-- action 属性にサーブレットを指定 --%>
				<form action="./bbs" method="post">
					<table class="table">
						<h3 class="text-center">
							<strong>今の気持ちを叫ぼう</strong>
						</h3>

						<tr>
							<%--今の気持ち入力欄の名前は　shout --%>
							<td><input class="form-control" type="text" name="shout"
								value="" size="60" placeholder="今の気持ちを叫ぼう" /></td>
							<td><input class="btn btn-primary" type="submit" value="叫ぶ" /></td>
						</tr>

						<c:if test="${requestScope.bbsAlert != null}">
							<tr>
								<td colspan="2" class="color-error text-left"><c:out
										value="${requestScope.bbsAlert}" /></td>
							</tr>
						</c:if>




					</table>
					</from>




					<%--セッションスコープにあるArrayList型のオブジェクトを参照 --%>
					<jsp:useBean id="shouts" scope="session"
						type="java.util.ArrayList<dto.ShoutDTO>" />
					<div class="padding-y-5">
						<div style="width: 40%" class="container padding-y-5">
							<h3>みんなの叫び</h3>
							<%-- action 属性にサーブレットを指定 --%>
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
										<!--							<td colspan="2"><textarea row="5" class="form-control">${shout.writing}</textarea>-->

<!--										<td colspan="2"><textarea row="5" class="form-control"-->
<!--												readonly> <c:out value="${shout.writing}" /></textarea></td>-->
										<td colspan="2"><p row="5" class="form-control">${shout.writing}</p>
										</td>
									</tr>
								</table>
							</c:forEach>
						</div>
					</div>
</body>
</html>