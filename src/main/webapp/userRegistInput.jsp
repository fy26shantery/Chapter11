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
			<p>ユーザー登録をします。内容を入力してください。</p>
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
							name="loginId" value="${param.loginId}" size="20" 
							 autofocus /></td>
					</tr>
					<tr>
						<%-- ユーザ名入力欄の名前はuserName --%>
						<td class="icon-smile color-main text-left">ユーザ名</td>
						<td class="text-left"><input class="form-control" type="text" name="userName" value="${param.userName}" size="20" 
							 /></td>
					</tr>

					<tr>
						<%-- パスワード入力欄の名前はpassword --%>
						<td class="icon-smile color-main text-left">パスワード</td>
						<td class="text-left"><input class="form-control"
							type="password" name="password" value="${param.password}" size="20"  /></td>
					</tr>
					<tr>
						<td class="color-main text-left "><span class="icon-smile"></span>アイコン</td>



						<td class="my_merge_sq text-center"><span
							class="icon-user pe-2x pe-va"></span><label class="fancy-radio">
								<input type="radio" name="icon" id="icon-user" value="icon-user" <c:if test="${param.icon == 'icon-user'}">checked</c:if>>  <span></span>
						</label> <span class="icon-user-female pe-2x pe-va"></span> <label
							class="fancy-radio"> <input type="radio" name="icon"
								id="icon-user-female" value="icon-user-female" <c:if test="${param.icon == 'icon-user-female'}">checked</c:if>> 
								 <span></span>
						</label></td>
					</tr>
					<tr>
						<%-- プロフィール入力欄の名前はprofile --%>
						<td class="color-main text-left icon-smile">プロフィール</td>
						<td class="text-left"><input class="form-control" type="text" name="profile" value="${param.profile}" size="20" /></td>
					</tr>
				</table>

				<table style="width: 400px; margin: 0 auto;" class="table">

					<tr>
						<td colspan="1" class="text-center"><input class="btn"
							type="submit" value="登録" /></td>


						<td colspan="1" class="text-center"><input class="btn"
							formaction="index.jsp" type="submit" value="戻る" formnovalidate /></td>


					</tr>





					<%-- エラーがある場合 --%>
					<c:if
						test="${requestScope.alertLogId != null && requestScope.LogId != ''}">
						<tr>
							<%-- ログインIDのエラーを出力 --%>
							<td colspan="2" class="color-error text-left"><c:out
									value="${requestScope.alertLogId }" /></td>
						</tr>
					</c:if>
					<c:if
						test="${requestScope.alertLogIdLen != null && requestScope.LogIdLen != ''}">
						<tr>
							<%-- ログインIDの文字数エラーを出力 --%>
							<td colspan="2" class="color-error text-left"><c:out
									value="${requestScope.alertLogIdLen }" /></td>
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
						test="${requestScope.alertPassLen != null && requestScope.alertPassLen != ''}">
						<tr>
							<%-- パスワードの文字数エラーを出力 --%>
							<td colspan="2" class="color-error text-left"><c:out
									value="${requestScope.alertPassLen }" /></td>
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
					<c:if
						test="${requestScope.alertProfile != null && requestScope.alertProfile != ''}">
						<tr>
							<%-- プロフィールのエラーを出力 --%>
							<td colspan="2" class="color-error text-left"><c:out
									value="${requestScope.alertProfile }" /></td>
						</tr>
					</c:if>
					<c:if
						test="${requestScope.alertRegist != null && requestScope.alertRegist != ''}">
						<tr>
							<%-- アイコンのエラーを出力 --%>
							<td colspan="2" class="color-error text-left"><c:out
									value="${requestScope.alertRegist }" /></td>
						</tr>
					</c:if>
				</table>
			</form>
		</div>
	</div>
</body>
</html>