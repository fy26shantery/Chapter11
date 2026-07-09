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
			<strong>ユーザー登録入力画面</strong>
		</div>
	</div>

	<div class="padding-y-5">
		<div style="width: 40%" class="container padding-y-5">
			<%-- action 属性にサーブレットを指定 --%>
			<form action="./uii" method="post">
				<table style="width: 400px; margin: 0 auto;" class="table">
					<tr>
						<%-- ログインIDの入力欄の名前はloginId --%>
						<td class="icon-smile color-main text-left">ログインID</td>
						<td class="text-left"><input class="form-control" type="text"
							name="loginId" value="" size="20" minlength="4" maxlength="32"
							required autofocus /></td>
					</tr>
					<tr>
						<%-- ユーザ名入力欄の名前はuserName --%>
						<td class="icon-smile color-main text-left">ユーザ名</td>
						<td class="text-left"><input class="form-control" type="text"
							name="userName" value="" size="20" minlength="1" maxlength="64"
							required /></td>
					</tr>

					<tr>
						<%-- パスワード入力欄の名前はpassword --%>
						<td class="icon-smile color-main text-left">パスワード</td>
						<td class="text-left"><input class="form-control"
							type="password" name="password" value="" size="20" minlength="4"
							maxlength="32" required /></td>
					</tr>
					<tr>
						<td><span class="icon-smile color-main text-left"></span>アイコン</td>



						<td class="my_merge_sq text-center">
						<span class="icon-user pe-2x pe-va"></span><label
							class="fancy-radio"> <input type="radio" name="icon"
								id="icon-user" value="icon-user" maxlength="128" required> <span></span>
								
						</label>
						 <span class="icon-user-female pe-2x pe-va"></span>
						 <label class="fancy-radio"> <input type="radio"
								name="icon" id="icon-user-female" value="icon-user-female" maxlength="128"
								required> <span></span>
						</label></td>
					</tr>
					<tr>
						<%-- プロフィール入力欄の名前はprofile --%>
						<td class="color-main text-left">プロフィール</td>
						<td class="text-left"><input class="form-control" type="text"
							name="profile" value="" size="20" maxlength="128" /></td>
					</tr>
				</table>
				<table style="width: 400px; margin: 0 auto;" class="table">

					<tr>
						<td colspan="2" class="text-center"><input class="btn"
							type="submit" value="登録" /></td>
						</form>
						<form action="index.jsp" method="post">
							<td colspan="2" class="text-center"><input class="btn"
								type="submit" value="戻る" /></td>
						</form>

					</tr>
				</table>


				<%-- エラーがある場合 --%>
				<c:if
					test="${requestScope.alertLogId != null && requestScope.LogId1 != ''}">
					<tr>
						<%-- ログインIDのエラーを出力 --%>
						<td colspan="2" class="color-error text-left"><c:out
								value="${requestScope.alertLogId }" /></td>
					</tr>
				</c:if>
				<c:if
					test="${requestScope.alertUN != null && requestScope.alertUN != ''}">
					<tr>
						<%-- ユーザー名のエラーを出力 --%>
						<td colspan="2" class="color-error text-left"><c:out
								value="${requestScope.alertUN }" /></td>
					</tr>
				</c:if>
				<c:if
					test="${requestScope.alertPass != null && requestScope.alertPass != ''}">
					<tr>
						<%-- パスワードのエラーを出力 --%>
						<td colspan="2" class="color-error text-left"><c:out
								value="${requestScope.alertPass }" /></td>
					</tr>
				</c:if>
				<c:if
					test="${requestScope.alertIcon != null && requestScope.alertIcon != ''}">
					<tr>
						<%-- アイコンのエラーを出力 --%>
						<td colspan="2" class="color-error text-left"><c:out
								value="${requestScope.alertIcon }" /></td>
					</tr>
				</c:if>
		</div>
	</div>
</body>
</html>