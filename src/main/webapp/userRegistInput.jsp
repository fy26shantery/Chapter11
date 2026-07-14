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
</head>
<body>

<div class="bg-success padding-y-5">
	<div class="sm-padding-y-20 text-center">
	
		<h4><strong>ユーザー登録入力画面</strong>
		<br>
		<strong>ユーザー登録します。内容を入力してください。</strong>
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
		<%-- パスワード入力欄の名前はtourokupass --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;パスワード</td>
		<td class="text-center"><input class="form-control" type="text" name="tourokuPass" value="" size="20" /></td>
	</tr>
	
	<tr>
		<%-- ユーザー名入力欄の名前はtourokuname --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;ユーザー名</td>
		<td class="text-center"><input class="form-control" type="text" name="tourokuName" value="" size="20" /></td>
	</tr>
	
	<%-- アイコン選択欄の名前はtourokuicon --%>
	<tr>
	<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;アイコン</td>
	<td>
	<span class="icon-user pe-2x pe-va"></span>
	<label><input type="radio" name="tourokuIcon" id="maleicon" value="icon-user" checked></label>
	<span class="icon-user-female pe-2x pe-va"></span>
	<label><input type="radio" name="tourokuIcon" id="femaleicon" value="icon-user-female"></label>
	</td>
	</tr>
	
	
	<tr>
		<%-- プロフィール入力欄の名前はtourokuprof --%>
		<td class="color-main text-center"><span class="icon-speaker pe-2x pe-va"></span>&nbsp;プロフィール</td>
		<td class="text-center"><input class="form-control" type="text" name="tourokuProf" value="" size="20" autofocus /></td>
	</tr>
	
	<tr>
		<td class="text-center"><input class="btn" type="submit" value="登録確認画面へ進む" /></td>
	
	<td class="text-center"><input class="btn" onclick="location.href='index.jsp'" value="戻る" ></td>
	</form>
	</tr>
	
	<%-- リクエストスコープにalertがあれば --%>
	<c:if
	test="${requestScope.notInputAlert != null && requestScope.notInputAlert !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left"><c:out
			value="${requestScope.notInputAlert}" /></td>	
			
	</tr>
	</c:if>
	
	<c:if
	test="${requestScope.passwordAlert != null && requestScope.passwordAlert !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left"><c:out
			value="${requestScope.passwordAlert}" /></td>
	</tr>
	</c:if>
	
	
	<%-- リクエストスコープにalertがあれば --%>
	<c:if
	test="${requestScope.existingIdAlert != null && requestScope.existingIdAlert !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left"><c:out
			value="${requestScope.existingIdAlert}" /></td>	
			
	</tr>
	</c:if>
	
	<%-- リクエストスコープにalertがあれば --%>
	<c:if
	test="${requestScope.insertAlert != null && requestScope.insertAlert !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left"><c:out
			value="${requestScope.insertAlert}" /></td>	
			
	</tr>
	</c:if>
	
	
	<%-- リクエストスコープにalertがあれば --%>
	<c:if
	test="${requestScope.userNameAlert != null && requestScope.userNameAlert !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left"><c:out
			value="${requestScope.userNameAlert}" /></td>	
			
	</tr>
	</c:if>
	
	
	<%-- リクエストスコープにalertがあれば --%>
	<c:if
	test="${requestScope.loginIdAlert != null && requestScope.loginIdAlert !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left"><c:out
			value="${requestScope.loginIdAlert}" /></td>	
			
	</tr>
	</c:if>
	
	<%-- リクエストスコープにalertがあれば --%>
	<c:if
	test="${requestScope.profileAlert != null && requestScope.profileAlert !=''}">
	<tr>
		<%-- リクエストスコープの alert の値を出力 --%>
		<td colspan="2" class="color-error text-left"><c:out
			value="${requestScope.profileAlert}" /></td>	
			
	</tr>
	</c:if>
	
	
	</table>
</form>
</body>
</html>