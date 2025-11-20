package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/maintenance")
public class ShainMaintenance extends HttpServlet {

    private Map<String, Action> actionMap = new HashMap<>();

    @Override
    public void init() throws ServletException {
        // action名と実行するActionクラスをマッピング
        
        // GET (画面表示系)
        actionMap.put("list", new mainList());
        actionMap.put("add", new showAdd());
        actionMap.put("edit", new showEdit());
        actionMap.put("delete", new showDelete());
        
        // POST (実行系)
        actionMap.put("executeAdd", new executeAdd());
        actionMap.put("executeUpdate", new executeEdit());
        actionMap.put("executeDelete", new executeDelete());
    }

    // doGet, doPostをserviceメソッドで共通化
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // 1. actionパラメータを取得
        String actionName = request.getParameter("action");
        
        // "action" が null または空、または "list" の場合
        // (doPostでlistを呼ぶのは検索実行時)
        if (actionName == null || actionName.isEmpty() || 
            (request.getMethod().equals("POST") && actionName.equals("list"))) {
            
            actionName = "list";
        }
        
        // 2. 対応するActionクラスを取得
        Action action = actionMap.get(actionName);
        
        if (action == null) {
            // "add", "edit", "delete" はGETリクエスト時のみ有効
            // (POST時は "executeAdd" などになる)
            if (request.getMethod().equals("GET")) {
                 // GETで action=list 以外が指定された場合
                 action = actionMap.get(actionName);
            }
            
            // それでも見つからない場合はデフォルト（一覧）
            if (action == null) {
                action = actionMap.get("list");
            }
        }
        
        String viewPath = null;
        try {
            // 3. Actionクラスの実行
            viewPath = action.execute(request, response);
            
        } catch (Exception e) {
            throw new ServletException(e);
        }

        // 4. viewPathに基づいてフォワードまたはリダイレクト
        if (viewPath.startsWith("redirect:")) {
            // "redirect:/maintenance?action=list" のような形式
            String redirectPath = viewPath.substring("redirect:".length());
            response.sendRedirect(request.getContextPath() + redirectPath);
        } else {
            // "/WEB-INF/shain_list.jsp" のような形式
            RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
            dispatcher.forward(request, response);
        }
    }
}
