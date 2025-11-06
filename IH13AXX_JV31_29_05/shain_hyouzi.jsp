<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> <%-- Listを使うためインポート --%>
<%@ page import="com.example.model.Shain" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>社員マスタ一覧</title>
</head>
<body>
    <h1>社員マスタ一覧</h1>
    <table border="1">
        <thead>
            <tr>
                <th>氏名</th>
                <th>性別</th>
                <th>備考</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Shain> shainList = (List<Shain>) request.getAttribute("shainList");

                if (shainList != null && !shainList.isEmpty()) {
                    for (Shain shain : shainList) {
            %>
                        <tr>
                        	<input type="hidden" name="id" value="<%= shain.getUserId() %>">
                            <td><%= shain.getShimei() %></td>
                            <td><%= shain.getSeibetsu() %></td>
                            <td><%= shain.getBiko() %></td>
                            <td class="actions">
                                <form action="shain_edit" method="get" style="display:inline;">
                                   <input type="hidden" name="id" value="<%= shain.getUserId() %>">
                                    <button type="submit">編集</button>
                                </form>
                               <form action="shain_delete" method="post" style="display:inline;" onsubmit="return confirm('本当に削除しますか？');">
                                    <input type="hidden" name="id" value="<%= shain.getUserId() %>">
                                    <button type="submit">削除</button>
                                </form>
                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="3">登録されている社員情報はありません。</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>
    
    <hr>
    
    <p><a href="shain_register">社員登録フォームへ</a></p>
</body>
</html>
<%@ page import="com.example.model.Shain" %>