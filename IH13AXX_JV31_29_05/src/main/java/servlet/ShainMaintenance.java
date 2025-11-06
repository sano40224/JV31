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

        switch (action==null?"list":action) {
            case "add":
            	//TODO 新規登録 初期表示
                break;

            case "edit":
            	//TODO 更新 初期表示
                break;

            case "delete":
            	//TODO 削除 初期表示
                break;

            default:
            	//一覧表示
                List<Shain> listShain = shainDAO.findAll();
                request.setAttribute("shainList", listShain);
                RequestDispatcher dispatcherList = request.getRequestDispatcher("/WEB-INF/shain_list.jsp");
                dispatcherList.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        switch (action) {
            case "add":
                //TODO 新規登録 保存処理
                break;

            case "update":
                //TODO 更新 保存処理
                break;

            case "delete":
                //TODO 削除 保存処理
                break;

            default:
            	//一覧表示 リダイレクト(TODO:絞り込み検索する場合、GETとPOSTを同じメソッドで行うと良い)
                response.sendRedirect(request.getContextPath() + "/maintenance");
                break;
        }
    }
}
