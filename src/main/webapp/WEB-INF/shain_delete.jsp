<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Shain" %>
<%
    Shain s = (Shain) request.getAttribute("shain");
%>
<html>
<head>
    <title>削除確認</title>
       <style>
        @charset "UTF-8";
        body {
            font-family: "Segoe UI","Hiragino Kaku Gothic ProN","Meiryo",sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;  
        }

        h1 {
            margin: 2rem 0 1rem;
            color: #e74c3c;
            text-align: center;   
        }
        .container {
            width: 60%;
            max-width: 600px;
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            text-align: left;      
            }

        p {
            margin: 1rem 0;
            font-size: 1rem;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 1rem 0 2rem;
        }

        ul li {
            padding: 0.6rem 0;
            border-bottom: 1px solid #eee;
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

        
        .back_btn {
            margin-top: 1.5rem;
        }

        a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>削除確認</h2>
<p>以下のデータを削除してよろしいですか？</p>
<ul>
    <li>氏名: <%= s.getName() %></li>
    <li>性別: <%= s.getGenderLabel() %></li>
    <li>備考:
        <%= (s.getNote() == null || s.getNote().trim().isEmpty())
                ? "(登録されていません)"
                : s.getNote() %>
    </li>
</ul>
<form action="maintenance" method="post">
    <input type="hidden" name="action" value="executeDelete">
    <input type="hidden" name="id" value="<%= s.getId() %>">
    <input type="submit" value="削除">
</form>
<p><a href="maintenance">キャンセル</a></p>
</body>
</html>
