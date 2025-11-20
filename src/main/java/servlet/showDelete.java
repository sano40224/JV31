package servlet;

import java.io.IOException;
import java.rmi.ServerException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Shain;
import model.ShainDAO;

public class showDelete implements Action {
	private ShainDAO shainDAO = new ShainDAO();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
        int deleteId = Integer.parseInt(request.getParameter("id"));
        Shain deleteShain = shainDAO.findById(deleteId);
        request.setAttribute("shain", deleteShain);
		return "/WEB-INF/shain_delete.jsp";
	}
	
}
