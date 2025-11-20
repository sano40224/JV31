package servlet;

import java.io.IOException;
import java.rmi.ServerException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.ShainDAO;

public class executeDelete implements Action{
	private ShainDAO shainDAO = new ShainDAO();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		
        int deleteId = Integer.parseInt(request.getParameter("id"));
        shainDAO.delete(deleteId);
		return "/maintenance?action=list";
	}

}
