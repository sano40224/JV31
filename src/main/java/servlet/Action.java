package servlet;

import java.io.IOException;
import java.rmi.ServerException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Action {
	String execute(HttpServletRequest request,HttpServletResponse response) throws ServerException,IOException;
	
}
