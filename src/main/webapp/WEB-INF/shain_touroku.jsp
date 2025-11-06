<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>社員新規登録</title>
    <style>
        @charset "UTF-8";
        body {
            font-family: "Segoe UI","Hiragino Kaku Gothic ProN","Meiryo",sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1{
        	margin-left:18vw;
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
        
        .back_btn{
        	margin-left:18vw;
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
    </style>
</head>
<body>

<h1>社員新規登録</h1>

<form action="maintenance" method="post">
    <input type="hidden" name="action" value="add">
    氏名: <input type="text" name="shimei" required><br>
    性別:
    <input type="radio" name="seibetsu" value="1" required>男性
    <input type="radio" name="seibetsu" value="2">女性
    <input type="radio" name="seibetsu" value="3">その他<br>
    備考: <textarea id="bikou" name="bikou" rows="4"></textarea><br>
    <input type="submit" value="登録">
</form>
<p class="back_btn"><a href="maintenance">一覧に戻る</a></p>
</form>

</body>
</html>
