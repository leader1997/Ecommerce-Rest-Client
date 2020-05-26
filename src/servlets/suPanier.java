package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbInteraction.dbInteraction;
import wspub.Panier;

@WebServlet("/suPanier")
public class suPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("idp")!=null) {
			int idp=Integer.parseInt(request.getParameter("idp"));
			String sql="delete from panier where idp="+idp;
			dbInteraction.connect();
			dbInteraction.Maj(sql);
			dbInteraction.disconnect();
			//------------------------------------
			HttpSession ses=request.getSession();
			ArrayList<Panier> A=(ArrayList<Panier>)ses.getAttribute("panier");
			
			for(int i=0;i<A.size();i++) {
				if(A.get(i).getIdp()==idp) {
					A.remove(i);
				}
			}
			ses.setAttribute("panier", A);
			response.sendRedirect("monPanier.jsp");
		}
		if(request.getParameter("idl")!=null) {
			int idl=Integer.parseInt(request.getParameter("idl"));
			HttpSession ses=request.getSession();
			ArrayList<Panier> A=(ArrayList<Panier>)ses.getAttribute("panier");
			
			for(int i=0;i<A.size();i++) {
				if(A.get(i).getLivre().getId()==idl) {
					A.remove(i);
				}
			}
			ses.setAttribute("panier", A);
			response.sendRedirect("monPanier.jsp");
		}
	}


}
