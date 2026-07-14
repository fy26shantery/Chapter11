<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/skyblue.css">
<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="./css/helper.css">
<link rel="stylesheet" href="./css/.css">
</head>
<body>

<div class="bg-success padding-y-5">
	<div class="sm-padding-y-20 text-center">
	
		<h4><strong>ユーザー登録確認画面</strong>
		<br>
		<strong>ユーザー登録します。よろしいでしょうか？</strong>
		</h4>
	</div>
</div>

<%-- 属性にサーブレットを指定 --%>
<form action="./UserRegistConfirmSvt" method="post"> 
<table class="table" style="max-width: 600px; margin: 0 auto;">

<tr>
		<%-- ログインID入力欄表示 --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;ログインID</td>
		<td>
			${user.loginId}
		</td>
	</tr>

	
	<tr>
		<%-- パスワード入力欄表示 --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;パスワード</td>
		<td>
			${user.password}
		</td>
	</tr>
	
	<%-- アイコン選択欄の名前はtourokuicon --%>
	<tr>
	<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;アイコン</td>
	<td>
		${user.icon}
	</td>
	</tr>
	
	
	<tr>
		<%-- プロフィール入力欄の名前はtourokuprof --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;プロフィール</td>
		<td>
			${user.profile}
		</td>
	</tr>
	
	<tr>
		<td>
		<form action ="./UserRegistConfirmSvt" method="post">
							
		<input type="hidden" name="loginId" value="${user.loginId}">
		<input type="hidden" name="userName" value="${user.userName}">
		<input type="hidden" name="password" value="${user.password}">
		<input type="hidden" name="userIcon" value="${user.icon}">
		<input type="hidden" name="profile" value="${user.profile}">						
							
		<form>
		</td>
	</tr>	
	
	
	<tr>
		<td class="text-center"><input class="btn" type="submit" value="OK" /></td>
	
	<td class="text-center"><input class="btn" onclick="location.href='userRegistInput.jsp'" value="キャンセル" ></td>
	</form>
	</tr>
	</table>
</form>
</body>
</html>