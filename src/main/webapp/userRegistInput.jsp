<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/skyblue.css">
<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="./css/helper.css">
<title>新規登録画面</title>
</head>
<body>
	<h2 class="bg-success padding-y-5 text-center">ユーザー登録入力画面<br>ユーザー登録します。内容を入力してください。</br></h2>

	

	<form action="./uic" method="post">
		<table style="width: 400px" class="table container padding-y-5">


			<tr>
				<td class="color-main text-left">ログインID<span
					class="color-error">（必須）</span></td>
				<td class="text-left"><input class="form-control" type="text"
					name="loginId" value="${param.loginId}" size="
0" placeholder="半角英数字 4～32文字" /> <c:if
						test="${!empty requestScope.errId}">
						<div class="color-error">
							<c:out value="${requestScope.errId}" />
						</div>
					</c:if></td>
			</tr>

			<tr>
				<td class="color-main text-left">ユーザー名<span class="color-error">（必須）</span></td>
				<td class="text-left"><input class="form-control" type="text"
					name="userName" value="${param.userName}" size="30" placeholder="1〜64文字" /> <c:if
						test="${!empty requestScope.errName}">
						<div class="color-error">
							<c:out value="${requestScope.errName}" />
						</div>
					</c:if></td>
			</tr>

			<tr>
				<td class="color-main text-left">パスワード<span class="color-error">（必須）</span></td>
				<td class="text-left"><input class="form-control"
					type="password" name="password" value="${param.password}" size="30"
					placeholder="半角英数字 4～32文字" /> <c:if
						test="${!empty requestScope.errPass}">
						<div class="color-error">
							<c:out value="${requestScope.errPass}" />
						</div>
					</c:if></td>
			</tr>

			<tr>
				<td class="color-main text-left">アイコン<span class="color-error">（必須）</span></td>
				<td class="text-left"><label style="margin-right: 15px;">
						<input type="radio" name="icon" value="pe-7s-user" ${param.icon == 'pe-7s-user' ? 'checked' :''}> <span
						class="pe-7s-user pe-lg pe-va"></span> 男性ユーザー
				</label> <label> <input type="radio" name="icon"
						value="pe-7s-user-female" ${param.icon == 'pe-7s-user-female' ? 'checked' :''}> <span
						class="pe-7s-user-female pe-lg pe-va"></span> 女性ユーザー
				</label> <c:if test="${!empty requestScope.errIcon}">
						<div class="color-error">
							<c:out value="${requestScope.errIcon}" />
						</div>
					</c:if></td>
			</tr>

			<tr>
				<td class="color-main text-left">プロフィール<br>（任意）
				</td>
				<td class="text-left"><textarea class="form-control"
						name="profile" rows="4" placeholder="自己紹介を入力してください（128文字以内）">${param.profile}</textarea>
					<c:if test="${!empty requestScope.errProfile}">
						<div class="color-error">
							<c:out value="${requestScope.errProfile}" />
						</div>
					</c:if></td>
			</tr>

			<tr>
				<td colspan="2" class="text-right"><input
					class="btn btn-primary" type="submit" value="確認画面へ" /></td>
			</tr>
		</table>
	</form>

	<br>

	<form action="./uii" method="get">
		<input type="hidden" name="action" value="back" /> <input class="btn"
			type="submit" value="ログイン画面に戻る" />
	</form>

</body>
</html>