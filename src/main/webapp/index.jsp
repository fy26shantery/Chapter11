<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/skyblue.css">
	<link rel="stylesheet" href="./css/pe-icon-7-stroke.css">
	<link rel="stylesheet" href="./css/helper.css">
</head>
	<body>
	
	    <h2 class="bg-success padding-y-5 text-center"><strong>Shouter</strong>
	    <i class="icon-speaker"></i></h2>
	<%-- action 属性にサーブレットを指定 --%>
	

    <%-- action 属性にサーブレットを指定 --%>
    <form action="./login" method="post">
    		<table style="width: 400px" class="table container padding-y-5">
    
           <tr>
           <td colspan="2" class ="text-left"><strong>ログインIDとパスワードを入力してください</strong></td>
           
           </tr>
            <tr>
                <%-- ログインID入力欄の名前はloginId --%>
                <td class="color-main text-left">ログインID</td>
                <td class="text-left">
                    <input class="form-control" type="text" name="loginId" value="" size="20" autofocus />
                </td>
            </tr>
<!--            <tr>-->
<!--                <%-- ユーザー名の入力欄の名前はuserName --%>-->
<!--                <td class="color-main text-left">ユーザー名</td>-->
<!--                <td class="text-left">-->
<!--                    <input class="form-control" type="text" name="userName" value="" size="20" />-->
<!--                </td>-->
<!--            </tr>-->
            <tr>
                <%-- パスワード入力欄の名前はpassword --%>
                <td class="color-main text-left">パスワード</td>
                <td class="text-left">
                    <input class="form-control" type="password" name="password" value="" size="20" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="text-right">
                    <input class="btn" type="submit" value="ログイン" />
                </td>
            </tr>
            
            <%-- リクエストスコープにalertがあれば --%>
            <c:if test="${requestScope.alert != null && requestScope.alert != ''}">
                <tr>
                    <%-- リクエストスコープの alert の値を出力 --%>
                    <td colspan="2" class="color-error text-left">
                        <c:out value="${requestScope.alert}" />
                    </td>
                </tr>
            </c:if>
        </table>
    </form>

</div>

</body>
</html>