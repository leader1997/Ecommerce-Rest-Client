package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbInteraction.demandes;
import wspub.Client;

/**
 * Servlet implementation class insc
 */
@WebServlet("/insc")
public class insc extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom =request.getParameter("nom");
		String prenom =request.getParameter("prenom");
		String email =request.getParameter("email");
		String pwd =request.getParameter("pwd");
		String adresse =request.getParameter("adresse");
		int cb=Integer.parseInt(request.getParameter("cb"));
		System.out.println(cb);
		demandes d=new demandes();
		
			Client c=new Client(nom, prenom, email, pwd, adresse, cb);
			System.out.println(c.toString());
			if(d.ClientNewCompte(c)) {
				
				HttpSession ses=request.getSession();
				ses.setAttribute("user",c);
				response.sendRedirect("Acceuil.jsp?ec=0");
			
			}else {
				response.sendRedirect("Acceuil.jsp?ec=3");
			}
	

}
}