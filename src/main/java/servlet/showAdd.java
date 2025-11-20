package servlet;

import java.io.IOException;
import java.rmi.ServerException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class showAdd implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		
		return "/WEB-INF/shain_touroku.jsp";
	}
}
