package servlets;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DbInteraction.demandes;
import wspub.Livre;

/**
 * Servlet implementation class recLivre
 */
@WebServlet("/recLivre")
public class recLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		ArrayList<Livre>A1=new ArrayList<Livre>();
		demandes D=new demandes();
		String M=request.getParameter("recherche");
		A1=D.getRec(M);
		
		request.setAttribute("tous", A1);
		
		
		request.getRequestDispatcher("/search.jsp").forward(request, response);
	}
}
