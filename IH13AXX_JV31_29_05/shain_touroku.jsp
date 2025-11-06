<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String name ="佐野裕城";
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>社員情報登録フォーム</title>
</head>
<body>
    <!-- フォームコンテナ -->
    <div>
        <h1>社員情報登録</h1>

        <!-- 社員情報入力フォーム -->
        <form action="/250627_ShainDB/shain_register" method="POST">
            <input type="hidden" name="ユーザーID" value="">

            <!-- 氏名入力フィールド -->
            <div>
                <label for="氏名">氏名:</label>
                <input type="text" id="氏名" name="氏名" required>
            </div>

            <!-- 性別選択フィールド (ラジオボタン) -->
            <div>
                <label>性別:</label>
                <div>
                    <label>
                        <input type="radio" name="性別" value="M" required>
                        <span>男性</span>
                    </label>
                    <label>
                        <input type="radio" name="性別" value="W" required>
                        <span>女性</span>
                    </label>
                </div>
            </div>

            <!-- 備考入力フィールド (テキストエリア) -->
            <div>
                <label for="備考">備考:</label>
                <textarea id="備考" name="備考" rows="4"></textarea>
            </div>

            <!-- 送信ボタン -->
            <div>
                <button type="submit">
                    登録
                </button>
            </div>
        </form>
    </div>
    <p><a href="/250627_ShainDB/shain_list">社員一覧を表示する</a></p>
</body>
</html>
