<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>index</title>
<link rel="stylesheet" href="./css/skyblue.css">
<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="./css/helper.css">
<link rel="stylesheet" href="./css/mymade.css">

<title>ユーザ登録</title>
</head>
<body>
	<div class="bg-success padding-y-5">
		<div class="padding-y-5 text-center">
			<strong>ユーザー登録確認画面</strong>
			<p>登録します。よろしいでしょうか？</p>
		</div>
	</div>

	<div class="padding-y-5">
		<div style="width: 40%" class="container padding-y-5">
			<%-- action 属性にサーブレットを指定 --%>
			<form action="./uic" method="post">
				<table style="width: 400px; margin: 0 auto;" class="table">
					<tr>
						<%-- ログインIDの出力欄の名前はloginId --%>
						<td class="icon-smile color-main text-left">ログインID</td>
						<td class="text-left">${user.loginId }</td>
					</tr>
					<tr>
						<%-- ユーザ名出力欄の名前はuserName --%>
						<td class="icon-smile color-main text-left">ユーザ名</td>
						<td class="text-left">${user.userName }</td>
					</tr>

					<tr>
						<%-- パスワード出力欄の名前はpassword --%>
						<td class="icon-smile color-main text-left">パスワード</td>
						<td class="text-left">${user.password }</td>
					</tr>
					<tr>
						<td class="color-main text-left"><span class="icon-smile "></span>アイコン</td>


						<c:choose>
							<c:when test="${user.icon == 'icon-user'}">
								<td><span class="icon-user pe-2x pe-va"></span></td>
							</c:when>

							<c:when test="${user.icon == 'icon-user-female'}">
								<td><span class="icon-user-female pe-2x pe-va"></span></td>
							</c:when>
						</c:choose>
					</tr>
					<tr>
						<%-- プロフィール入力欄の名前はprofile --%>
						<td class="icon-smile color-main text-left">プロフィール</td>
						<td class="text-left">${user.profile }</td>
					</tr>
				</table>
				<table style="width: 400px; margin: 0 auto;" class="table">
					<%-- 入力された値をデータベース挿入の仲立ちをするcontrollに送る --%>
					<input type="hidden" name="loginId" value="${user.loginId}">
					<input type="hidden" name="userName" value="${user.userName}">
					<input type="hidden" name="password" value="${user.password}">
					<input type="hidden" name="icon" value="${user.icon}">
					<input type="hidden" name="profile" value="${user.profile}">


					<tr>
						<td colspan="2" class="text-center"><input class="btn"
							type="submit" value="ＯＫ" /></td>
						
							<%-- 入力された値を入力フォームへ戻す仲立ちをするcontrollに送る --%>
							<input type="hidden" name="loginId" value="${user.loginId}">
							<input type="hidden" name="userName" value="${user.userName}">
							<input type="hidden" name="password" value="${user.password}">
							<input type="hidden" name="icon" value="${user.icon}"> <input
								type="hidden" name="profile" value="${user.profile}">

							<td colspan="2" class="text-center"><input class="btn"
								type="submit" formaction="userRegistInput.jsp" value="キャンセル" /></td>
						
					</tr>
					<%-- エラーがある場合 --%>
					<c:if
						test="${requestScope.alert != null && requestScope.alert != ''}">
						<tr>
							<%-- ログインIDのエラーを出力 --%>
							<td colspan="2" class="color-error text-left"><c:out
									value="${requestScope.alert }" /></td>
						</tr>
					</c:if>
				</table>
		</div>
	</div>
</body>
</html>