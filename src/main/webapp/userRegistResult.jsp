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
		<strong>以下の内容で登録が完了しました。</strong>
		</h4>
	</div>
</div>

<%-- 属性にサーブレットを指定 --%>
<form action="./UserRegistConfirmSvt" method="post"> 
<table class="table" style="max-width: 600px; margin: 0 auto;">
	<tr>
		<%-- 登録するログインID表示 --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;ログインID</td>
		<td >${param.loginId}</td>
	</tr>
	
	<tr>
		<%-- 登録するパスワード表示 --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;パスワード</td>
		<td>${param.password}</td>
	</tr>
	
	<tr>
		<%-- 登録するユーザー名表示 --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;ユーザー名</td>
		<td >${param.userName}</td>
	</tr>
	
	
	<%-- 登録するアイコン表示 --%>
	<tr>
	<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;アイコン</td>
	<td>${param.icon}</td>
	</tr>
	
	
	<tr>
		<%-- 登録するプロフィール文表示 --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;プロフィール</td>
		<td>${param.profile}</td>
	</tr>
	
	<tr>	
	<td class="text-center"><input class="btn" onclick="location.href='index.jsp'" value="戻る" ></td>
	</form>
	</tr>
	
	</table>
</form>
</body>
</html>