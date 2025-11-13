package servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Shain;
import model.ShainDAO;

public class ShainMaintenance extends HttpServlet {

    private ShainDAO shainDAO = new ShainDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action == null ? "list" : action) {
            case "add":
                // 新規登録 初期表示
                RequestDispatcher dispatcherAdd = request.getRequestDispatcher("/WEB-INF/shain_touroku.jsp");
                dispatcherAdd.forward(request, response);
                break;

            case "edit":
                // 更新 初期表示
                int editId = Integer.parseInt(request.getParameter("id"));
                Shain editShain = shainDAO.findById(editId);
                request.setAttribute("shain", editShain);
                RequestDispatcher dispatcherEdit = request.getRequestDispatcher("/WEB-INF/shain_edit.jsp");
                dispatcherEdit.forward(request, response);
                break;

            case "delete":
                // 削除 初期表示
                int deleteId = Integer.parseInt(request.getParameter("id"));
                Shain deleteShain = shainDAO.findById(deleteId);
                request.setAttribute("shain", deleteShain);
                RequestDispatcher dispatcherDelete = request.getRequestDispatcher("/WEB-INF/shain_delete.jsp");
                dispatcherDelete.forward(request, response);
                break;

            default:
                // 一覧表示 (初期表示)
                listShain(request, response);
                break;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "list";
        }
        String idStr = null;
        String name = null;
        String gender = null;
        String note = null;
        Shain shain = new Shain();
        
        //action
        switch (action) {
            case "add":
                // 新規登録 保存処理
                name = request.getParameter("shimei");
                gender = request.getParameter("seibetsu");
                note = request.getParameter("bikou");

                if (name == null || name.trim().isEmpty() ||
                        gender == null || gender.trim().isEmpty()) {
                    request.setAttribute("shimeiError", "氏名と性別は必須です");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/shain_touroku.jsp");
                    dispatcher.forward(request, response);
                    return;
                }

                shain = new Shain();
                shain.setName(name);
                shain.setGender(gender);
                shain.setNote(note);
                
                shainDAO.insert(shain);
                response.sendRedirect(request.getContextPath() + "/maintenance?action=list");
                break;

            case "update":
                // 更新 保存処理
                idStr = request.getParameter("id");
                name = request.getParameter("shimei");
                gender = request.getParameter("seibetsu");
                note = request.getParameter("bikou");
                
                if (idStr == null || idStr.trim().isEmpty() ||
                        name == null || name.trim().isEmpty() ||
                        gender == null || gender.trim().isEmpty()) {
                    request.setAttribute("shimeiError", "氏名と性別は必須です");
                    RequestDispatcher dispatcherEdit = request.getRequestDispatcher("/WEB-INF/shain_edit.jsp");
                    dispatcherEdit.forward(request, response);
                    return;
                }

                shain = new Shain();
                shain.setId(Integer.parseInt(idStr));
                shain.setName(name);
                shain.setGender(gender);
                shain.setNote(note);

                shainDAO.update(shain);
                response.sendRedirect(request.getContextPath() + "/maintenance?action=list");
                break;

            case "delete":
                // 削除 保存処理
                int deleteId = Integer.parseInt(request.getParameter("id"));
                shainDAO.delete(deleteId);
                response.sendRedirect(request.getContextPath() + "/maintenance?action=list");
                break;

            default:
                //一覧表示 (検索実行時)
                listShain(request, response);
                break;
        }
    }
    private void listShain(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 文字コードを設定
        request.setCharacterEncoding("UTF-8");

        // リクエストパラメータから検索キーワードとソート条件を取得
        String searchName = request.getParameter("searchName");
        String gender = request.getParameter("gender");
        String sortColumn = request.getParameter("sortColumn");
        String sortOrder = request.getParameter("sortOrder");
        
        System.out.println("listShainメソッドが受け取ったパラメータ:");
        System.out.println("  - searchName: [" + searchName + "]");
        System.out.println("  - gender:     [" + gender + "]");
        System.out.println("  - sortColumn: [" + sortColumn + "]");
        System.out.println("  - sortOrder:  [" + sortOrder + "]"); 

        // DAOの新しい検索メソッドを呼び出す
        List<Shain> listShain = shainDAO.findWithCriteria(searchName, gender, sortColumn, sortOrder);
        
        // 検索結果と検索条件をリクエストスコープに保存（JSPで表示するため）
        request.setAttribute("shainList", listShain);
        request.setAttribute("searchName", searchName);
        request.setAttribute("gender", gender);
        request.setAttribute("sortColumn", sortColumn);
        request.setAttribute("sortOrder", sortOrder);
        
        // JSPへフォワード
        RequestDispatcher dispatcherList = request.getRequestDispatcher("/WEB-INF/shain_list.jsp");
        dispatcherList.forward(request, response);
    }
}
