<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Shain" %>
<%
    Shain s = (Shain) request.getAttribute("shain");
%>
<html>
<head>
    <title>社員編集</title>
        <style>
        @charset "UTF-8";
        body {
            font-family: "Segoe UI","Hiragino Kaku Gothic ProN","Meiryo",sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        
        h2 {
        	margin-left:17.5vw;
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
            width: 60%;
            margin: 0 auto;
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
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
        
        .back_list{
        	margin-left:17.5vw
        }
    </style>
    <script>
        function validateForm() {
            const name = document.forms["shainForm"]["name"].value;
            const gender = document.forms["shainForm"]["gender"].value;
            if (name === "" || gender === "") {
                alert("氏名と性別は必須です。");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<h2>社員編集</h2>
<form name="shainForm" action="maintenance" method="post" onsubmit="return validateForm()">
    <input type="hidden" name="action" value="executeUpdate">
    <input type="hidden" name="id" value="<%= s.getId() %>">
    氏名: <input type="text" name="shimei" value="<%= s.getName() %>" ><br>
    性別:
    <input type="radio" name="seibetsu" value="1" <%= s.getGender().equals("1") ? "checked" : "" %>>男性
    <input type="radio" name="seibetsu" value="2" <%= s.getGender().equals("2") ? "checked" : "" %>>女性
    <input type="radio" name="seibetsu" value="3" <%= s.getGender().equals("3") ? "checked" : "" %>>その他<br>
    備考: <textarea id="bikou" name="bikou" rows="4"><%= s.getNote() %></textarea><br>
    <input type="submit" value="更新">
</form>
<p class="back_list"><a href="maintenance">一覧に戻る</a></p>
</body>
</html>
