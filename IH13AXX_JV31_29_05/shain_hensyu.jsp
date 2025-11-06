<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.model.Shain" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>社員情報編集</title>
</head>
<body>
    <h1>社員情報編集</h1>
    <%
        Shain shain = (Shain) request.getAttribute("shain");
        if (shain == null) {
    %>
        <p>社員情報が見つかりません。</p>
    <%
        } else {
    %>
        <form action="shain_edit" method="post">
            <input type="hidden" name="id" value="<%= shain.getUserId() %>">
            <p>
                氏名: <input type="text" name="氏名" value="<%= shain.getShimei() %>">
            </p>
            <p>
                性別:
                <select name="性別">
                    <option value="M" <%= "M".equals(shain.getSeibetsu()) ? "selected" : "" %>>男</option>
                    <option value="W" <%= "W".equals(shain.getSeibetsu()) ? "selected" : "" %>>女</option>
                </select>
            </p>
            <p>
                備考: <br>
                <textarea name="備考" rows="4" cols="40"><%= shain.getBiko() %></textarea>
            </p>
            <p>
                <input type="submit" value="更新">
                <a href="/250627_ShainDB/shain_list">キャンセル</a>
            </p>
        </form>
    <%
        }
    %>
</body>
</html>