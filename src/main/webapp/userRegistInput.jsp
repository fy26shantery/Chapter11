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
	
		<h4><strong>ユーザー登録入力画面</strong>
		<br>
		<strong>ユーザー登録します。内容を入力してください。</strong>
			<span class="icon-speaker pe-1x pe-va"></span>
		</h4>
	</div>
</div>

<%-- 属性にサーブレットを指定 --%>
<form action="./userregistinputsvt" method="post"> 
<table class="table" style="max-width: 600px; margin: 0 auto;">
	<tr>
		<%-- ログインID入力欄の名前はtourokuId --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;ログインID</td>
		<td class="text-center"><input class="form-control" type="text" name="tourokuId" value="" size="20" autofocus /></td>
	</tr>
	
	<tr>
		<%-- ユーザー名入力欄の名前はtourokuname --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;ユーザー名</td>
		<td class="text-center"><input class="form-control" type="text" name="tourokuname" value="" size="20" /></td>
	</tr>
	
	<tr>
		<%-- パスワード入力欄の名前はtourokupass --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;パスワード</td>
		<td class="text-center"><input class="form-control" type="text" name="tourokupass" value="" size="20" /></td>
	</tr>
	
	<%-- アイコン選択欄の名前はtourokuicon tourokuicon2 --%>
	<tr>
	<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;アイコン</td>
	<td>
	<label class="fancy-radio"><input type="radio" name="tourokuicon" id="maleicon" value="" checked><span class="icon-speaker pe-2x pe-va"></span></label>
	<label class="fancy-radio"><input type="radio" name="tourokuicon2" id="femaleicon" value=""><span class="icon-speaker pe-2x pe-va"></span></label>
	</td>
	</tr>
	
	
	<tr>
		<%-- プロフィール入力欄の名前はtourokuprof --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;プロフィール</td>
		<td class="text-center"><input class="form-control" type="text" name="tourokuprof" value="" size="20" autofocus /></td>
	</tr>
	
	<tr>
		<td class="text-right"><input class="btn" type="submit" value="ログイン" /></td>
	
	<form action="./userRegistInput.jsp" method="post">
	<td class="text-left"><input class="btn" type="submit" value="新規登録" ></td>
	</form>
	</tr>
	
	<%-- リクエストスコープにalertがあれば --%>
	<c:if
	test="${requestScope.alert != null && requestScope.alert !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left"><c:out
			value="${requestScope.alert}" /></td>	
			
	</tr>
	</c:if>
	
	<c:if
	test="${requestScope.alert2 != null && requestScope.alert2 !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left"><c:out
			value="${requestScope.alert2}" /></td>
	</tr>
	</c:if>
	
	</table>
</form>
</body>
</html>