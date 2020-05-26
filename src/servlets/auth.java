package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import DbInteraction.demandes;

import wspub.*;

/**
 * Servlet implementation class auth
 */
@WebServlet("/auth")
public class auth extends HttpServlet {
	private static final long serialVersionUID = 1L;
    	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		
		demandes d=new demandes();
		Client c= new Client();
		try {
			
	if(d.recClient(email, pwd).getId()!=0) {
				c=d.recClient(email, pwd);
				System.out.println("servlet :"+c.toString());
				HttpSession ses=request.getSession();
				ses.setAttribute("user", c);
				if(ses.getAttribute("panier")!=null) {
					ArrayList<Panier> A=(ArrayList<Panier>)ses.getAttribute("panier");
					for(Panier i:A) {
						d.ajouterP(c.getId(),i.getLivre().getId(),i.getQte());
					}
					A=d.selectLivreC(c.getId());
					ses.setAttribute("panier", A);
				}
				else {
					ArrayList<Panier> A=new ArrayList<Panier>();
					A=d.selectLivreC(c.getId());
					ses.setAttribute("panier", A);
				}
				response.sendRedirect("Acceuil.jsp?ec=0");
	}else {
				
				response.sendRedirect("Acceuil.jsp?ec=1");
			}
		} catch (Exception e) {
			response.sendRedirect("Acceuil.jsp");
		}
		
	}

}
