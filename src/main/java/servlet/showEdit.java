package servlet;

import java.io.IOException;
import java.rmi.ServerException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Shain;
import model.ShainDAO;

public class showEdit implements Action{
	private ShainDAO shainDAO = new ShainDAO();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
        int editId = Integer.parseInt(request.getParameter("id"));
        Shain editShain = shainDAO.findById(editId);
        request.setAttribute("shain", editShain);
		return "/WEB-INF/shain_edit.jsp";
	}

}
