<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, model.Shain" %>
<%
    List<Shain> list = (List<Shain>) request.getAttribute("shainList");
%>
<html>
<head><title>社員一覧</title></head>
<body>
<h2>社員一覧</h2>

<% if (list == null || list.isEmpty()) { %>
    <p>データが登録されていません</p>
<% } else { %>
    <table border="1">
    <tr><th>ID</th><th>氏名</th><th>性別</th><th>備考</th></tr>
    <% for (Shain s : list) { %>
    <tr>
        <td><%= s.getId() %></td>
        <td><%= s.getName() %></td>
        <td><%= s.getGenderLabel() %></td>
        <td><%= s.getNote() %></td>
    </tr>
    <% } %>
    </table>
<% } %>
</body>
</html>
