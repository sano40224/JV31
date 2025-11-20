package servlet;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Shain;
import model.ShainDAO;

public class mainList implements Action{
	private ShainDAO shainDAO = new ShainDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		
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
        
		return "/WEB-INF/shain_list.jsp";
	}
}

