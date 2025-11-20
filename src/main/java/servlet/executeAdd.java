package servlet;

import java.io.IOException;
import java.rmi.ServerException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Shain;
import model.ShainDAO;

public class executeAdd implements Action {
	
	private ShainDAO shainDAO = new ShainDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
        String name = request.getParameter("shimei");
        String gender = request.getParameter("seibetsu");
        String note = request.getParameter("bikou");

        if (name == null || name.trim().isEmpty() ||
                gender == null || gender.trim().isEmpty()) {
            request.setAttribute("shimeiError", "氏名と性別は必須です");
            return "/WEB-INF/shain_touroku.jsp";
        }

        Shain shain = new Shain();
        shain.setName(name);
        shain.setGender(gender);
        shain.setNote(note);
        
        shainDAO.insert(shain);
		return "redirect:/maintenance?action=list";
	}

}
