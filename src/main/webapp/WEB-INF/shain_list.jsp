<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, model.Shain" %>
<%
    List<Shain> list = (List<Shain>) request.getAttribute("shainList");
%>
<html>
<head>
<title>
社員一覧
</title>
    <style>
        @charset "UTF-8";
        body {
            font-family: "Segoe UI","Hiragino Kaku Gothic ProN","Meiryo",sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            background: linear-gradient(135deg, #4f8ef7, #6fb1fc);
            color: #fff;
            padding: 1rem 2rem;
            margin: 0 0 1.5rem 0;
            text-align: center;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        }
        
        h2{
        	margin-left:5vw;
        }

        table {
            width: 90%;
            margin: 0 auto 2rem auto;
            border-collapse: collapse;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 0.8rem 1rem;
            text-align: left;
        }

        th {
            background: #4f8ef7;
            color: #fff;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background: #f2f6ff;
        }

        form {
            width: 85%;
            margin: 0 auto 1rem auto;
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            font-weight: bold;
            margin: 1rem 0 0.5rem;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"],
        select {
            width: 100%;
            padding: 0.7rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 1rem;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #4f8ef7;
            box-shadow: 0 0 5px rgba(79,142,247,0.4);
        }

        button, input[type="submit"], input[type="reset"] {
            background: #4f8ef7;
            color: #fff;
            border: none;
            padding: 0.6rem 1.2rem;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1rem;
            margin: 0.5rem 0.5rem 0 0;
            transition: background 0.3s;
        }

        button:hover, input[type="submit"]:hover, input[type="reset"]:hover {
            background: #367be5;
        }

        .btn-danger {
            background: #e74c3c;
        }

        .btn-danger:hover {
            background: #c0392b;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
        
        .add_btn{
        	margin-left:5vw;
        }
        .nodata{
        	margin-left:5vw;
        }
        
        .search-box form{
        	display: flex;
    		align-items: center;
    		gap: 10px; 
    		flex-wrap: wrap;
        }
        
        .search-box input[type="radio"] + label {
   			 margin-right: 15px; /* 右側に少し余白を追加 */
		}
        
    </style>
</head>
<body>
<h2>社員一覧</h2>
<p class="add_btn"><a href="maintenance?action=add">新規追加</a></p>
    <div class="search-box">
        <form action="maintenance" method="post">
            <input type="hidden" name="action" value="list">
            
            <label for="searchName">氏名:</label>
            <input type="text" id="searchName" name="searchName" value="${searchName}"/>
            
            <label>性別:</label>
            <input type="radio" id="gender_all" name="gender" value="" <c:if test="${empty gender}"></c:if>
            <label for="gender_all">すべて</label>
            
            <input type="radio" id="gender_male" name="gender" value="1" <c:if test="${gender eq '男性'}"></c:if>
            <label for="gender_male">男性</label>

            <input type="radio" id="gender_female" name="gender" value="2" <c:if test="${gender eq '女性'}"></c:if>
            <label for="gender_female">女性</label>
            
            <select name="sortColumn" id="sortColumn">
                <option value="" <c:if test="${empty sortColumn}"></c:if>指定してください</option>
                <option value="id" <c:if test="${sortColumn eq 'id'}"></c:if>ID</option>
                <option value="name" <c:if test="${sortColumn eq 'name'}"></c:if>氏名</option>
                <option value="gender" <c:if test="${sortColumn eq 'gender'}"></c:if>性別</option>
            </select>
            <label for="sortColumn">並び替え:</label>
            <input type="radio" name="sortOrder" value="asc" id="sort_asc" <c:if test="${empty sortOrder || sortOrder eq 'asc'}"></c:if>
            <label for="sort_asc">昇順</label>
            <input type="radio" name="sortOrder" value="desc" id="sort_desc" <c:if test="${sortOrder eq 'desc'}"></c:if>
            <label for="sort_desc">降順</label>
            <input type="submit" value="検索・並び替え">
        </form>
        
    </div>
<% if (list == null || list.isEmpty()) { %>
    <p class="nodata">データが登録されていません</p>
<% } else { %>
    <table border="1">
    <tr><th>操作</th><th>ID</th><th>氏名</th><th>性別</th><th>備考</th></tr>
    <% for (Shain s : list) { %>
    <tr>
        <td>
            <a href="maintenance?action=edit&id=<%= s.getId() %>">編集</a> |
            <a href="maintenance?action=delete&id=<%= s.getId() %>">削除</a>
        </td>
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
